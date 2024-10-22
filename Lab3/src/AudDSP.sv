module AudDSP (
    input i_rst_n,
    input i_clk,
    input i_start, // start signal, sent by the controller, not a button press
    input i_pause, // pause signal, press to pause, press again to resume
    input [3:0] i_speed,
    input i_is_slow,
    input i_slow_mode,
    input i_daclrck,               // ask fo data when low(left channel), send data when high(right channel)
    input [15:0] i_sram_data,
    input [19:0] i_sram_stop_addr, // the last address to read from SRAM
    output [15:0] o_dac_data,
    output o_en,                   // enable signal for AudPlayer
    output [19:0] o_sram_addr
);
    // TODO: DSP operations including speed adjustments

    localparam S_IDLE    = 0;
    localparam S_FAST    = 1;
    localparam S_SLOW0   = 2; // constant interpolation
    localparam S_SLOW1   = 3; // linear interpolation
    localparam S_PAUSE   = 4; 

    reg [2:0] state_r, state_w;
    reg [3:0] counter_r, counter_w; // counter for S_SLOW0 and S_SLOW1
    reg is_pause_r, is_pause_w; // pause signal

    reg [19:0] addr_r, addr_w;
    reg [15:0] i_data_curr_r, i_data_curr_w;
    reg [15:0] i_data_next_r, i_data_next_w; // next data for interpolation

    reg [15:0] o_data_r, o_data_w;

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if (i_start)    state_w = S_PAUSE;
                else            state_w = S_IDLE;
            end
            S_FAST: begin
                if (is_pause_r) state_w = S_PAUSE;
                else            state_w = S_FAST;
            end
            S_SLOW0: begin
                if (is_pause_r) state_w = S_PAUSE;
                else            state_w = S_SLOW0;
            end
            S_SLOW1: begin
                if (is_pause_r) state_w = S_PAUSE;
                else            state_w = S_SLOW1;
            end
            S_PAUSE: begin
                if (!is_pause_r) begin
                    if (i_is_slow) begin
                        if (i_slow_mode)    state_w = S_SLOW1;
                        else                state_w = S_SLOW0;
                    end
                    else state_w = S_FAST;
                end
                else state_w = S_PAUSE;
            end
        endcase
    end

    // counter logic
    always @(*) begin
        counter_w = counter_r;
        case(state_r)
            S_IDLE:     counter_w = 0;
            S_FAST:     counter_w = 0;
            S_SLOW0:    counter_w = (counter_r == i_speed) ? 0 : counter_r + 1;
            S_SLOW1:    counter_w = (counter_r == i_speed) ? 0 : counter_r + 1;
            S_PAUSE:    counter_w = 0;
        endcase
    end

    // pause logic
    always @(*) begin
        is_pause_w = is_pause_r;
        case(state_r)
            S_IDLE:     is_pause_w = 1;
            S_FAST:     if(i_pause) is_pause_w = 1;
            S_SLOW0:    if(i_pause) is_pause_w = 1;
            S_SLOW1:    if(i_pause) is_pause_w = 1;
            S_PAUSE:    if(i_pause) is_pause_w = 0;
        endcase
    end

    // address logic
    // add one more bit to prevent overflow
    // if it is larger than i_sram_stop_addr, reset to 0
    reg [20:0] temp_addr;
    always @(*) begin
        addr_w = addr_r;
        temp_addr = addr_r;
        case(state_r)
            S_IDLE:  temp_addr = 0;                                 // init 
            S_FAST:  temp_addr = addr_r + i_speed + 1;              // get data after two cycles in S_FAST
            S_SLOW0: if(counter_r == 0)  temp_addr = addr_r + 1;    // get data for the next round of interpolation in S_SLOW0
            S_SLOW1: if(counter_r == 0)  temp_addr = addr_r + 1;    // get data for the next round of interpolation in S_SLOW1
            S_PAUSE: temp_addr = addr_r;                            // get data at S_RESUME1
            // S_RESUME0: begin
            //     if (i_is_slow)  temp_addr = addr_r + 1;             // get data at the first cycle of S_SLOW0/S_SLOW1
            //     else            temp_addr = addr_r + i_speed + 1;   // get data at the first cycle of S_FAST
            // end
            // S_RESUME1: begin
            //     if (i_is_slow)  temp_addr = addr_r + 1;             // get data at the first cycle of S_SLOW0/S_SLOW1
            //     else            temp_addr = addr_r + i_speed + 1;   // get data at the first cycle of S_FAST
            // end
        endcase
        if(temp_addr > i_sram_stop_addr)    addr_w = 0;
        else                                addr_w = temp_addr;
    end

    // i_data logic
    always @(*) begin
        i_data_curr_w = i_data_curr_r;
        i_data_next_w = i_data_next_r;
        case(state_r)
            S_IDLE: begin
                i_data_curr_w = 0;
                i_data_next_w = 0;
            end
            S_FAST: begin
                i_data_curr_w = i_data_next_r;
                i_data_next_w = i_sram_data;
            end
            S_SLOW0: begin
                i_data_curr_w = 
                i_data_next_w = 
            end
            S_SLOW1: begin
                i_data_curr_w = 
                i_data_next_w = 
            end
            S_PAUSE: begin
                i_data_curr_w = i_data_curr_r;
                i_data_next_w = i_data_next_r;
            end
        endcase
    end

    // o_data logic
    always @(*) begin
        o_data_w = o_data_r;
        case(state_r)
        endcase
    end

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            counter_r <= 0;
            is_pause_r <= 1;
            addr_r <= 0;
            i_data_curr_r <= 0;
            i_data_next_r <= 0;
            o_data_r <= 0;
        end
        else begin
            state_r <= state_w;
            counter_r <= counter_w;
            is_pause_r <= is_pause_w;
            addr_r <= addr_w;
            i_data_curr_r <= i_data_curr_w;
            i_data_next_r <= i_data_next_w;
            o_data_r <= o_data_w;
        end
    end
endmodule