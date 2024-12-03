import object_pkg;
import sram_pkg;

module SramDataDecoder (
    input object_pkg::ObjectID i_object_id,
    input [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] i_object_pixel_counter,
    input [sram_pkg::SRAM_DATA_WIDTH-1:0] i_sram_data,
    output [sram_pkg::COLOR_WIDTH-1:0] o_encoded_color
);
    assign o_encoded_color = i_sram_data >> (i_object_pixel_counter[1:0] << 2);
endmodule