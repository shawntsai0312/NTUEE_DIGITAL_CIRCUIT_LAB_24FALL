import object_pkg::*;
import sram_pkg::*;

module PixelDecoder (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car2_y,

    input i_car1_opacity_mask [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1], // 1 for transparent, 0 for opaque
    input i_car2_opacity_mask [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1],

    input [sram_pkg::MAP_H_WIDTH-1:0] i_VGA_H, // from 1 to 1600
    input [sram_pkg::MAP_V_WIDTH-1:0] i_VGA_V, // from 1 to 900

    output object_pkg::ObjectID o_object_id,
    output reg [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] o_object_pixel_index
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

    reg opacity;
    reg [sram_pkg::MAP_H_WIDTH-1:0] H_rel;
    reg [sram_pkg::MAP_V_WIDTH-1:0] V_rel;
    always @(*) begin
        if (i_VGA_V <= sram_pkg::MAP_V) begin
            if (i_VGA_H >= o_car1_H_min && i_VGA_H <= o_car1_H_max && i_VGA_V >= o_car1_V_min && i_VGA_V <= o_car1_V_max) begin
                H_rel = i_VGA_H - o_car1_H_min;
                V_rel = i_VGA_V - o_car1_V_min;
                opacity = i_car1_opacity_mask[V_rel][H_rel];
                if (i_car1_opacity_mask[i_VGA_V - o_car1_V_min][i_VGA_H - o_car1_H_min]) begin
                    // not transparent, render car1
                    // $display("render car1 at (%d, %d)", i_VGA_H, i_VGA_V);
                    o_object_id = object_pkg::OBJECT_CAR1;
                    o_object_pixel_index = (i_VGA_V - o_car1_V_min) * sram_pkg::IMAGE_SIZE + (i_VGA_H - o_car1_H_min); // VGA H and V start from 1, already handled in CoorConverter
                end
                else begin
                    // transparent, render map
                    o_object_id = object_pkg::OBJECT_MAP;
                    o_object_pixel_index = i_VGA_V * sram_pkg::MAP_H + i_VGA_H;
                end
            end
            else if (i_VGA_H >= o_car2_H_min && i_VGA_H <= o_car2_H_max && i_VGA_V >= o_car2_V_min && i_VGA_V <= o_car2_V_max) begin
                if (i_car2_opacity_mask[i_VGA_V - o_car2_V_min][i_VGA_H - o_car2_H_min]) begin
                    // not transparent, render car2
                    // $display("render car2 at (%d, %d)", i_VGA_H, i_VGA_V);
                    o_object_id = object_pkg::OBJECT_CAR2;
                    o_object_pixel_index = (i_VGA_V - o_car2_V_min) * sram_pkg::IMAGE_SIZE + (i_VGA_H - o_car2_H_min); // VGA H and V start from 1, already handled in CoorConverter
                end
                else begin
                    // transparent, render map
                    o_object_id = object_pkg::OBJECT_MAP;
                    o_object_pixel_index = (i_VGA_V - 1) * sram_pkg::MAP_H + (i_VGA_H - 1); // VGA H and V start from 1
                end
            end
            else begin
                // render map
                o_object_id = object_pkg::OBJECT_MAP;
                o_object_pixel_index = (i_VGA_V - 1) * sram_pkg::MAP_H + (i_VGA_H - 1); // VGA H and V start from 1
            end
        end
        else begin
            // render bar
            o_object_id = object_pkg::OBJECT_BAR;
            o_object_pixel_index = (i_VGA_V - 1 - sram_pkg::MAP_V) * sram_pkg::MAP_H + (i_VGA_H - 1); // VGA H and V start from 1
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