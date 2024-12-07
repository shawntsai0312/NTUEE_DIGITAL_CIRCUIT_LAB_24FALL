import game_pkg::*;
import sram_pkg::*;

module SramEncoder (
    input i_clk,
    input i_rst_n,
    input [sram_pkg::COLOR_WIDTH-1:0] i_encoded_color,
    input game_pkg::ObjectID i_object_id,
    input [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] i_object_pixel_counter,
    output [sram_pkg::SRAM_ADDR_COUNT-1:0] o_sram_addr,
    output [sram_pkg::SRAM_DATA_WIDTH-1:0] o_sram_data
);

    // each address contains 4 pixels
    reg [sram_pkg::SRAM_ADDR_COUNT-1:0] sram_addr_r, sram_addr_w;
    reg [sram_pkg::SRAM_DATA_WIDTH-1:0] sram_data_r, sram_data_w;

    assign o_sram_addr = sram_addr_r;
    assign o_sram_data = sram_data_r;

    always @(*) begin
        sram_addr_w = sram_addr_r;
        case(i_object_id)
            game_pkg::OBJECT_CAR1: begin
                sram_addr_w = sram_pkg::CAR1_ADDR_START + (i_object_pixel_counter >> 2);
            end
            game_pkg::OBJECT_CAR2: begin
                sram_addr_w = sram_pkg::CAR2_ADDR_START + (i_object_pixel_counter >> 2);
            end
        endcase
    end

    always @(*) begin
        // sram_data_w = (sram_data_r >> 4) + i_encoded_color
        sram_data_w = {i_encoded_color, sram_data_r[sram_pkg::SRAM_DATA_WIDTH-1:sram_pkg::COLOR_WIDTH]};
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            sram_addr_r <= 0;
            sram_data_r <= 0;
        end
        else begin
            sram_addr_r <= sram_addr_w;
            sram_data_r <= sram_data_w;
        end
    end

endmodule