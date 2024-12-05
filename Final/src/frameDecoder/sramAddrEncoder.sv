import object_pkg::*;
import sram_pkg::*;

module SramAddrEncoder (
    input i_clk,
    input i_rst_n,
    input object_pkg::ObjectID i_object_id,
    input [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] i_object_pixel_index,
    output [sram_pkg::SRAM_ADDR_COUNT-1:0] o_sram_addr
);
    reg [sram_pkg::SRAM_ADDR_COUNT-1:0] sram_addr_r, sram_addr_w;
    assign o_sram_addr = sram_addr_r;

    always @(*) begin
        case (i_object_id)
            object_pkg::OBJECT_MAP:  sram_addr_w = sram_pkg::MAP_ADDR_START + (i_object_pixel_index >> 2);
            object_pkg::OBJECT_BAR:  sram_addr_w = sram_pkg::BAR_ADDR_START + (i_object_pixel_index >> 2);
            object_pkg::OBJECT_CAR1: sram_addr_w = sram_pkg::CAR1_ADDR_START + (i_object_pixel_index >> 2);
            object_pkg::OBJECT_CAR2: sram_addr_w = sram_pkg::CAR2_ADDR_START + (i_object_pixel_index >> 2);
        endcase
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            sram_addr_r <= 0;
        end
        else begin
            sram_addr_r <= sram_addr_w;
        end
    end
endmodule