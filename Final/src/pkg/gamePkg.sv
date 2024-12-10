package game_pkg;
    import sram_pkg::*;

    localparam int OBJECT_OPACITY_NUM = 2; // no map and bar and ?blocks
    localparam int OBJECT_OPACITY_NUM_WIDTH = 2;
    
    typedef enum logic [3:0] {
        OBJECT_MAP  = 4'd0,
        OBJECT_BAR  = 4'd1,
        OBJECT_BAR_DIGIT = 4'd2,
        OBJECT_CAR1 = 4'd3, 
        OBJECT_CAR2 = 4'd4,
        OBJECT_CAR1_CIRCLE = 4'd5,
        OBJECT_CAR2_CIRCLE = 4'd6
    } ObjectID;

    localparam int CAR_CIRCLE_PIXEL_WIDTH = 2;
    localparam int CAR_MASS_LEVEL_NUM = 3;
    localparam int CAR_MASS_LEVEL_NUM_WIDTH = 2;

    localparam int ANG_WIDTH = 9;

    localparam int VELOCITY_INTEGER_WIDTH = 4; // 2's complement, MSB is -2^3, LSB is 2^0
    localparam int VELOCITY_FRACTION_WIDTH = 6;
    localparam int VELOCITY_MAX = 7; // must be smaller than 2^(VELOCITY_INTEGER_WIDTH-1)

    localparam int ACCELERATION_FRACTION_WIDTH = 6;

    // localparam int FRICTION_CONSTANT_RECIPROCAL = 1 - 1/64; // fraction_constant = 64/63
    localparam int FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT = 6; // minus 1/64, so shift 6 bits to the right

    localparam int VELOCITY_OUTPUT_WIDTH = VELOCITY_INTEGER_WIDTH + VELOCITY_FRACTION_WIDTH - 3;
    

    typedef enum logic [1:0] {
        VELOCITY_DISPLAY_HUNDRED = 2'd0,
        VELOCITY_DISPLAY_TEN = 2'd1,
        VELOCITY_DISPLAY_ONE = 2'd2,
        VELOCITY_DISPLAY_BG = 2'd3
    } VelocityDisplayDigit;

    localparam int VELOCITY_DISPLAY_V_POS_MIN = 61 + sram_pkg::MAP_V; // V start from 1
    localparam int VELOCITY_DISPLAY_V_POS_MAX = 61 + sram_pkg::MAP_V + sram_pkg::BAR_DIGIT_V - 1;

     // LT pos of H, H is 1 based
    localparam int CAR1_VELOCITY_DISPLAY_UNIT_H_POS = 301;
    localparam int CAR1_VELOCITY_DISPLAY_ONE_H_POS = CAR1_VELOCITY_DISPLAY_UNIT_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR1_VELOCITY_DISPLAY_TEN_H_POS = CAR1_VELOCITY_DISPLAY_ONE_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR1_VELOCITY_DISPLAY_HUNDRED_H_POS = CAR1_VELOCITY_DISPLAY_TEN_H_POS - sram_pkg::BAR_DIGIT_H;

     // LT pos of H, H start from 1
    localparam int CAR2_VELOCITY_DISPLAY_UNIT_H_POS = 1326;
    localparam int CAR2_VELOCITY_DISPLAY_ONE_H_POS = CAR2_VELOCITY_DISPLAY_UNIT_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR2_VELOCITY_DISPLAY_TEN_H_POS = CAR2_VELOCITY_DISPLAY_ONE_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR2_VELOCITY_DISPLAY_HUNDRED_H_POS = CAR2_VELOCITY_DISPLAY_TEN_H_POS - sram_pkg::BAR_DIGIT_H;
endpackage
