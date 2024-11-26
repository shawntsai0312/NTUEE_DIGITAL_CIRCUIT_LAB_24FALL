`define DEFAULT_PIXEL_PER_ADDR 4
`define DEFAULT_COLOR_WIDTH 4
`define DEFAULT_COUNTER_WIDTH 2

module SramEncoder #(
    parameter PIXEL_PER_ADDR = `DEFAULT_PIXEL_PER_ADDR,
    parameter COLOR_WIDTH = `DEFAULT_COLOR_WIDTH,
    parameter COUNTER_WIDTH = `DEFAULT_COUNTER_WIDTH
)(
    input i_clk,
    input i_rst_n,
    output [15:0] o_sram_data,
    input [COLOR_WIDTH-1:0] i_encoded_color
);
    reg [15:0] sram_data_r, sram_data_w;
    reg [COUNTER_WIDTH-1:0] counter_r, counter_w;

    always @(*) begin
        counter_w = counter_r;
        if(counter_r == PIXEL_PER_ADDR) counter_w = 0;
        else                            counter_w = counter_r + 1;
    end

    always @(*) begin
        sram_data_w = sram_addr_r;
        if(counter_r == PIXEL_PER_ADDR) sram_data_w = 0;
        else                            sram_data_w = sram_data_r << COLOR_WIDTH + i_encoded_color;
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            sram_data_r <= 0;
            counter_r <= 0;
        end
        else begin
            sram_addr_r <= sram_data_w;
            counter_r <= counter_w;
        end
    end

endmodule