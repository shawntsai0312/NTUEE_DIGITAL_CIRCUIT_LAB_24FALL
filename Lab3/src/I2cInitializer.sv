// module I2cInitializer (
//     input i_rst_n,
//     input i_clk,
//     input i_start,
//     /*------------------------------------------- Testbench use only -------------------------------------------*/
//         // output [3:0] o_bit_counter, // testbench use only
//         // output [1:0] o_byte_counter, // testbench use only
//         // output [3:0] o_command_counter, // testbench use only
//     output o_finished,
//     output o_sclk,
//     inout io_sdat,
//     output o_oen // true for io_sdat output, false for input
// );
// /*-------------------------------------------------- Parameters --------------------------------------------------*/
//     // Data to be sent to the audio codec
//         // [23:17]: slave address, 0011010
//         // [16]: read/write bit, 0 for write, 1 for read
//         // [15:9]: register address
//         // [8:0]: register data
//         // checkout doc/Lab3_sup1_audiocodec.pdf for more details
//     parameter [23:0] LEFT_LINE_IN                     = 24'b0011_0100_000_0000_0_1001_0111; // to register 0x00
//     parameter [23:0] RIGHT_LINE_IN                    = 24'b0011_0100_000_0001_0_1001_0111; // to register 0x01
//     parameter [23:0] LEFT_HEADPHONE_OUT               = 24'b0011_0100_000_0010_0_0111_1001; // to register 0x02
//     parameter [23:0] RIGHT_HEADPHONE_OUT              = 24'b0011_0100_000_0011_0_0111_1001; // to register 0x03
//     parameter [23:0] ANALOGUE_AUDIO_PATH_CONTROL      = 24'b0011_0100_000_0100_0_0001_0101; // to register 0x04
//     parameter [23:0] DIGITAL_AUDIO_PATH_CONTROL       = 24'b0011_0100_000_0101_0_0000_0000; // to register 0x05
//     parameter [23:0] POWER_DOWN_CONTROL               = 24'b0011_0100_000_0110_0_0000_0000; // to register 0x06
//     parameter [23:0] DIGITAL_AUDIO_INTERFACE_FORMAT   = 24'b0011_0100_000_0111_0_0100_0010; // to register 0x07
//     parameter [23:0] SAMPLING_CONTROL                 = 24'b0011_0100_000_1000_0_0001_1001; // to register 0x08
//     parameter [23:0] ACTIVE_CONTROL                   = 24'b0011_0100_000_1001_0_0000_0001; // to register 0x09
//     parameter [23:0] RESET                            = 24'b0011_0100_000_1111_0_0000_0000; // to register 0x0F

//     // State
//     localparam S_IDLE  = 0; // initial state
//     localparam S_START = 1; // start signal
//     localparam S_SETUP = 2; // SCLK = 0, set SDAT
//     localparam S_SEND  = 3; // SCLK = 1, send SDAT
//     localparam S_ACK   = 4; // read SDAT when SCLK = 1
//     localparam S_STOP  = 5; // one command finished
//     localparam S_STOP_BUFFER = 6; // stop buffer state

// /*------------------------------------------------- registers -------------------------------------------------*/
//     // state registers
//     reg [2:0] state_r, state_w;

//     // counter registers
//     reg [3:0] bit_counter_r, bit_counter_w; // bit count for the 8-bit data (8)
//     reg [1:0] byte_counter_r, byte_counter_w; // byte count for the 3 bytes (3)
//     reg [3:0] command_counter_r, command_counter_w; // command count for the 10 commands  (11) 

//     // output registers
//     reg o_finished_r, o_finished_w;
//     reg [23:0] o_data_r, o_data_w;

// /*--------------------------------------------- Output assignment ---------------------------------------------*/
//     assign o_finished = o_finished_r;

//     // SCLK = 1 when not in S_SETUP
//     assign o_sclk = (state_r != S_SETUP);

//     assign o_oen = (state_r != S_ACK);
//     // when o_oen = 1
//         // 1. state_r = S_IDLE, o_sdat = 1
//         // 2. state_r = S_START, o_sdat = 0
//         // 3. state_r = S_STOP_BUFFER, o_sdat = 0
//         // 4. state_r = S_STOP, o_sdat = 1
//         // 5. state_r = S_SEND, o_sdat = o_data_r[23]
//     wire o_sdat = (state_r == S_IDLE) ? 1'b1 : (state_r == S_START) ? 1'b0 : (state_r == S_STOP_BUFFER) ? 1'b0 : (state_r == S_STOP) ? 1'b1 : o_data_r[23];


//     // wire o_sdat =  (state_r == S_IDLE) ? 1'b1 : (state_r == S_START) ? 1'b0 : (state_r == S_STOP) ? 1'b1 : o_data_r[23];
//     assign io_sdat = o_oen ? o_sdat : 1'bz;
//     // assign io_sdat = o_oen ? o_data_r[23] : 1'bz; 

// /*--------------------------------------------- Testbench use only --------------------------------------------*/
//     // assign o_bit_counter = bit_counter_r; // testbench use only
//     // assign o_byte_counter = byte_counter_r; // testbench use only
//     // assign o_command_counter = command_counter_r; // testbench use only
    

// /*-------------------------------------------- Combinational logic --------------------------------------------*/
//     // state logic
//     always @(*) begin
//         state_w = state_r;
//         case(state_r)
//             S_IDLE: if(i_start) state_w = S_START;
//             S_START: state_w = S_SETUP;
//             S_SETUP: begin
//                 if(byte_counter_r == 3) state_w = S_STOP_BUFFER;
//                 else begin
//                     if(bit_counter_r == 8)  state_w = S_ACK;
//                     else                    state_w = S_SEND;
//                 end
//             end
//             S_SEND: state_w = S_SETUP;
//             S_ACK:  state_w = S_SETUP;
//             S_STOP_BUFFER: state_w = S_STOP;
//             S_STOP: begin
//                 if (command_counter_r == 10)    state_w = S_IDLE;
//                 else                            state_w = S_START;
//             end
//             default: begin
//                 state_w = S_IDLE;
//             end
//         endcase
//     end

//     // bit counter logic
//     always @(*) begin
//         bit_counter_w = bit_counter_r;
//         case(state_r)
//             S_START: bit_counter_w = 0;
//             S_SEND:  bit_counter_w = bit_counter_r + 1;
//             S_ACK:   bit_counter_w = 0;
//         endcase
//     end

//     // byte counter logic
//     always @(*) begin
//         byte_counter_w = byte_counter_r;
//         case(state_r)
//             S_START: byte_counter_w = 0;
//             S_ACK:   byte_counter_w = byte_counter_r + 1;
//         endcase
//     end

//     // command counter logic
//     always @(*) begin
//         command_counter_w = command_counter_r;
//         case(state_r)
//             S_IDLE: command_counter_w = 0;
//             S_STOP: command_counter_w = command_counter_r + 1;
//         endcase
//     end

//     // finished logic
//     always @(*) begin
//         o_finished_w = 0;
//         case(state_r)
//             S_STOP: begin
//                 if(command_counter_r == 10) o_finished_w = 1;
//             end
//         endcase
//     end

//     // data logic
//     always @(*) begin
//         o_data_w = o_data_r;
//         case(state_r)
//             S_SETUP: begin
//                 // set o_data_w if state_w is S_SEND
//                 // S_SEND and sending the MSB of the command
//                 if(bit_counter_r == 0 && byte_counter_r == 0) begin
//                     case(command_counter_r)
//                         0:  o_data_w = LEFT_LINE_IN;
//                         1:  o_data_w = RIGHT_LINE_IN;
//                         2:  o_data_w = LEFT_HEADPHONE_OUT;
//                         3:  o_data_w = RIGHT_HEADPHONE_OUT;
//                         4:  o_data_w = ANALOGUE_AUDIO_PATH_CONTROL;
//                         5:  o_data_w = DIGITAL_AUDIO_PATH_CONTROL;
//                         6:  o_data_w = POWER_DOWN_CONTROL;
//                         7:  o_data_w = DIGITAL_AUDIO_INTERFACE_FORMAT;
//                         8:  o_data_w = SAMPLING_CONTROL;
//                         9:  o_data_w = ACTIVE_CONTROL;
//                         10: o_data_w = RESET;
//                     endcase
//                 end
//                 // S_SEND but not sending the MSB of the command
//                 else if (bit_counter_r < 8) o_data_w = o_data_r << 1; 
//             end
//         endcase
//     end

// /*----------------------------------------------- Sequential logic ----------------------------------------------*/
//     always_ff @(posedge i_clk or negedge i_rst_n) begin
//         if (!i_rst_n) begin
//             state_r             <= S_IDLE;
//             bit_counter_r       <= 0;
//             byte_counter_r      <= 0;
//             command_counter_r   <= 0;
//             o_finished_r        <= 0;
//             o_data_r            <= 0;
//         end 
//         else begin
//             state_r             <= state_w;
//             bit_counter_r       <= bit_counter_w;
//             byte_counter_r      <= byte_counter_w;
//             command_counter_r   <= command_counter_w;
//             o_finished_r        <= o_finished_w;
//             o_data_r            <= o_data_w;
//         end
//     end
// endmodule

module I2cInitializer (
	input i_rst_n,
	input i_clk,
	input i_start,
	output o_finished,
	output o_sclk,
	inout io_sdat,
	output o_oen // you are outputing (you are not outputing only when you are "ack"ing.)
);

// TO DO: 
// Sequentially send all Initialization controls
// Each control has 24 bits and 3 acknowlege signals
// for each control : send 8 bits, set data to z to recieve acknowlege , repeat x3
// wait between each transmission

// parameters

parameter Reset                                 = 24'b00110100_000_1111_0_0000_0000;


parameter Analogue_Audio_Path_Control           = 24'b00110100_000_0100_0_0001_0101;
parameter Digital_Audio_Path_Control            = 24'b00110100_000_0101_0_0000_0000;
parameter Power_Down_Control                    = 24'b00110100_000_0110_0_0000_0000;
parameter Digital_Audio_Interface_Format        = 24'b00110100_000_0111_0_0100_0010;
parameter Sampling_Control                      = 24'b00110100_000_1000_0_0001_1001;
parameter Active_Control                        = 24'b00110100_000_1001_0_0000_0001;

parameter Right_Headphone_Out                   = 24'b00110100_000_0011_0_0111_1001;
parameter Left_Headphone_Out                    = 24'b00110100_000_0010_0_0111_1001;
parameter Right_Line_In                         = 24'b00110100_000_0001_0_1001_0111;
parameter Left_Line_In                          = 24'b00110100_000_0000_0_1001_0111;


// STATES declaration
parameter S_IDLE = 0;
parameter S_BUFFER = 1;
parameter S_PREPARE = 2;
parameter S_TRANSMIT = 3;
parameter S_DONE = 4;

// register declaration
logic [2:0] state_w, state_r;

logic [3:0] command_counter_w, command_counter_r; // count the number of commands, 0-6
logic [1:0] bytes_counter_w, bytes_counter_r; //count the number of bytes sent, 0-2
logic [3:0] bits_counter_w, bits_counter_r; // count the number of bits sent 0-7

logic finished_w, finished_r;             // finish signal
logic [23:0] data_w, data_r; //data to be sent

logic sdat_w, sdat_r, sclk_w, sclk_r;
logic oe_w, oe_r;
logic updated_w, updated_r;

// OUTPUT ASSIGNMENT
assign o_sclk = sclk_r;
assign io_sdat = oe_r ? sdat_r : 1'bz;
assign o_finished = finished_r;
assign o_oen = oe_r;
//FINITE STATE MACHINE
always_comb begin
    state_w = state_r;
    case (state_r)
        S_IDLE: begin
            //wait for start signal
            if(i_start) begin
                state_w = S_BUFFER;
            end else begin
                state_w = S_IDLE;
            end
        end 
        S_BUFFER: begin
            state_w = S_PREPARE;
        end
        S_PREPARE: begin
            state_w = S_TRANSMIT;
        end
        S_TRANSMIT: begin
            if(command_counter_r < 8)begin
                if((bytes_counter_r == 3) && sclk_r && sdat_r) begin
                    state_w = S_BUFFER;
                end
            end else begin
                state_w = S_DONE;
            end
           
        end
        S_DONE: begin
            state_w = state_r;
        end
        default: state_w = S_DONE;
    endcase
end

// COMBINATIONAL CIRCUIT
always_comb begin
    command_counter_w = command_counter_r;
    bits_counter_w = bits_counter_r;
    bytes_counter_w = bytes_counter_r;
    sdat_w = sdat_r;
    data_w = data_r;
    sclk_w = sclk_r;
    oe_w = 1;
    finished_w = 0;
    updated_w = updated_r;
    case (state_r)
        S_IDLE: begin
            //wait for start signal
            finished_w = 0;
        end 
        S_BUFFER: begin
           sdat_w = 0;
        end
        S_PREPARE: begin
            sclk_w = 0;
            command_counter_w = command_counter_r + 1;
            //initialize counters
            bytes_counter_w = 0;
            bits_counter_w = 0;
            //load data
            case (command_counter_r) // current command
                0: begin
                    data_w = Reset;
                end 
                1: begin
                    data_w = Analogue_Audio_Path_Control;
                end
                2: begin
                    data_w = Digital_Audio_Path_Control;  
                end
                3: begin
                    data_w = Power_Down_Control;
                end
                4: begin
                    data_w = Digital_Audio_Interface_Format;
                end
                5: begin
                    data_w = Sampling_Control;
                end
                // 6: data_w = Right_Headphone_Out;
                // 7: data_w = Left_Headphone_Out;
                // 8: data_w = Right_Line_In;
                // 9: data_w = Left_Line_In;
                default: 
                    data_w = Active_Control;
            endcase
        end
        S_TRANSMIT: begin
            if((bytes_counter_r < 3) && (command_counter_r < 8)) begin
                if( bits_counter_r < 8) begin

                    if(!sclk_r && !updated_r) begin // sclk is low -> load data to sdat
                        sdat_w = data_r[23];
                        sclk_w = 0 ;
                        data_w = data_r << 1;
                        updated_w = 1;
                    end

                    if(updated_r && !sclk_r) begin // finished updating data -> set sclk high to start transmission
                        sclk_w = 1;
                        
                    end
                    
                    if(sclk_r)begin // sclk if high -> transmit data
                        bits_counter_w = bits_counter_r + 1;
                        sclk_w = 0;
                        updated_w = 0;
                        if(bits_counter_r == 7)begin
                            oe_w = 0;
                        end else begin
                            oe_w = 1;
                        end
                    end

                end else begin // set oe to 0 to recieve acknowledge
                    if(!sclk_r && !updated_r) begin // sclk is low
                        oe_w = 0;  
                        sclk_w = 1;
                        updated_w = 1;
                    end

                    if(sclk_r && updated_r) begin // set sclk high to start transmission
                        oe_w = 0;
                        sclk_w = 0;

                    end
                    
                    if(!sclk_r && updated_r)begin // sclk if high -> transmit data
                        bits_counter_w = 0;
                        sclk_w = 0;
                        oe_w = 1;
                        updated_w = 0;
                        bytes_counter_w = bytes_counter_r+1;
                    end
                end
                //  else begin // finish transmitting data -> set sdat to high
                    
                //     bytes_counter_w = bytes_counter_r + 1;
                //     bits_counter_w = 0; // reset bit counter
                    
                // end
            end else begin
                if(!sclk_r)begin
                    sdat_w = 0;
                    sclk_w = 1;
                    bytes_counter_w = bytes_counter_r;
                    bits_counter_w = bits_counter_r;
                    updated_w = 0;
                end // reset bytes counter;
                else begin
                    sdat_w = 1;
                    //command_counter_w = command_counter_r + 1; 
                    bytes_counter_w = bytes_counter_r;
                    bits_counter_w = bits_counter_r;
                    updated_w = 0;
                end

                
            end
            
            
        end
        S_DONE: begin
            finished_w = 1;
        end
        default: finished_w = 0;
    endcase
end

// SEQUENTIAL CIRCUIT

always_ff @(posedge i_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
        command_counter_r   <= 0;
        bits_counter_r      <= 0;
        bytes_counter_r     <= 0;
        sdat_r              <= 1;
        data_r              <= 0;
        sclk_r              <= 1;
        oe_r                <= 1;
        finished_r          <= 0;
        updated_r           <= 0;
        state_r             <= S_IDLE;
    end else begin
        command_counter_r   <= command_counter_w;
        bits_counter_r      <= bits_counter_w;
        bytes_counter_r     <= bytes_counter_w;
        sdat_r              <= sdat_w;
        data_r              <= data_w;
        sclk_r              <= sclk_w;
        oe_r                <= oe_w;
        finished_r          <= finished_w;
        updated_r           <= updated_w;
        state_r             <= state_w;
    end
end

endmodule