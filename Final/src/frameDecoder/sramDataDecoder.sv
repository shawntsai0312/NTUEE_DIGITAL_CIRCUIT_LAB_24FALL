import object_pkg::*;
import sram_pkg::*;

module SramDataDecoder (
    input object_pkg::ObjectID i_object_id,
    input [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] i_object_pixel_index,
    input [sram_pkg::SRAM_DATA_WIDTH-1:0] i_sram_data,
    output [sram_pkg::COLOR_WIDTH-1:0] o_encoded_color
);
    // assign o_encoded_color = (i_sram_data >> (i_object_pixel_index[1:0] << 2)); // i_sram_data right shift (4 * (i_object_pixel_index % 4)) and pick the last 4 bits
    wire [3:0] start_index;
    assign start_index[3:0] = i_object_pixel_index[1:0] << 2;
    assign o_encoded_color = i_sram_data[start_index +: sram_pkg::COLOR_WIDTH];
endmodule