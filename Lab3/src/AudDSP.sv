module AudDSP (
    input i_rst_n,
    input i_clk,
    input i_start,
    input i_pause,
    input i_stop,
    input [3:0] i_speed,
    input i_fast,
    input i_slow_0,
    input i_slow_1,
    input i_daclrck,
    input [15:0] i_sram_data,
    output [15:0] o_dac_data,
    output [19:0] o_sram_addr
);
    // TODO: DSP operations including speed adjustments

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            
        end
        else begin
            
        end
    end
endmodule