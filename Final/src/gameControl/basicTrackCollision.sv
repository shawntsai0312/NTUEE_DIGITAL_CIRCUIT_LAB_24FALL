import sram_pkg::*;
import game_pkg::*;
import track_pkg::*;


module HorizontalTrackCollision (
    input HorizontalTrack i_track,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_v_y,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_radius,
    output reg o_in_region,
    output reg o_collision
);
    wire in_region;
    assign o_in_region = in_region;
    InRegionChecker u_InRegionChecker (
        .i_x            (i_x),
        .i_y            (i_y),
        .i_x_left       (i_track.x_left),
        .i_x_right      (i_track.x_right),
        .i_y_top        (i_track.y_top_border),
        .i_y_bottom     (i_track.y_bottom_border),
        .o_in_region    (in_region)
    );

    wire signed [sram_pkg::MAP_V_WIDTH-1:0] distance_top_border, distance_bottom_border;
    assign distance_top_border = i_track.y_top_border - i_y - i_radius;
    assign distance_bottom_border = i_y - i_radius - i_track.y_bottom_border;

    always @(*) begin
        if (in_region) begin
            o_collision = 0;
            if (distance_top_border <= 0 && i_v_y > 0) o_collision = 1;
            if (distance_bottom_border <= 0 && i_v_y < 0) o_collision = 1;
        end
        else begin
            o_collision = 0;
        end
    end
        
endmodule

module VerticalTrackCollision (
    input VerticalTrack i_track,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_v_x,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_radius,
    output reg o_in_region,
    output reg o_collision
);

    wire in_region;
    assign o_in_region = in_region;
    InRegionChecker u_InRegionChecker (
        .i_x            (i_x),
        .i_y            (i_y),
        .i_x_left       (i_track.x_left_border),
        .i_x_right      (i_track.x_right_border),
        .i_y_top        (i_track.y_top),
        .i_y_bottom     (i_track.y_bottom),
        .o_in_region    (in_region)
    );

    wire signed [sram_pkg::MAP_H_WIDTH-1:0] distance_left_border, distance_right_border;
    assign distance_left_border = i_x - i_radius - i_track.x_left_border;
    assign distance_right_border = i_track.x_right_border - i_x - i_radius;

    always @(*) begin
        if (in_region) begin
            o_collision = 0;
            if (distance_left_border <= 0 && i_v_x < 0) o_collision = 1;
            if (distance_right_border <= 0 && i_v_x > 0) o_collision = 1;
        end
        else begin
            o_collision = 0;
        end
    end

endmodule

module CircleTrackCollision (
    input CircleTrack i_track,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_v_x,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_v_y,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_radius,
    output reg o_in_region,
    output reg o_collision
);

    wire in_region;
    assign o_in_region = in_region;
    InRegionChecker u_InRegionChecker (
        .i_x            (i_x),
        .i_y            (i_y),
        .i_x_left       (i_track.x_left),
        .i_x_right      (i_track.x_right),
        .i_y_top        (i_track.y_top),
        .i_y_bottom     (i_track.y_bottom),
        .o_in_region    (in_region)
    );

    wire signed [sram_pkg::MAP_H_WIDTH-1:0] displacement_center_x, displacement_center_y;
    assign displacement_center_x = i_x - i_track.center_x;
    assign displacement_center_y = i_y - i_track.center_y;

    wire signed [2*sram_pkg::MAP_H_WIDTH-1:0] displacement_center_square;
    assign displacement_center_square = displacement_center_x * displacement_center_x + displacement_center_y * displacement_center_y;

    wire signed [sram_pkg::MAP_H_WIDTH-1:0] distance_lowerBound, distance_upperBound;
    assign distance_lowerBound = i_track.radius_inner + i_radius;
    assign distance_upperBound = i_track.radius_outer - i_radius;

    wire signed [2*sram_pkg::MAP_H_WIDTH-1:0] distance_lowerBound_square, distance_upperBound_square;
    assign distance_lowerBound_square = distance_lowerBound * distance_lowerBound;
    assign distance_upperBound_square = distance_upperBound * distance_upperBound;

    // calculate the dot product of the velocity and the vector from the center to the car
    // if the dot product is positive, the car is moving away from the center
    // if the dot product is negative, the car is moving towards the center
    localparam PROCESS_WIDTH = sram_pkg::MAP_H_WIDTH + game_pkg::VELOCITY_INTEGER_WIDTH + game_pkg::VELOCITY_FRACTION_WIDTH;
    wire signed [PROCESS_WIDTH:0] dot_product;
    assign dot_product = i_v_x * displacement_center_x + i_v_y * displacement_center_y;
    wire going_outwards, going_inwards;
    assign going_outwards = dot_product > 0;
    assign going_inwards = dot_product < 0;

    always @(*) begin
        if (in_region) begin
            o_collision = 0;
            if (displacement_center_square <= distance_lowerBound_square && going_inwards) o_collision = 1;
            if (displacement_center_square >= distance_upperBound_square && going_outwards) o_collision = 1;
        end
        else begin
            o_collision = 0;
        end
    end
endmodule

module InRegionChecker (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x_left,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x_right,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y_top,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y_bottom,
    output o_in_region
);
    assign o_in_region = (i_x > i_x_left) 
                        & (i_x <= i_x_right) 
                        & (i_y > i_y_bottom) 
                        & (i_y <= i_y_top);
endmodule