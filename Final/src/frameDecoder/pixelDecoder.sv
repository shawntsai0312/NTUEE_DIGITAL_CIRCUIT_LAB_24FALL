import game_pkg::*;
import sram_pkg::*;

module PixelDecoder (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_car2_y,

    input i_car1_opacity_mask [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1], // 1 for transparent, 0 for opaque
    input i_car2_opacity_mask [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1],

    input [game_pkg::VELOCITY_OUTPUT_WIDTH-1:0] i_car1_v_m,
    input [game_pkg::VELOCITY_OUTPUT_WIDTH-1:0] i_car2_v_m,

    input [sram_pkg::MAP_H_WIDTH-1:0] i_VGA_H, // from 1 to 1600
    input [sram_pkg::MAP_V_WIDTH-1:0] i_VGA_V, // from 1 to 900

    output game_pkg::ObjectID o_object_id,
    output reg [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] o_object_pixel_index
);
    /*---------------------------------------------------- map/bar render ----------------------------------------------------*/
    wire [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] render_map_index, render_bar_index;
    assign render_map_index = (i_VGA_V - 1) * sram_pkg::MAP_H + i_VGA_H - 1;
    assign render_bar_index = (i_VGA_V - 1 - sram_pkg::MAP_V) * sram_pkg::MAP_H + i_VGA_H - 1;

    /*------------------------------------------------------ car render ------------------------------------------------------*/
    wire [sram_pkg::MAP_H_WIDTH-1:0] o_car1_H_min, o_car1_H_max;
    wire [sram_pkg::MAP_V_WIDTH-1:0] o_car1_V_min, o_car1_V_max;
    XYtoBoundaries u_CoorConverter_car1 (
        .i_x        (i_car1_x),
        .i_y        (i_car1_y),
        .o_H_min    (o_car1_H_min),
        .o_H_max    (o_car1_H_max),
        .o_V_min    (o_car1_V_min),
        .o_V_max    (o_car1_V_max)
    );

    wire [sram_pkg::MAP_H_WIDTH-1:0] o_car2_H_min, o_car2_H_max;
    wire [sram_pkg::MAP_V_WIDTH-1:0] o_car2_V_min, o_car2_V_max;
    XYtoBoundaries u_CoorConverter_car2 (
        .i_x        (i_car2_x),
        .i_y        (i_car2_y),
        .o_H_min    (o_car2_H_min),
        .o_H_max    (o_car2_H_max),
        .o_V_min    (o_car2_V_min),
        .o_V_max    (o_car2_V_max)
    );

    wire render_car1, render_car2;
    assign render_car1 = i_VGA_H >= o_car1_H_min 
                        & i_VGA_H <= o_car1_H_max 
                        & i_VGA_V >= o_car1_V_min 
                        & i_VGA_V <= o_car1_V_max;
    assign render_car2 = i_VGA_H >= o_car2_H_min 
                        & i_VGA_H <= o_car2_H_max 
                        & i_VGA_V >= o_car2_V_min 
                        & i_VGA_V <= o_car2_V_max;

    wire [sram_pkg::MAP_H_WIDTH-1:0] car1_rel_H, car2_rel_H;
    wire [sram_pkg::MAP_V_WIDTH-1:0] car1_rel_V, car2_rel_V;
    assign car1_rel_H = i_VGA_H - o_car1_H_min;
    assign car1_rel_V = i_VGA_V - o_car1_V_min;
    assign car2_rel_H = i_VGA_H - o_car2_H_min;
    assign car2_rel_V = i_VGA_V - o_car2_V_min;

    wire [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] render_car1_index, render_car2_index;
    assign render_car1_index = car1_rel_V * sram_pkg::IMAGE_SIZE + car1_rel_H;
    assign render_car2_index = car2_rel_V * sram_pkg::IMAGE_SIZE + car2_rel_H;

    /*--------------------------------------------------- car circle render ---------------------------------------------------*/
    wire render_car1_circle, render_car2_circle;
    CarCircleGenerator u_CarCircleGenerator_car1 (
        .i_H_render    (i_VGA_H),
        .i_V_render    (i_VGA_V),
        .i_x           (i_car1_x),
        .i_y           (i_car1_y),
        .o_render      (render_car1_circle)
    );

    CarCircleGenerator u_CarCircleGenerator_car2 (
        .i_H_render    (i_VGA_H),
        .i_V_render    (i_VGA_V),
        .i_x           (i_car2_x),
        .i_y           (i_car2_y),
        .o_render      (render_car2_circle)
    );

    /*---------------------------------------------------- velocity render ----------------------------------------------------*/
    game_pkg::VelocityDisplayDigit render_car1_digit, render_car2_digit;
    wire [3:0] render_car1_digit_value, render_car2_digit_value;
    reg [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] render_car1_digit_pixel_index, render_car2_digit_pixel_index;

    VelocityDisplayDecoder u_VelocityDisplayDecoder_car1 (
        .i_value                (i_car1_v_m),
        .i_H_render             (i_VGA_H),
        .i_V_render             (i_VGA_V),
        .i_UNIT_H_LT            (game_pkg::CAR1_VELOCITY_DISPLAY_UNIT_H_POS),
        .i_ONE_H_LT             (game_pkg::CAR1_VELOCITY_DISPLAY_ONE_H_POS),
        .i_TEN_H_LT             (game_pkg::CAR1_VELOCITY_DISPLAY_TEN_H_POS),
        .i_HUNDRED_H_LT         (game_pkg::CAR1_VELOCITY_DISPLAY_HUNDRED_H_POS),
        .i_V_POS_MIN            (game_pkg::VELOCITY_DISPLAY_V_POS_MIN),
        .i_V_POS_MAX            (game_pkg::VELOCITY_DISPLAY_V_POS_MAX),
        .o_render_digit         (render_car1_digit),
        .o_render_value         (render_car1_digit_value),
        .o_object_pixel_index   (render_car1_digit_pixel_index)
    );

    VelocityDisplayDecoder u_VelocityDisplayDecoder_car2 (
        .i_value                (i_car2_v_m),
        .i_H_render             (i_VGA_H),
        .i_V_render             (i_VGA_V),
        .i_UNIT_H_LT            (game_pkg::CAR2_VELOCITY_DISPLAY_UNIT_H_POS),
        .i_ONE_H_LT             (game_pkg::CAR2_VELOCITY_DISPLAY_ONE_H_POS),
        .i_TEN_H_LT             (game_pkg::CAR2_VELOCITY_DISPLAY_TEN_H_POS),
        .i_HUNDRED_H_LT         (game_pkg::CAR2_VELOCITY_DISPLAY_HUNDRED_H_POS),
        .i_V_POS_MIN            (game_pkg::VELOCITY_DISPLAY_V_POS_MIN),
        .i_V_POS_MAX            (game_pkg::VELOCITY_DISPLAY_V_POS_MAX),
        .o_render_digit         (render_car2_digit),
        .o_render_value         (render_car2_digit_value),
        .o_object_pixel_index   (render_car2_digit_pixel_index)
    );
    
    /*----------------------------------------------------- start render -----------------------------------------------------*/
    always @(*) begin
        if (i_VGA_V <= sram_pkg::MAP_V) begin
            if (render_car1_circle) begin
                o_object_id = game_pkg::OBJECT_CAR1_CIRCLE;
                o_object_pixel_index = 0; // not important, just set to 0
            end
            else if (render_car2_circle) begin
                o_object_id = game_pkg::OBJECT_CAR2_CIRCLE;
                o_object_pixel_index = 0; // not important, just set to 0
            end
            else if (render_car1) begin
                if (i_car1_opacity_mask[car1_rel_V][car1_rel_H]) begin
                    // not transparent, render car1
                    // $display("render car1 at (%d, %d)", i_VGA_H, i_VGA_V);
                    o_object_id = game_pkg::OBJECT_CAR1;
                    o_object_pixel_index = render_car1_index; // VGA H and V start from 1, already handled in XYtoBoundaries
                end
                else begin
                    // transparent, render map
                    o_object_id = game_pkg::OBJECT_MAP;
                    o_object_pixel_index = render_map_index; // VGA H and V start from 1
                end
            end
            else if (render_car2) begin
                if (i_car2_opacity_mask[car2_rel_V][car2_rel_H]) begin
                    // not transparent, render car2
                    // $display("render car2 at (%d, %d)", i_VGA_H, i_VGA_V);
                    o_object_id = game_pkg::OBJECT_CAR2;
                    o_object_pixel_index = render_car2_index; // VGA H and V start from 1, already handled in XYtoBoundaries
                end
                else begin
                    // transparent, render map
                    o_object_id = game_pkg::OBJECT_MAP;
                    o_object_pixel_index = render_map_index; // VGA H and V start from 1
                end
            end
            else begin
                // render map
                o_object_id = game_pkg::OBJECT_MAP;
                o_object_pixel_index = render_map_index; // VGA H and V start from 1
            end
        end
        else begin
            if (render_car1_digit != game_pkg::VELOCITY_DISPLAY_BG) begin
                o_object_id = game_pkg::OBJECT_BAR_DIGIT;
                o_object_pixel_index = render_car1_digit_pixel_index; // VGA H and V start from 1
            end
            else if (render_car2_digit != game_pkg::VELOCITY_DISPLAY_BG) begin
                o_object_id = game_pkg::OBJECT_BAR_DIGIT;
                o_object_pixel_index = render_car2_digit_pixel_index; // VGA H and V start from 1
            end
            else begin
                o_object_id = game_pkg::OBJECT_BAR;
                o_object_pixel_index = render_bar_index; // not important, just set to 0
            end
        end
    end
endmodule

module XYtoBoundaries (
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

module CarCircleGenerator (
    input [sram_pkg::MAP_H_WIDTH-1:0] i_H_render,
    input [sram_pkg::MAP_V_WIDTH-1:0] i_V_render,

    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,

    output o_render
);    
    // if the distance of
    // render pixel coor and the center between (IMAGE_SIZE/2-CAR_CIRCLE_PIXEL_WIDTH) and (IMAGE_SIZE/2)
    // then render the circle

    // (H,V) is converted to (x_h,y_v)
    // x_h = H - MAP_H/2 - 0.5
    // y_v = MAP_V/2 - V + 0.5
    // use (2x, 2y) to avoid floating point calculation
    // 2x_h = 2H - MAP_H - 1
    // 2y_v = MAP_V - 2V - 1
    // distance_square = (2x_h-2i_x)^2 + (2y_v-2i_y)^2
    // if (IMAGE_SIZE-CAR_CIRCLE_PIXEL_WIDTH*2)^2 <= distance_square <= (IMAGE_SIZE)^2, render
    
    wire signed [sram_pkg::MAP_H_WIDTH:0] x_h_times_2;
    wire signed [sram_pkg::MAP_V_WIDTH:0] y_v_times_2;
    assign x_h_times_2 = (i_H_render << 1) - sram_pkg::MAP_H - 1;
    assign y_v_times_2 = sram_pkg::MAP_V - (i_V_render << 1) - 1;

    wire signed [sram_pkg::MAP_H_WIDTH:0] x_h_minus_i_x_times_2;
    wire signed [sram_pkg::MAP_V_WIDTH:0] y_v_minus_i_y_times_2;
    assign x_h_minus_i_x_times_2 = x_h_times_2 - (i_x << 1);
    assign y_v_minus_i_y_times_2 = y_v_times_2 - (i_y << 1);

    wire signed [31:0] distance_square;
    assign distance_square = x_h_minus_i_x_times_2 * x_h_minus_i_x_times_2 + y_v_minus_i_y_times_2 * y_v_minus_i_y_times_2;

    wire signed [31:0] lower_bound, upper_bound;
    assign lower_bound = (sram_pkg::IMAGE_SIZE - (game_pkg::CAR_CIRCLE_PIXEL_WIDTH << 1)) * (sram_pkg::IMAGE_SIZE - (game_pkg::CAR_CIRCLE_PIXEL_WIDTH << 2));
    assign upper_bound = sram_pkg::IMAGE_SIZE * sram_pkg::IMAGE_SIZE;

    assign o_render = (distance_square >= lower_bound) && (distance_square <= upper_bound);
endmodule

module VelocityDisplayDecoder (
    input [game_pkg::VELOCITY_OUTPUT_WIDTH-1:0] i_value,
    input [sram_pkg::MAP_H_WIDTH-1:0] i_H_render,
    input [sram_pkg::MAP_V_WIDTH-1:0] i_V_render,

    input [sram_pkg::MAP_H_WIDTH-1:0] i_UNIT_H_LT,
    input [sram_pkg::MAP_H_WIDTH-1:0] i_ONE_H_LT,
    input [sram_pkg::MAP_H_WIDTH-1:0] i_TEN_H_LT,
    input [sram_pkg::MAP_H_WIDTH-1:0] i_HUNDRED_H_LT,

    input [sram_pkg::MAP_V_WIDTH-1:0] i_V_POS_MIN,
    input [sram_pkg::MAP_V_WIDTH-1:0] i_V_POS_MAX,

    output game_pkg::VelocityDisplayDigit o_render_digit,
    output [3:0] o_render_value,
    output [sram_pkg::MAP_H_WIDTH+sram_pkg::MAP_V_WIDTH-1:0] o_object_pixel_index
);
    wire [3:0] hundred, ten, one;
    assign hundred = i_value / 100;
    assign ten = (i_value % 100) / 10;
    assign one = (i_value % 10);

    wire render_hundred, render_ten, render_one;
    assign render_hundred = i_H_render >= i_HUNDRED_H_LT
                            & i_H_render < i_TEN_H_LT
                            & i_V_render >= i_V_POS_MIN
                            & i_V_render <= i_V_POS_MAX;
    assign render_ten = i_H_render >= i_TEN_H_LT
                        & i_H_render < i_ONE_H_LT
                        & i_V_render >= i_V_POS_MIN
                        & i_V_render <= i_V_POS_MAX;
    assign render_one = i_H_render >= i_ONE_H_LT
                        & i_H_render < i_UNIT_H_LT
                        & i_V_render >= i_V_POS_MIN
                        & i_V_render <= i_V_POS_MAX;
    always @(*) begin
        if (render_hundred) begin
            o_render_digit = game_pkg::VELOCITY_DISPLAY_HUNDRED;
            o_render_value = hundred;
            o_object_pixel_index = (i_V_render - i_V_POS_MIN + o_render_value * sram_pkg::BAR_DIGIT_V) * sram_pkg::BAR_DIGIT_H + (i_H_render - i_HUNDRED_H_LT);
        end
        else if (render_ten) begin
            o_render_digit = game_pkg::VELOCITY_DISPLAY_TEN;
            o_render_value = ten;
            o_object_pixel_index = (i_V_render - i_V_POS_MIN + o_render_value * sram_pkg::BAR_DIGIT_V) * sram_pkg::BAR_DIGIT_H + (i_H_render - i_TEN_H_LT);
        end
        else if (render_one) begin
            o_render_digit = game_pkg::VELOCITY_DISPLAY_ONE;
            o_render_value = one;
            o_object_pixel_index = (i_V_render - i_V_POS_MIN + o_render_value * sram_pkg::BAR_DIGIT_V) * sram_pkg::BAR_DIGIT_H + (i_H_render - i_ONE_H_LT);
        end
        else begin
            o_render_digit = game_pkg::VELOCITY_DISPLAY_BG;
            o_render_value = 0;
            o_object_pixel_index = 0; // not important, just set to 0
        end
    end
endmodule