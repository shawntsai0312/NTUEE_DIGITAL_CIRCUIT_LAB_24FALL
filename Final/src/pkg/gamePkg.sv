package game_pkg;
    localparam int OBJECT_OPACITY_NUM = 2; // no map and bar and ?blocks
    localparam int OBJECT_OPACITY_NUM_WIDTH = 2;
    
    typedef enum logic [3:0] {
        OBJECT_MAP  = 4'd0,
        OBJECT_BAR  = 4'd1,
        OBJECT_CAR1 = 4'd2, 
        OBJECT_CAR2 = 4'd3,
        OBJECT_CAR1_CIRCLE = 4'd4,
        OBJECT_CAR2_CIRCLE = 4'd5
    } ObjectID;

    localparam int CAR_CIRCLE_PIXEL_WIDTH = 2;
    localparam int CAR_MASS_LEVEL_NUM = 3;
    localparam int CAR_MASS_LEVEL_NUM_WIDTH = 2;

    localparam int ANG_WIDTH = 9;

    localparam int VELOCITY_INTEGER_WIDTH = 4; // 2's complement, MSB is -2^3, LSB is 2^0
    localparam int VELOCITY_FRACTION_WIDTH = 6;
    localparam int VELOCITY_MAX = 7; // must be smaller than 2^(VELOCITY_INTEGER_WIDTH-1)

    localparam int ACCELERATION_FRACTION_WIDTH = 6;

    localparam int FRICTION_CONSTANT_RECIPROCAL = 1 - 1/64; // fraction_constant = 64/63
    localparam int FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT = 6; // minus 1/64, so shift 6 bits to the right
    
    
endpackage
