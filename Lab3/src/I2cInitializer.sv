module I2cInitializer (
    input i_rst_n,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,//not yet
    inout o_sdat,
    output o_oen//not yet
);

    /*-------------------------------------------------- I2C bus signals --------------------------------------------------*/
    // [23:17]: slave address, 0011010
    // [16]: read/write bit, 0 for write, 1 for read
    // [15:9]: register address
    // [8:0]: register data
    // checkout doc/Lab3_sup1_audiocodec.pdf for more details
    parameter [23:0] LEFT_LINE_IN =                     24'b0011_0100_000_0000_0_1001_0111; // to register 0x00
    parameter [23:0] RIGHT_LINE_IN =                    24'b0011_0100_000_0001_0_1001_0111; // to register 0x01
    parameter [23:0] LEFT_HEADPHONE_OUT =               24'b0011_0100_000_0010_0_0111_1001; // to register 0x02
    parameter [23:0] RIGHT_HEADPHONE_OUT =              24'b0011_0100_000_0011_0_0111_1001; // to register 0x03
    parameter [23:0] ANALOGUE_AUDIO_PATH_CONTROL =      24'b0011_0100_000_0100_0_0001_0101; // to register 0x04
    parameter [23:0] DIGITAL_AUDIO_PATH_CONTROL =       24'b0011_0100_000_0101_0_0000_0000; // to register 0x05
    parameter [23:0] POWER_DOWN_CONTROL =               24'b0011_0100_000_0110_0_0000_0000; // to register 0x06
    parameter [23:0] DIGITAL_AUDIO_INTERFACE_FORMAT =   24'b0011_0100_000_0111_0_0100_0010; // to register 0x07
    parameter [23:0] SAMPLING_CONTROL =                 24'b0011_0100_000_1000_0_0001_1001; // to register 0x08
    parameter [23:0] ACTIVE_CONTROL =                   24'b0011_0100_000_1001_0_0000_0001; // to register 0x09
    parameter [23:0] RESET =                            24'b0011_0100_000_1111_0_0000_0000; // to register 0x0F

    /*-------------------------------------------------- FSM states --------------------------------------------------*/
    parameter S_IDLE = 0;
    parameter S_START = 1;
    parameter S_SEND = 2;
    parameter S_ACK  = 3;
    parameter S_STOP = 4;

    reg [2:0] state_r, state_w;
    reg [2:0] bitcount_r, bitcount_w; // bit count for the 8-bit data (8)
    reg [4:0] command_r, command_w; // command count for the 10 commands  (11) 
    //output
    reg o_finished_r, o_finished_w;
    reg o_sclk_r, o_sclk_w;
    reg o_oen_r, o_oen_w;
    // data
    reg [23:0] data_r, data_w; // data to be sent

    assign o_finished = o_finished_r;
    assign o_oen = o_oen_r;
    assign o_sdat = data_r[23];
    //bitcount_r 
    always@(*)begin
        bitcount_r = bitcount_w;
        case(state_r)
            S_SEND: begin
                bitcount_w = bitcount_+1;
            end
        endcase

    end
    // command
    always@(*)begin
        command_w = command_r;
        case(state_r)
            S_STOP: begin
                command_w = command_r + 1;
            end
        endcase
    end
    // state
    always@(*)begin
        state_w = state_r;

        case(state_r)
            S_IDLE: begin
                if(i_start) begin
                    state_w = S_START;
                end
            end
            S_START: begin
                state_w = S_SEND;
            end
            S_SEND: begin
                if(bitcount_w == 7) begin
                    state_w = S_ACK;
                end
                else begin
                    state_w = S_SEND;
                end
            end
            S_ACK: begin
                state_w = S_STOP;
            end
            S_STOP: begin
                if (command_r == 9) begin
                    state_w = S_IDLE;
                end
                else begin
                    state_w = S_START;
                end
            end
            default: begin
                state_w = S_IDLE;
            end
        endcase
    end
    //o_finished
    always@(*)begin
       if(command_r == 9 && bitcount_r == 7) begin // 注意一下这里的条件
           o_finished_w = 1;
       end
    end
    //data
    always@(*)begin
        case(state)
            S_START: begin
                case(command_r)
                    0: begin
                        data_w = LEFT_LINE_IN;
                    end
                    1: begin
                        data_w = RIGHT_LINE_IN;
                    end
                    2: begin
                        data_w = LEFT_HEADPHONE_OUT;
                    end
                    3: begin
                        data_w = RIGHT_HEADPHONE_OUT;
                    end
                    4: begin
                        data_w = ANALOGUE_AUDIO_PATH_CONTROL;
                    end
                    5: begin
                        data_w = DIGITAL_AUDIO_PATH_CONTROL;
                    end
                    6: begin
                        data_w = POWER_DOWN_CONTROL;
                    end
                    7: begin
                        data_w = DIGITAL_AUDIO_INTERFACE_FORMAT;
                    end
                    8: begin
                        data_w = SAMPLING_CONTROL;
                    end
                    9: begin
                        data_w = ACTIVE_CONTROL;
                    end
                    10: begin
                        data_w = RESET;
                    end
                    default: begin
                        data_w = 24'b0000_0000_000_0000_0_0000_0000;
                    end
                endcase
            end
            S_SEND: begin
                data_w = data_r << 1;
            end
            
        endcase
    end
    //o_sdat
    always@(*)begin
        case(state_r)
            S_SEND: begin
                case(command_r)
                    0: begin
                        o_sdat_w = LEFT_LINE_IN[23];
                    end
                    1: begin
                        o_sdat_w = RIGHT_LINE_IN[23-bitcount_r];
                    end
                    2: begin
                        o_sdat_w = LEFT_HEADPHONE_OUT[23-bitcount_r];
                    end
                    3: begin
                        o_sdat_w = RIGHT_HEADPHONE_OUT[23-bitcount_r];
                    end
                    4: begin
                        o_sdat_w = ANALOGUE_AUDIO_PATH_CONTROL[23-bitcount_r];
                    end
                    5: begin
                        o_sdat_w = DIGITAL_AUDIO_PATH_CONTROL[23-bitcount_r];
                    end
                    6: begin
                        o_sdat_w = POWER_DOWN_CONTROL[23-bitcount_r];
                    end
                    7: begin
                        o_sdat_w = DIGITAL_AUDIO_INTERFACE_FORMAT[23-bitcount_r];
                    end
                    8: begin
                        o_sdat_w = SAMPLING_CONTROL[23-bitcount_r];
                    end
                    9: begin
                        o_sdat_w = ACTIVE_CONTROL[23-bitcount_r];
                    end
                    default: begin
                        o_sdat_w = 1;
                    end
                endcase
            end
            default: begin
                o_sdat_w = 1;
            end
        endcase
    end

//sequential logic
    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            bitcount_r <= 0;
            command_r <= 0;
            o_finished_r <= 0;
            o_sclk_r <= 0;
            o_sdat_r <= 0;
            o_oen_r <= 0;

        end
        else begin
            state_r <= state_w;
            bitcount_r <= bitcount_w;
            command_r <= command_w;
            o_finished_r <= o_finished_w;
            o_sclk_r <= o_sclk_w;
            o_sdat_r <= o_sdat_w;
            o_oen_r <= o_oen_w;
        end
    end
endmodule