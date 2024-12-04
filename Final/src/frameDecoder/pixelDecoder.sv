import object_pkg::*;
import sram_pkg::*;

module PixelDecoder (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car2_y,

    input i_car1_opacity_map [0:sram_pkg::IMAGE_COOR_WIDTH-1][0:sram_pkg::IMAGE_COOR_WIDTH-1], // 1 for transparent, 0 for opaque
    input i_car2_opacity_map [0:sram_pkg::IMAGE_COOR_WIDTH-1][0:sram_pkg::IMAGE_COOR_WIDTH-1],

    input [sram_pkg::MAP_H_WIDTH-1:0] i_VGA_H,
    input [sram_pkg::MAP_V_WIDTH-1:0] i_VGA_V,

    output object_pkg::ObjectID o_object_id,
    output [sram_pkg::MAP_H_WIDTH*sram_pkg::MAP_V_WIDTH-1:0] o_object_pixel_index
);

    wire [sram_pkg::MAP_H_WIDTH-1:0] o_car1_H_min, o_car1_H_max;
    wire [sram_pkg::MAP_V_WIDTH-1:0] o_car1_V_min, o_car1_V_max;
    CoorConverter u_CoorConverter_car1 (
        .i_x        (i_car1_x),
        .i_y        (i_car1_y),
        .o_H_min    (o_car1_H_min),
        .o_H_max    (o_car1_H_max),
        .o_V_min    (o_car1_V_min),
        .o_V_max    (o_car1_V_max)
    );

    wire [sram_pkg::MAP_H_WIDTH-1:0] o_car2_H_min, o_car2_H_max;
    wire [sram_pkg::MAP_V_WIDTH-1:0] o_car2_V_min, o_car2_V_max;

    CoorConverter u_CoorConverter_car2 (
        .i_x        (i_car2_x),
        .i_y        (i_car2_y),
        .o_H_min    (o_car2_H_min),
        .o_H_max    (o_car2_H_max),
        .o_V_min    (o_car2_V_min),
        .o_V_max    (o_car2_V_max)
    );

    always @(*) begin
        if (i_VGA_H >= o_car1_H_min && i_VGA_H <= o_car1_H_max && i_VGA_V >= o_car1_V_min && i_VGA_V <= o_car1_V_max) begin
            if (i_car1_opacity_map[i_VGA_V - o_car1_V_min][i_VGA_H - o_car1_H_min]) begin
                o_object_id = object_pkg::OBJECT_MAP;
                o_object_pixel_index = i_VGA_V * sram_pkg::MAP_H + i_VGA_H;
            end
            else begin
                o_object_id = object_pkg::OBJECT_CAR1;
                o_object_pixel_index = (i_VGA_V - o_car1_V_min) * sram_pkg::IMAGE_SIZE + (i_VGA_H - o_car1_H_min);
            end
        end
        else if (i_VGA_H >= o_car2_H_min && i_VGA_H <= o_car2_H_max && i_VGA_V >= o_car2_V_min && i_VGA_V <= o_car2_V_max) begin
            if (i_car2_opacity_map[i_VGA_V - o_car2_V_min][i_VGA_H - o_car2_H_min]) begin
                o_object_id = object_pkg::OBJECT_MAP;
                o_object_pixel_index = i_VGA_V * sram_pkg::MAP_H + i_VGA_H;
            end
            else begin
                o_object_id = object_pkg::OBJECT_CAR2;
                o_object_pixel_index = (i_VGA_V - o_car2_V_min) * sram_pkg::IMAGE_SIZE + (i_VGA_H - o_car2_H_min);
            end
        end
        else begin
            o_object_id = object_pkg::OBJECT_MAP;
            o_object_pixel_index = i_VGA_V * sram_pkg::MAP_H + i_VGA_H;
        end
        else begin
            o_object_id = object_pkg::OBJECT_MAP;
            o_object_pixel_index = i_VGA_V * sram_pkg::MAP_H + i_VGA_H;
        end
    end
endmodule

module CoorConverter (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,
    output [sram_pkg::MAP_H_WIDTH-1:0] o_H_min,
    output [sram_pkg::MAP_H_WIDTH-1:0] o_H_max,
    output [sram_pkg::MAP_V_WIDTH-1:0] o_V_min,
    output [sram_pkg::MAP_V_WIDTH-1:0] o_V_max
);

    assign o_H_min = i_x + ((sram_pkg::MAP_H - sram_pkg::IMAGE_SIZE) >> 1) + 1;
    assign o_H_max = i_x + ((sram_pkg::MAP_H + sram_pkg::IMAGE_SIZE) >> 1);
    assign o_V_min = -i_y + ((sram_pkg::MAP_V - sram_pkg::IMAGE_SIZE) >> 1) + 1;
    assign o_V_max = -i_y + ((sram_pkg::MAP_V + sram_pkg::IMAGE_SIZE) >> 1);
endmodule