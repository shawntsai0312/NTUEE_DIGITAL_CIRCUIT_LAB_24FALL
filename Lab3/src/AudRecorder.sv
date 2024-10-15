module AudRecorder (
    input i_rst_n,
    input i_clk,
    input i_lrc,
    input i_start,
    input i_pause,
    input i_stop,
    input i_data,
    output [19:0] o_address,
    output [15:0] o_data
);
    // TODO: Record audio data from WM8731 and save it to SRAM

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            
        end
        else begin
            
        end
    end
endmodule