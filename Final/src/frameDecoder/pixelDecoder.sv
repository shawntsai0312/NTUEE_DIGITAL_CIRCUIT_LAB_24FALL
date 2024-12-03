import object_pkg;
import sram_pkg;

module PixelDecoder (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car2_y,
    input [sram_pkg::MAP_H_WIDTH-1:0] i_VGA_H,
    input [sram_pkg::MAP_V_WIDTH-1:0] i_VGA_V,
    output object_pkg::ObjectID o_object_id,
);

endmodule