import game_pkg::*;
import sram_pkg::*;
import track_pkg::*;

module GameControl (
    input i_clk,
    input i_render_clk,
    input i_rst_n,
    input [2:0] i_car1_acc, // 0 to 7, temp
    input [2:0] i_car2_acc, // 0 to 7, temp
    input [1:0] i_car1_omega, // -1 to 1
    input [1:0] i_car2_omega, // -1 to 1
    output signed [game_pkg::ANG_WIDTH-1:0] o_car1_angle,
    output signed [game_pkg::ANG_WIDTH-1:0] o_car2_angle,
    output signed [sram_pkg::MAP_H_WIDTH-1:0] o_car1_x,
    output signed [sram_pkg::MAP_V_WIDTH-1:0] o_car1_y,
    output signed [sram_pkg::MAP_H_WIDTH-1:0] o_car2_x,
    output signed [sram_pkg::MAP_V_WIDTH-1:0] o_car2_y,
    output [game_pkg::VELOCITY_OUTPUT_WIDTH-1:0] o_car1_v_m,
    output [game_pkg::VELOCITY_OUTPUT_WIDTH-1:0] o_car2_v_m,
    output [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] o_car1_mass_level,
    output [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] o_car2_mass_level,
    output [game_pkg::SINGLE_DIGIT_WIDTH-1:0] o_car1_lap,
    output [game_pkg::SINGLE_DIGIT_WIDTH-1:0] o_car2_lap
);

    parameter x_max = 800;
    parameter x_min = -800;
    parameter y_max = 400;
    parameter y_min = -400;

    /*--------------------------------------------------- flip-flop declaration ---------------------------------------------------*/
    // angle
    reg signed [game_pkg::ANG_WIDTH:0] car1_angle_r, car1_angle_w; // 0 to 360
    reg signed [game_pkg::ANG_WIDTH:0] car2_angle_r, car2_angle_w; // 0 to 360
    assign o_car1_angle = car1_angle_r - 180;
    assign o_car2_angle = car2_angle_r - 180;

    // position
    reg signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_x_r, car1_x_w; // -750 to 750, with decimal
    reg signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_y_r, car1_y_w; // -350 to 350, with decimal
    reg signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_x_r, car2_x_w; // -750 to 750, with decimal
    reg signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_y_r, car2_y_w; // -350 to 350, with decimal
    assign o_car1_x = (car1_x_r >>> game_pkg::VELOCITY_FRACTION_WIDTH) + car1_x_r[game_pkg::VELOCITY_FRACTION_WIDTH-1]; // round to nearest
    assign o_car1_y = (car1_y_r >>> game_pkg::VELOCITY_FRACTION_WIDTH) + car1_y_r[game_pkg::VELOCITY_FRACTION_WIDTH-1]; // round to nearest
    assign o_car2_x = (car2_x_r >>> game_pkg::VELOCITY_FRACTION_WIDTH) + car2_x_r[game_pkg::VELOCITY_FRACTION_WIDTH-1]; // round to nearest
    assign o_car2_y = (car2_y_r >>> game_pkg::VELOCITY_FRACTION_WIDTH) + car2_y_r[game_pkg::VELOCITY_FRACTION_WIDTH-1]; // round to nearest

    // velocity magnitude
    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_v_m_r, car1_v_m_w;
    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_v_m_r, car2_v_m_w;
    assign o_car1_v_m = car1_v_m_r[game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-2:2]; // no need to output the sign bit
    assign o_car2_v_m = car2_v_m_r[game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-2:2]; // no need to output the sign bit

    // velocity vector
    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_v_x_r, car1_v_x_w;
    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_v_y_r, car1_v_y_w;
    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_v_x_r, car2_v_x_w;
    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_v_y_r, car2_v_y_w;

    // mass level
    reg [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] car1_mass_level_r, car1_mass_level_w;
    reg [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] car2_mass_level_r, car2_mass_level_w;
    assign o_car1_mass_level = car1_mass_level_r;
    assign o_car2_mass_level = car2_mass_level_r;
    assign car1_mass_level_w = 1;
    assign car2_mass_level_w = 1;

    // lap
    reg [game_pkg::SINGLE_DIGIT_WIDTH-1:0] car1_lap_r, car1_lap_w;
    reg [game_pkg::SINGLE_DIGIT_WIDTH-1:0] car2_lap_r, car2_lap_w;
    assign o_car1_lap = car1_lap_r;
    assign o_car2_lap = car2_lap_r;

    // in track 0
    reg car1_is_in_track0_now, car1_is_in_track0_next, car1_is_in_track0_prev;
    reg car2_is_in_track0_now, car2_is_in_track0_next, car2_is_in_track0_prev;

    // in track 1
    reg car1_is_in_track1_now, car1_is_in_track1_next, car1_is_in_track1_prev;
    reg car2_is_in_track1_now, car2_is_in_track1_next, car2_is_in_track1_prev;

    // track collision
    reg car1_track_collision_r, car1_track_collision_w;
    reg car2_track_collision_r, car2_track_collision_w;

    // car collision
    reg car_collsion;

    /*--------------------------------------------------- velocity decomposition ---------------------------------------------------*/

    wire car1_v_decomposition_done, car2_v_decomposition_done;
    RotateXYnonPipelined #(
        .VEC_WIDTH            (game_pkg::VELOCITY_INTEGER_WIDTH + game_pkg::VELOCITY_FRACTION_WIDTH),
        .ANG_WIDTH            (game_pkg::ANG_WIDTH)
    ) u_Rotate_car1_v (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (1), 
        .i_x                  (car1_v_m_r),
        .i_y                  (0),
        .i_angle              ((car1_angle_r > 180) ? (car1_angle_r - 360) : car1_angle_r), // -180 to 180
        .o_x                  (car1_v_x_w),
        .o_y                  (car1_v_y_w),
        .o_done               (car1_v_decomposition_done)
    );

    RotateXYnonPipelined #(
        .VEC_WIDTH            (game_pkg::VELOCITY_INTEGER_WIDTH + game_pkg::VELOCITY_FRACTION_WIDTH),
        .ANG_WIDTH            (game_pkg::ANG_WIDTH)
    ) u_Rotate_car2_v (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (1), 
        .i_x                  (car2_v_m_r),
        .i_y                  (0),
        .i_angle              ((car2_angle_r > 180) ? (car2_angle_r - 360) : car2_angle_r), // -180 to 180
        .o_x                  (car2_v_x_w),
        .o_y                  (car2_v_y_w),
        .o_done               (car2_v_decomposition_done)
    );

    /*------------------------------------------------------ track collision ------------------------------------------------------*/
    TrackCollision u_TrackCollision_car1 (
        .i_x            ((car1_x_r >>> game_pkg::VELOCITY_FRACTION_WIDTH)),
        .i_y            ((car1_y_r >>> game_pkg::VELOCITY_FRACTION_WIDTH)),
        .i_v_x          (car1_v_x_r),
        .i_v_y          (car1_v_y_r),
        .i_radius       ((sram_pkg::IMAGE_SIZE >> 1)),
        .o_in_track0    (car1_is_in_track0_next),
        .o_in_track1    (car1_is_in_track1_next),
        .o_collision    (car1_track_collision_w)
    );
    TrackCollision u_TrackCollision_car2 (
        .i_x            ((car2_x_r >>> game_pkg::VELOCITY_FRACTION_WIDTH)),
        .i_y            ((car2_y_r >>> game_pkg::VELOCITY_FRACTION_WIDTH)),
        .i_v_x          (car2_v_x_r),
        .i_v_y          (car2_v_y_r),
        .i_radius       ((sram_pkg::IMAGE_SIZE >> 1)),
        .o_in_track0    (car2_is_in_track0_next),
        .o_in_track1    (car2_is_in_track1_next),
        .o_collision    (car2_track_collision_w)
    );

    /*------------------------------------------------------- car collision -------------------------------------------------------*/
    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_after_collision_v, car2_after_collision_v;
    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_after_collision_v_x, car1_after_collision_v_y;
    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_after_collision_v_x, car2_after_collision_v_y;
    wire signed [game_pkg::ANG_WIDTH-1:0] car1_after_collision_angle, car2_after_collision_angle;
    CarCollision u_CarCollision (
        .i_clk            (i_clk),
        .i_rst_n          (i_rst_n),
        .i_car1_x         (car1_x_r),
        .i_car1_y         (car1_y_r),
        .i_car2_x         (car2_x_r),
        .i_car2_y         (car2_y_r),
        .i_car1_v_x       (car1_v_x_r),
        .i_car1_v_y       (car1_v_y_r),
        .i_car2_v_x       (car2_v_x_r),
        .i_car2_v_y       (car2_v_y_r),
        .i_car1_radius    ((sram_pkg::IMAGE_SIZE >> 1)),
        .i_car2_radius    ((sram_pkg::IMAGE_SIZE >> 1)),
        .i_car1_mass      (car1_mass_level_r),
        .i_car2_mass      (car2_mass_level_r),
        .o_car1_v_m       (car1_after_collision_v),
        .o_car2_v_m       (car2_after_collision_v),
        .o_car1_v_x       (car1_after_collision_v_x),
        .o_car1_v_y       (car1_after_collision_v_y),
        .o_car2_v_x       (car2_after_collision_v_x),
        .o_car2_v_y       (car2_after_collision_v_y),
        .o_car1_angle     (car1_after_collision_angle),
        .o_car2_angle     (car2_after_collision_angle),
        .o_collision      (car_collsion)
    );

    /*------------------------------------------------------- flip-flop next -------------------------------------------------------*/
    // mass level update


    // lap update
    always @(*) begin
        car1_lap_w = car1_lap_r;
        car2_lap_w = car2_lap_r;

        if (car1_is_in_track0_prev && car1_is_in_track1_now) car1_lap_w = car1_lap_r + 1;
        if (car2_is_in_track0_prev && car2_is_in_track1_now) car2_lap_w = car2_lap_r + 1;

        if (car1_is_in_track1_prev && car1_is_in_track0_now) begin
            if (car1_lap_r > 0) car1_lap_w = car1_lap_r - 1;
            else                car1_lap_w = 0;
        end
        if (car2_is_in_track1_prev && car2_is_in_track0_now) begin
            if (car2_lap_r > 0) car2_lap_w = car2_lap_r - 1;
            else                car2_lap_w = 0;
        end
    end

    // velocity update
    reg signed [31:0] car1_v_temp_shift, car2_v_temp_shift; // prevent bit truncation
    always @(*) begin
        car1_v_temp_shift = car1_v_m_r << game_pkg::FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT;
        car2_v_temp_shift = car2_v_m_r << game_pkg::FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT;
        car1_v_m_w = ((car1_v_temp_shift - car1_v_m_r) >>> game_pkg::FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT)
                    + ((i_car1_acc)<<(game_pkg::VELOCITY_FRACTION_WIDTH-game_pkg::ACCELERATION_FRACTION_WIDTH));
        car2_v_m_w = ((car2_v_temp_shift - car2_v_m_r) >>> game_pkg::FRICTION_CONSTANT_RECIPROCAL_REMAIN_SHIFT)
                    + ((i_car2_acc)<<(game_pkg::VELOCITY_FRACTION_WIDTH-game_pkg::ACCELERATION_FRACTION_WIDTH));

        // fix velocity, the range can only be [0, game_pkg::VELOCITY_MAX]
        if (car1_v_m_w < 0) car1_v_m_w = 0;
        if (car2_v_m_w < 0) car2_v_m_w = 0;
        if (car1_v_m_w > (game_pkg::VELOCITY_MAX << game_pkg::VELOCITY_FRACTION_WIDTH)) car1_v_m_w = (game_pkg::VELOCITY_MAX << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car2_v_m_w > (game_pkg::VELOCITY_MAX << game_pkg::VELOCITY_FRACTION_WIDTH)) car2_v_m_w = (game_pkg::VELOCITY_MAX << game_pkg::VELOCITY_FRACTION_WIDTH);

        if (car_collsion) begin
            car1_v_m_w = car1_after_collision_v;
            car2_v_m_w = car2_after_collision_v;
        end

        if (car1_track_collision_r) car1_v_m_w = 1; // cannot set to 0, cuz 0 will cause track_collision = false, and thus going out of track
        if (car2_track_collision_r) car2_v_m_w = 1; // cannot set to 0, cuz 0 will cause track_collision = false, and thus going out of track
    end

    // position update
    always @(*) begin
        car1_x_w = car1_x_r + car1_v_x_r;
        car1_y_w = car1_y_r + car1_v_y_r;
        car2_x_w = car2_x_r + car2_v_x_r;
        car2_y_w = car2_y_r + car2_v_y_r;

        // fix position, the range of x can only be [-750, 750], the range of y can only be [-350, 350]
        if (car1_x_w <= (x_min << game_pkg::VELOCITY_FRACTION_WIDTH)) car1_x_w = (x_min << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car2_x_w <= (x_min << game_pkg::VELOCITY_FRACTION_WIDTH)) car2_x_w = (x_min << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car1_x_w >= (x_max << game_pkg::VELOCITY_FRACTION_WIDTH)) car1_x_w = (x_max << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car2_x_w >= (x_max << game_pkg::VELOCITY_FRACTION_WIDTH)) car2_x_w = (x_max << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car1_y_w <= (y_min << game_pkg::VELOCITY_FRACTION_WIDTH)) car1_y_w = (y_min << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car2_y_w <= (y_min << game_pkg::VELOCITY_FRACTION_WIDTH)) car2_y_w = (y_min << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car1_y_w >= (y_max << game_pkg::VELOCITY_FRACTION_WIDTH)) car1_y_w = (y_max << game_pkg::VELOCITY_FRACTION_WIDTH);
        if (car2_y_w >= (y_max << game_pkg::VELOCITY_FRACTION_WIDTH)) car2_y_w = (y_max << game_pkg::VELOCITY_FRACTION_WIDTH);

        if (car_collsion) begin
            // times 4 to prevent the car from sticking to each other
            car1_x_w = car1_x_r + (car1_after_collision_v_x << game_pkg::CAR_COLLISION_SEPARATE_CONST);
            car1_y_w = car1_y_r + (car1_after_collision_v_y << game_pkg::CAR_COLLISION_SEPARATE_CONST);
            car2_x_w = car2_x_r + (car2_after_collision_v_x << game_pkg::CAR_COLLISION_SEPARATE_CONST);
            car2_y_w = car2_y_r + (car2_after_collision_v_y << game_pkg::CAR_COLLISION_SEPARATE_CONST);
        end

        if (car1_track_collision_r) begin
            car1_x_w = car1_x_r;
            car1_y_w = car1_y_r;
        end
        if (car2_track_collision_r) begin
            car2_x_w = car2_x_r;
            car2_y_w = car2_y_r;
        end
    end

    // angle update
    always @(*) begin
        if (i_car1_omega[0]) car1_angle_w = car1_angle_r;
        else begin
            if (i_car1_omega[1])    car1_angle_w = car1_angle_r + 1;
            else                    car1_angle_w = car1_angle_r - 1;
        end

        if (i_car2_omega[0]) car2_angle_w = car2_angle_r;
        else begin
            if (i_car2_omega[1])    car2_angle_w = car2_angle_r + 1;
            else                    car2_angle_w = car2_angle_r - 1;
        end

        if (car_collsion) begin
            car1_angle_w = (car1_after_collision_v == 0) ? car2_angle_r : car1_after_collision_angle;
            car2_angle_w = (car2_after_collision_v == 0) ? car1_angle_r : car2_after_collision_angle;
        end

        // fix angle, the range can only be [-180, 180]
        if (car1_angle_w <= 0) car1_angle_w = car1_angle_w + 360;
        if (car2_angle_w <= 0) car2_angle_w = car2_angle_w + 360;
        if (car1_angle_w >= 360) car1_angle_w = car1_angle_w - 360;
        if (car2_angle_w >= 360) car2_angle_w = car2_angle_w - 360;
    end

    /*------------------------------------------------------ flip-flop update ------------------------------------------------------*/
    always @(negedge i_render_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            // car1_x_r <= (game_pkg::CAR1_INIT_X << game_pkg::VELOCITY_FRACTION_WIDTH);
            // car1_y_r <= (game_pkg::CAR1_INIT_Y << game_pkg::VELOCITY_FRACTION_WIDTH);
            car1_x_r <= (350 << game_pkg::VELOCITY_FRACTION_WIDTH); // debug
            car1_y_r <= (32 << game_pkg::VELOCITY_FRACTION_WIDTH); // debug
            car1_v_m_r <= 0;
            car1_angle_r <= game_pkg::CAR_INIT_ANGLE;
            car1_track_collision_r <= 0;
            car1_mass_level_r <= 0;
            car1_lap_r <= 0;
            car1_is_in_track0_prev <= 1;
            car1_is_in_track0_now <= 1;
            car1_is_in_track1_prev <= 1;
            car1_is_in_track1_now <= 1;

            // car2_x_r <= (game_pkg::CAR2_INIT_X << game_pkg::VELOCITY_FRACTION_WIDTH);
            // car2_y_r <= (game_pkg::CAR2_INIT_Y << game_pkg::VELOCITY_FRACTION_WIDTH);
            car2_x_r <= (300 << game_pkg::VELOCITY_FRACTION_WIDTH); // debug
            car2_y_r <= (0 << game_pkg::VELOCITY_FRACTION_WIDTH); // debug
            car2_v_m_r <= 0;
            car2_angle_r <= game_pkg::CAR_INIT_ANGLE;
            car2_track_collision_r <= 0;
            car2_mass_level_r <= 0;
            car2_lap_r <= 0;
            car2_is_in_track0_prev <= 1;
            car2_is_in_track0_now <= 1;
            car2_is_in_track1_prev <= 1;
            car2_is_in_track1_now <= 1;
        end
        else begin
            car1_x_r <= car1_x_w;
            car1_y_r <= car1_y_w;
            car1_v_m_r <= car1_v_m_w;
            car1_angle_r <= car1_angle_w;
            car1_track_collision_r <= car1_track_collision_w;
            car1_mass_level_r <= car1_mass_level_w;
            car1_lap_r <= car1_lap_w;
            car1_is_in_track0_prev <= car1_is_in_track0_now;
            car1_is_in_track0_now <= car1_is_in_track0_next;
            car1_is_in_track1_prev <= car1_is_in_track1_now;
            car1_is_in_track1_now <= car1_is_in_track1_next;

            car2_x_r <= car2_x_w;
            car2_y_r <= car2_y_w;
            car2_v_m_r <= car2_v_m_w;
            car2_angle_r <= car2_angle_w;
            car2_track_collision_r <= car2_track_collision_w;
            car2_mass_level_r <= car2_mass_level_w;
            car2_lap_r <= car2_lap_w;
            car2_is_in_track0_prev <= car2_is_in_track0_now;
            car2_is_in_track0_now <= car2_is_in_track0_next;
            car2_is_in_track1_prev <= car2_is_in_track1_now;
            car2_is_in_track1_now <= car2_is_in_track1_next;
        end
    end

    always @(posedge car1_v_decomposition_done or negedge i_rst_n) begin
        if (!i_rst_n) begin
            car1_v_x_r <= 0;
            car1_v_y_r <= 0;
        end
        else begin
            car1_v_x_r <= car1_v_x_w;
            car1_v_y_r <= car1_v_y_w;
        end
    end

    always @(posedge car2_v_decomposition_done or negedge i_rst_n) begin
        if (!i_rst_n) begin
            car2_v_x_r <= 0;
            car2_v_y_r <= 0;
        end
        else begin
            car2_v_x_r <= car2_v_x_w;
            car2_v_y_r <= car2_v_y_w;
        end
    end

endmodule