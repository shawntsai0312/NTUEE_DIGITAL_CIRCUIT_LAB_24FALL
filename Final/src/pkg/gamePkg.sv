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
        OBJECT_CAR2_CIRCLE = 4'd6,
        OBJECT_START_CAPTION = 4'd7,
        OBJECT_WIN_CAPTION = 4'd8,
        OBJECT_LOSE_CAPTION = 4'd9,
        OBJECT_IDLE_BG = 4'd10,
        OBJECT_QBLOCK = 4'd11
    } ObjectID;

    typedef enum logic [1:0] {
        GAME_RESULT_IDLE = 2'd0,
        GAME_RESULT_CAR1_WIN = 2'd1,
        GAME_RESULT_CAR2_WIN = 2'd2
    } GameResult;

    localparam int X_MIN = -sram_pkg::MAP_H;
    localparam int X_MAX = sram_pkg::MAP_H;
    localparam int Y_MIN = -sram_pkg::MAP_V;
    localparam int Y_MAX = sram_pkg::MAP_V;

    localparam int CAR_CIRCLE_PIXEL_WIDTH = 2;
    localparam int CAR_MASS_LEVEL_NUM = 10;
    localparam int CAR_MASS_LEVEL_NUM_WIDTH = 4;
    localparam int CAR_INIT_MASS_LEVEL = 5;

    localparam int ANG_WIDTH = 9;
    localparam int ANG_FRACTION_WIDTH = 1;

    localparam int VELOCITY_INTEGER_WIDTH = 4; // 2's complement, MSB is -2^3, LSB is 2^0
    localparam int VELOCITY_FRACTION_WIDTH = 6;
    localparam int VELOCITY_MAX = 7; // must be smaller than 2^(VELOCITY_INTEGER_WIDTH-1)

    localparam int ACCELERATION_FRACTION_WIDTH = 6;

    // localparam int FRICTION_CONSTANT_RECIPROCAL = 1 - 1/64; // fraction_constant = 64/63
    localparam int FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT = 7; // minus 1/64, so shift 6 bits to the right

    localparam int VELOCITY_OUTPUT_WIDTH = VELOCITY_INTEGER_WIDTH + VELOCITY_FRACTION_WIDTH - 3;
    

    typedef enum logic [1:0] {
        VELOCITY_DISPLAY_HUNDRED = 2'd0,
        VELOCITY_DISPLAY_TEN = 2'd1,
        VELOCITY_DISPLAY_ONE = 2'd2,
        VELOCITY_DISPLAY_BG = 2'd3
    } VelocityDisplayDigit;

    localparam int VELOCITY_DISPLAY_V_POS_MIN = 60 + sram_pkg::MAP_V; // V start from 1
    localparam int VELOCITY_DISPLAY_V_POS_MAX = VELOCITY_DISPLAY_V_POS_MIN + sram_pkg::BAR_DIGIT_V - 1;

    // LT pos of H, H is 1 based
    localparam int CAR1_LAP_DISPLAY_H_POS_MIN = 696;
    localparam int CAR1_LAP_DISPLAY_H_POS_MAX = CAR1_LAP_DISPLAY_H_POS_MIN + sram_pkg::BAR_DIGIT_H - 1;

    localparam int CAR1_LEVEL_DISPLAY_H_POS_MIN = 513;
    localparam int CAR1_LEVEL_DISPLAY_H_POS_MAX = CAR1_LEVEL_DISPLAY_H_POS_MIN + sram_pkg::BAR_DIGIT_H - 1;

    localparam int CAR1_VELOCITY_DISPLAY_UNIT_H_POS = 301;
    localparam int CAR1_VELOCITY_DISPLAY_ONE_H_POS = CAR1_VELOCITY_DISPLAY_UNIT_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR1_VELOCITY_DISPLAY_TEN_H_POS = CAR1_VELOCITY_DISPLAY_ONE_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR1_VELOCITY_DISPLAY_HUNDRED_H_POS = CAR1_VELOCITY_DISPLAY_TEN_H_POS - sram_pkg::BAR_DIGIT_H;

    // LT pos of H, H is 1 based
    localparam int CAR2_LAP_DISPLAY_H_POS_MIN = 901;
    localparam int CAR2_LAP_DISPLAY_H_POS_MAX = CAR2_LAP_DISPLAY_H_POS_MIN + sram_pkg::BAR_DIGIT_H - 1;

    localparam int CAR2_LEVEL_DISPLAY_H_POS_MIN = 1087;
    localparam int CAR2_LEVEL_DISPLAY_H_POS_MAX = CAR2_LEVEL_DISPLAY_H_POS_MIN + sram_pkg::BAR_DIGIT_H - 1;

    localparam int CAR2_VELOCITY_DISPLAY_UNIT_H_POS = 1326;
    localparam int CAR2_VELOCITY_DISPLAY_ONE_H_POS = CAR2_VELOCITY_DISPLAY_UNIT_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR2_VELOCITY_DISPLAY_TEN_H_POS = CAR2_VELOCITY_DISPLAY_ONE_H_POS - sram_pkg::BAR_DIGIT_H;
    localparam int CAR2_VELOCITY_DISPLAY_HUNDRED_H_POS = CAR2_VELOCITY_DISPLAY_TEN_H_POS - sram_pkg::BAR_DIGIT_H;

    localparam int CAR1_INIT_X = -500;
    localparam int CAR1_INIT_Y = -250 - (sram_pkg::CAR_SIZE>>1) - 10;
    localparam int CAR2_INIT_X = -500;
    localparam int CAR2_INIT_Y = -365 + (sram_pkg::CAR_SIZE>>1) + 10;
    localparam int CAR_INIT_ANGLE = 180;

    // localparam int FINISH_LINE_X = -538;
    localparam int LAP_MAX = 3;
    localparam int SINGLE_DIGIT_WIDTH = 4;

    localparam int CAR_COLLISION_SEPARATE_CONST = 0;

    localparam int START_CAPTION_H_POS_MIN = 470;
    localparam int START_CAPTION_H_POS_MAX = START_CAPTION_H_POS_MIN + sram_pkg::START_CAPTION_H - 1;
    localparam int START_CAPTION_V_POS_MIN = 569;
    localparam int START_CAPTION_V_POS_MAX = START_CAPTION_V_POS_MIN + sram_pkg::START_CAPTION_V - 1;

    localparam int WIN_LOSE_LEFT_CAPTION_H_POS_MIN = 446;
    localparam int WIN_LOSE_LEFT_CAPTION_H_POS_MAX = WIN_LOSE_LEFT_CAPTION_H_POS_MIN + sram_pkg::WIN_LOSE_CAPTION_H - 1;
    localparam int WIN_LOSE_RIGHT_CAPTION_H_POS_MIN = 955;
    localparam int WIN_LOSE_RIGHT_CAPTION_H_POS_MAX = WIN_LOSE_RIGHT_CAPTION_H_POS_MIN + sram_pkg::WIN_LOSE_CAPTION_H - 1;
    localparam int WIN_LOSE_CAPTION_V_POS_MIN = 569;
    localparam int WIN_LOSE_CAPTION_V_POS_MAX = WIN_LOSE_CAPTION_V_POS_MIN + sram_pkg::WIN_LOSE_CAPTION_V - 1;

    localparam int QBLOCK_REGENERATE_INTERVAL = 10; // 10 seconds
    localparam int QBLOCK_REGENERATE_INTERVAL_WIDTH = 4; // 2^4 = 16

    localparam int QBLOCK0_X = -707;
    localparam int QBLOCK0_Y = 0;

    // // debug
    // localparam int QBLOCK0_X = 200;
    // localparam int QBLOCK0_Y = 0;

    localparam int QBLOCK1_X = -235;
    localparam int QBLOCK1_Y = -155;

    // // debug
    // localparam int QBLOCK1_X = 100;
    // localparam int QBLOCK1_Y = 0;

    localparam int QBLOCK2_X = 688;
    localparam int QBLOCK2_Y = 0;

    localparam int QBLOCK3_X = 0;
    localparam int QBLOCK3_Y = -308;
endpackage
