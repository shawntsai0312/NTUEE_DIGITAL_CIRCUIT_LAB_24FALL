module AudDSP (
    input i_rst_n,
    input i_clk,
    input i_start,
    input i_pause,
    input [3:0] i_speed,
    input i_is_slow,
    input i_slow_mode,
    input i_daclrck,
    input [15:0] i_sram_data,
    output [15:0] o_dac_data,
    output [19:0] o_sram_addr
);
    // TODO: DSP operations including speed adjustments

    localparam S_IDLE  = 0;
    localparam S_FAST  = 1;
    localparam S_SLOW0 = 2; // constant interpolation
    localparam S_SLOW1 = 3; // linear interpolation
    localparam S_PAUSE = 4;

    reg [2:0] state_r, state_w;

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if (i_start) begin
                    if (i_is_slow)  state_w = S_SLOW;
                    else            state_w = S_FAST;
                end
                else state_w = S_IDLE;
            end
            
        endcase
    end

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
        end
        else begin
            state_r <= state_w;
        end
    end
endmodule