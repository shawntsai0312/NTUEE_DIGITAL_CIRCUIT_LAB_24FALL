import object_pkg::*;
import sram_pkg::*;

module GameControl (
    input i_render_clk,
    input i_rst_n,
    output signed [sram_pkg::ANG_WIDTH-1:0] o_car1_angle,
    output signed [sram_pkg::ANG_WIDTH-1:0] o_car2_angle,
    output signed [sram_pkg::MAP_H_WIDTH-1:0] o_car1_x,
    output signed [sram_pkg::MAP_V_WIDTH-1:0] o_car1_y,
    output signed [sram_pkg::MAP_H_WIDTH-1:0] o_car2_x,
    output signed [sram_pkg::MAP_V_WIDTH-1:0] o_car2_y,
);

    // test only
    assign i_car1_angle = 60;
    assign i_car2_angle = 120;
    assign i_car1_x = 0;
    assign i_car1_y = 250;
    assign i_car2_x = 650;
    assign i_car2_y = -250;

endmodule