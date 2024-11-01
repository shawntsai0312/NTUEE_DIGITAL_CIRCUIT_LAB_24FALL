module I2cInitializer (
    input i_rst_n,
    input i_clk,
    input i_start,
    /*------------------------------------------- Testbench use only -------------------------------------------*/
        // output [3:0] o_bit_counter, // testbench use only
        // output [1:0] o_byte_counter, // testbench use only
        // output [3:0] o_command_counter, // testbench use only
    output o_finished,
    output o_sclk,
    inout io_sdat,
    output o_oen // true for io_sdat output, false for input
);
/*-------------------------------------------------- Parameters --------------------------------------------------*/
    // Data to be sent to the audio codec, total 11 commands
        // [23:17]: slave address, 0011010
        // [16]: read/write bit, 0 for write, 1 for read
        // [15:9]: register address
        // [8:0]: register data
        // checkout doc/Lab3_sup1_audiocodec.pdf for more details
    parameter COMMAND_COUNT = 10;
    parameter [23:0] LEFT_LINE_IN                     = 24'b0011_0100_000_0000_0_1001_0111; // to register 0x00
    parameter [23:0] RIGHT_LINE_IN                    = 24'b0011_0100_000_0001_0_1001_0111; // to register 0x01
    parameter [23:0] LEFT_HEADPHONE_OUT               = 24'b0011_0100_000_0010_0_0111_1001; // to register 0x02
    parameter [23:0] RIGHT_HEADPHONE_OUT              = 24'b0011_0100_000_0011_0_0111_1001; // to register 0x03
    parameter [23:0] ANALOGUE_AUDIO_PATH_CONTROL      = 24'b0011_0100_000_0100_0_0001_0101; // to register 0x04
    parameter [23:0] DIGITAL_AUDIO_PATH_CONTROL       = 24'b0011_0100_000_0101_0_0000_0000; // to register 0x05
    parameter [23:0] POWER_DOWN_CONTROL               = 24'b0011_0100_000_0110_0_0000_0000; // to register 0x06
    parameter [23:0] DIGITAL_AUDIO_INTERFACE_FORMAT   = 24'b0011_0100_000_0111_0_0100_0010; // to register 0x07
    parameter [23:0] SAMPLING_CONTROL                 = 24'b0011_0100_000_1000_0_0001_1001; // to register 0x08
    parameter [23:0] ACTIVE_CONTROL                   = 24'b0011_0100_000_1001_0_0000_0001; // to register 0x09

    /*----------------------------------------------- DON'T SEND -----------------------------------------------*/
    parameter [23:0] RESET                            = 24'b0011_0100_000_1111_0_0000_0000; // to register 0x0F 

    

    // State
    localparam S_IDLE  = 0; // initial state
    localparam S_START = 1; // start signal
    localparam S_SETUP = 2; // SCLK = 0, set SDAT
    localparam S_SEND_BEFORE  = 3; // SCLK = 1, send SDAT
    localparam S_SEND = 4; // send buffer state
    localparam S_ACK_BEFORE   = 5; // read SDAT when SCLK = 1
    localparam S_ACK = 6; // ack buffer state
    localparam S_ACK_AFTER = 7; // read SDAT when SCLK = 0
    localparam S_STOP_BUFFER = 8; // stop buffer state
    localparam S_STOP  = 9; // one command finished
    

/*------------------------------------------------- registers -------------------------------------------------*/
    // state registers
    reg [3:0] state_r, state_w;

    // counter registers
    reg [3:0] bit_counter_r, bit_counter_w; // bit count for the 8-bit data (8)
    reg [1:0] byte_counter_r, byte_counter_w; // byte count for the 3 bytes (3)
    reg [3:0] command_counter_r, command_counter_w; // command count for the 10 commands  (11) 

    // output registers
    reg o_finished_r, o_finished_w;
    reg [23:0] o_data_r, o_data_w;

/*--------------------------------------------- Output assignment ---------------------------------------------*/
    assign o_finished = o_finished_r;

    // SCLK = 1 when not in S_SETUP or S_SEND_BEFORE or S_ACK_BEFORE
    assign o_sclk = o_finished_r ? 1'b1 : (state_r == S_SETUP || state_r == S_SEND_BEFORE || state_r == S_ACK_BEFORE || state_r == S_ACK_AFTER) ? 1'b0 : 1'b1;

    assign o_oen = (state_r == S_ACK_BEFORE || state_r == S_ACK || state_r == S_ACK_AFTER) ? 1'b0 : 1'b1;
    // when o_oen = 1
        // 1. state_r = S_IDLE, o_sdat = 1
        // 2. state_r = S_START, o_sdat = 0
        // 3. state_r = S_STOP_BUFFER, o_sdat = 0
        // 4. state_r = S_STOP, o_sdat = 1
        // 5. else, o_sdat = o_data_r[23]
    wire o_sdat =   o_finished_r                ? 1'b1 :
                    (state_r == S_IDLE)         ? 1'b1 :
                    (state_r == S_START)        ? 1'b0 :
                    (state_r == S_STOP_BUFFER)  ? 1'b0 :
                    (state_r == S_STOP)         ? 1'b1 :
                                            o_data_r[23];

    // wire o_sdat =  (state_r == S_IDLE) ? 1'b1 : (state_r == S_START) ? 1'b0 : (state_r == S_STOP) ? 1'b1 : o_data_r[23];
    assign io_sdat = o_oen ? o_sdat : 1'bz;
    // assign io_sdat = o_oen ? o_data_r[23] : 1'bz; 

/*--------------------------------------------- Testbench use only --------------------------------------------*/
    // assign o_bit_counter = bit_counter_r; // testbench use only
    // assign o_byte_counter = byte_counter_r; // testbench use only
    // assign o_command_counter = command_counter_r; // testbench use only
    

/*-------------------------------------------- Combinational logic --------------------------------------------*/
    // state logic
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: if(i_start) state_w = S_START;
            S_START: state_w = S_SETUP;
            S_SETUP: begin
                if(byte_counter_r == 3) state_w = S_STOP_BUFFER;
                else begin
                    if(bit_counter_r == 8)  state_w = S_ACK_BEFORE;
                    else                    state_w = S_SEND_BEFORE;
                end
            end
            S_SEND_BEFORE: state_w = S_SEND;
            S_SEND: state_w = S_SETUP;
            S_ACK_BEFORE:  state_w = S_ACK;
            S_ACK: state_w = S_ACK_AFTER;
            S_ACK_AFTER: state_w = S_SETUP;
            S_STOP_BUFFER: state_w = S_STOP;
            S_STOP: state_w = S_IDLE;
            default: begin
                state_w = S_IDLE;
            end
        endcase
    end

    // bit counter logic
    always @(*) begin
        bit_counter_w = bit_counter_r;
        case(state_r)
            S_START: bit_counter_w = 0;
            S_SEND_BEFORE:  bit_counter_w = bit_counter_r + 1;
            S_ACK_BEFORE:   bit_counter_w = 0;
        endcase
    end

    // byte counter logic
    always @(*) begin
        byte_counter_w = byte_counter_r;
        case(state_r)
            S_START: byte_counter_w = 0;
            S_ACK_BEFORE:   byte_counter_w = byte_counter_r + 1;
        endcase
    end

    // command counter logic
    always @(*) begin
        command_counter_w = command_counter_r;
        case(state_r)
            S_STOP: if(command_counter_r < COMMAND_COUNT-1)  command_counter_w = command_counter_r + 1;
        endcase
    end

    // finished logic
    always @(*) begin
        o_finished_w = o_finished_r;
        case(state_r)
            S_STOP: begin
                if(command_counter_r == COMMAND_COUNT-1) o_finished_w = 1;
            end
        endcase
    end

    // data logic
    always @(*) begin
        o_data_w = o_data_r;
        case(state_r)
            S_SETUP: begin
                // set o_data_w if state_w is S_SEND_BEFORE
                // S_SEND_BEFORE and sending the MSB of the command
                if(bit_counter_r == 0 && byte_counter_r == 0) begin
                    case(command_counter_r)
                        0:  o_data_w = LEFT_LINE_IN;
                        1:  o_data_w = RIGHT_LINE_IN;
                        2:  o_data_w = LEFT_HEADPHONE_OUT;
                        3:  o_data_w = RIGHT_HEADPHONE_OUT;
                        4:  o_data_w = ANALOGUE_AUDIO_PATH_CONTROL;
                        5:  o_data_w = DIGITAL_AUDIO_PATH_CONTROL;
                        6:  o_data_w = POWER_DOWN_CONTROL;
                        7:  o_data_w = DIGITAL_AUDIO_INTERFACE_FORMAT;
                        8:  o_data_w = SAMPLING_CONTROL;
                        9:  o_data_w = ACTIVE_CONTROL;
                    endcase
                end
                // S_SEND but not sending the MSB of the command
                else if (bit_counter_r < 8) o_data_w = o_data_r << 1; 
            end
        endcase
    end

/*----------------------------------------------- Sequential logic ----------------------------------------------*/
    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r             <= S_IDLE;
            bit_counter_r       <= 0;
            byte_counter_r      <= 0;
            command_counter_r   <= 0;
            o_finished_r        <= 0;
            o_data_r            <= 0;
        end 
        else begin
            state_r             <= state_w;
            bit_counter_r       <= bit_counter_w;
            byte_counter_r      <= byte_counter_w;
            command_counter_r   <= command_counter_w;
            o_finished_r        <= o_finished_w;
            o_data_r            <= o_data_w;
        end
    end
endmodule