module CarCollision (
    input i_clk,
    input i_rst_n,

    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_y,

    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_v_x,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_v_y,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_v_x,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_v_y,

    input signed [sram_pkg::IMAGE_COOR_WIDTH-1:0] i_car1_radius,
    input signed [sram_pkg::IMAGE_COOR_WIDTH-1:0] i_car2_radius,

    input [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] i_car1_mass,
    input [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] i_car2_mass,

    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car1_v_m,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car2_v_m,

    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car1_v_x,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car1_v_y,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car2_v_x,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car2_v_y,

    output signed [game_pkg::ANG_WIDTH-1:0] o_car1_angle,
    output signed [game_pkg::ANG_WIDTH-1:0] o_car2_angle,

    output reg o_collision
);

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_after_collision_v_x, car1_after_collision_v_y;
    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_after_collision_v_x, car2_after_collision_v_y;
    assign o_car1_v_x = car1_after_collision_v_x;
    assign o_car1_v_y = car1_after_collision_v_y;
    assign o_car2_v_x = car2_after_collision_v_x;
    assign o_car2_v_y = car2_after_collision_v_y;
    CarCollisionVelocityHandler u_CarCollisionVelocityHandler (
        .i_car1_x         (i_car1_x),
        .i_car1_y         (i_car1_y),
        .i_car2_x         (i_car2_x),
        .i_car2_y         (i_car2_y),
        .i_car1_v_x       (i_car1_v_x),
        .i_car1_v_y       (i_car1_v_y),
        .i_car2_v_x       (i_car2_v_x),
        .i_car2_v_y       (i_car2_v_y),
        .i_car1_radius    (i_car1_radius),
        .i_car2_radius    (i_car2_radius),
        .i_car1_mass      (i_car1_mass),
        .i_car2_mass      (i_car2_mass),
        .o_car1_v_x       (car1_after_collision_v_x),
        .o_car1_v_y       (car1_after_collision_v_y),
        .o_car2_v_x       (car2_after_collision_v_x),
        .o_car2_v_y       (car2_after_collision_v_y),
        .o_collision      (o_collision)
    );

    reg signed [(game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)-1:0] car1_after_collision_v_sqrt_r;
    wire signed [((game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)<<1)-1:0] car1_after_collision_v_sqrt_w;
    assign o_car1_v_m = car1_after_collision_v_sqrt_r;
    wire car1_after_collision_v_done;

    wire signed [((game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)<<1)-1:0] car1_after_collision_v_x_square, car1_after_collision_v_y_square;
    assign car1_after_collision_v_x_square = car1_after_collision_v_x * car1_after_collision_v_x;
    assign car1_after_collision_v_y_square = car1_after_collision_v_y * car1_after_collision_v_y;
    Sqrt #(
        .TOTAL_WIDTH       (((game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)<<1)),
        .FRACTION_WIDTH    ((game_pkg::VELOCITY_FRACTION_WIDTH<<1))
        // .FRACTION_WIDTH    (0)
    ) u_Sqrt_car1_v (
        .i_clk               (i_clk),
        .i_rst_n             (i_rst_n),
        .i_start             (1),
        .i_rad               (car1_after_collision_v_x_square + car1_after_collision_v_y_square),
        .o_root              (car1_after_collision_v_sqrt_w),
        .o_valid             (car1_after_collision_v_done)
    );
    
    reg signed [(game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)-1:0] car2_after_collision_v_sqrt_r;
    wire signed [((game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)<<1)-1:0] car2_after_collision_v_sqrt_w;
    assign o_car2_v_m = car2_after_collision_v_sqrt_r;
    wire car2_after_collision_v_done;

    wire signed [((game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)<<1)-1:0] car2_after_collision_v_x_square, car2_after_collision_v_y_square;
    assign car2_after_collision_v_x_square = car2_after_collision_v_x * car2_after_collision_v_x;
    assign car2_after_collision_v_y_square = car2_after_collision_v_y * car2_after_collision_v_y;
    Sqrt #(
        .TOTAL_WIDTH       (((game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH)<<1)),
        .FRACTION_WIDTH    ((game_pkg::VELOCITY_FRACTION_WIDTH<<1))
        // .FRACTION_WIDTH    (0)
    ) u_Sqrt_car2_v (
        .i_clk               (i_clk),
        .i_rst_n             (i_rst_n),
        .i_start             (1),
        .i_rad               (car2_after_collision_v_x_square + car2_after_collision_v_y_square),
        .o_root              (car2_after_collision_v_sqrt_w),
        .o_valid             (car2_after_collision_v_done)
    );
    
    reg signed [game_pkg::ANG_WIDTH-1:0] car1_after_collision_angle_r, car1_after_collision_angle_w;
    wire car1_after_collision_angle_done;
    AngleXYnonPipelined #(
        .VEC_WIDTH            (game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH),
        .ANG_WIDTH            (game_pkg::ANG_WIDTH)
    ) u_AngleXYnonPipelined_car1_v (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (1),
        .i_x                  (car1_after_collision_v_x),
        .i_y                  (car1_after_collision_v_y),
        .o_angle              (car1_after_collision_angle_w),
        .o_done               (car1_after_collision_angle_done)
    );
    assign o_car1_angle = (car1_after_collision_angle_r < 0) ? (car1_after_collision_angle_r + 360) : car1_after_collision_angle_r;

    reg signed [game_pkg::ANG_WIDTH-1:0] car2_after_collision_angle_r, car2_after_collision_angle_w;
    wire car2_after_collision_angle_done;
    AngleXYnonPipelined #(
        .VEC_WIDTH            (game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH),
        .ANG_WIDTH            (game_pkg::ANG_WIDTH)
    ) u_AngleXYnonPipelined_car2_v (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (1),
        .i_x                  (car2_after_collision_v_x),
        .i_y                  (car2_after_collision_v_y),
        .o_angle              (car2_after_collision_angle_w),
        .o_done               (car2_after_collision_angle_done)
    );
    assign o_car2_angle = (car2_after_collision_angle_r < 0) ? (car2_after_collision_angle_r + 360) : car2_after_collision_angle_r;

    always @(posedge car1_after_collision_v_done or negedge i_rst_n) begin
        if (!i_rst_n)   car1_after_collision_v_sqrt_r <= 0;
        else            car1_after_collision_v_sqrt_r <= (car1_after_collision_v_sqrt_w >>> game_pkg::VELOCITY_FRACTION_WIDTH);
    end

    always @(posedge car2_after_collision_v_done or negedge i_rst_n) begin
        if (!i_rst_n)   car2_after_collision_v_sqrt_r <= 0;
        else            car2_after_collision_v_sqrt_r <= (car2_after_collision_v_sqrt_w >>> game_pkg::VELOCITY_FRACTION_WIDTH);
    end

    always @(posedge car1_after_collision_angle_done or negedge i_rst_n) begin
        if (!i_rst_n)   car1_after_collision_angle_r <= 0;
        else            car1_after_collision_angle_r <= car1_after_collision_angle_w;
    end

    always @(posedge car2_after_collision_angle_done or negedge i_rst_n) begin
        if (!i_rst_n)   car2_after_collision_angle_r <= 0;
        else            car2_after_collision_angle_r <= car2_after_collision_angle_w;
    end

endmodule

module CarCollisionVelocityHandler (
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_y,

    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_v_x,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_v_y,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_v_x,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_v_y,

    input signed [sram_pkg::IMAGE_COOR_WIDTH-1:0] i_car1_radius,
    input signed [sram_pkg::IMAGE_COOR_WIDTH-1:0] i_car2_radius,

    input [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] i_car1_mass,
    input [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] i_car2_mass,

    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car1_v_x,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car1_v_y,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car2_v_x,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_car2_v_y,

    // output signed [31:0] o_radius_sum_square_with_scale, // for test
    // output signed [31:0] o_relaive_x_square, // for test
    // output signed [31:0] o_relaive_y_square, // for test

    output o_collision
);

    localparam PROCESS_WIDTH = game_pkg::VELOCITY_INTEGER_WIDTH
                                + game_pkg::VELOCITY_FRACTION_WIDTH 
                                + game_pkg::CAR_MASS_LEVEL_NUM_WIDTH + 1
                                + 2*sram_pkg::IMAGE_COOR_WIDTH;

    wire signed [PROCESS_WIDTH-1:0] radius_sum_with_scale;
    wire signed [2*PROCESS_WIDTH-1:0] radius_sum_square_with_scale;
    assign radius_sum_with_scale = (i_car1_radius + i_car2_radius) << game_pkg::VELOCITY_FRACTION_WIDTH;
    assign radius_sum_square_with_scale = radius_sum_with_scale * radius_sum_with_scale;
    // assign o_radius_sum_square_with_scale = radius_sum_square_with_scale; // for test

    wire signed [PROCESS_WIDTH-1:0] relative_v_x, relative_v_y;
    assign relative_v_x = i_car1_v_x - i_car2_v_x;
    assign relative_v_y = i_car1_v_y - i_car2_v_y;

    wire signed [PROCESS_WIDTH-1:0] relative_x, relative_y;
    wire signed [2*PROCESS_WIDTH-1:0] relative_x_square, relative_y_square;
    assign relative_x = i_car1_x - i_car2_x;
    assign relative_y = i_car1_y - i_car2_y;
    assign relative_x_square = relative_x * relative_x;
    assign relative_y_square = relative_y * relative_y;
    // assign o_relaive_x_square = relative_x_square; // for test
    // assign o_relaive_y_square = relative_y_square; // for test

    wire signed [2*PROCESS_WIDTH:0] scale_factor;
    assign scale_factor = ($signed({1'b0, i_car1_mass}) + $signed({1'b0, i_car2_mass})) * (relative_x_square + relative_y_square);

    wire signed [2*PROCESS_WIDTH-1:0] dot_product_result;
    assign dot_product_result = relative_v_x * relative_x + relative_v_y * relative_y;

    wire signed [3*PROCESS_WIDTH-1:0] car1_v_x_former_term, car1_v_y_former_term;
    wire signed [3*PROCESS_WIDTH-1:0] car2_v_x_former_term, car2_v_y_former_term;
    assign car1_v_x_former_term = scale_factor * i_car1_v_x;
    assign car1_v_y_former_term = scale_factor * i_car1_v_y;
    assign car2_v_x_former_term = scale_factor * i_car2_v_x;
    assign car2_v_y_former_term = scale_factor * i_car2_v_y;

    wire signed [3*PROCESS_WIDTH-1:0] car1_v_x_latter_term, car1_v_y_latter_term;
    wire signed [3*PROCESS_WIDTH-1:0] car2_v_x_latter_term, car2_v_y_latter_term;
    assign car1_v_x_latter_term = 2 * $signed({1'b0, i_car1_mass}) * dot_product_result * relative_x;
    assign car1_v_y_latter_term = 2 * $signed({1'b0, i_car1_mass}) * dot_product_result * relative_y;
    assign car2_v_x_latter_term = 2 * $signed({1'b0, i_car2_mass}) * dot_product_result * relative_x;
    assign car2_v_y_latter_term = 2 * $signed({1'b0, i_car2_mass}) * dot_product_result * relative_y;

    // divider only support 64-bit signed division
    wire signed [63:0] car1_after_collision_v_x_with_scale, car1_after_collision_v_y_with_scale;
    wire signed [63:0] car2_after_collision_v_x_with_scale, car2_after_collision_v_y_with_scale;
    assign car1_after_collision_v_x_with_scale = (car1_v_x_former_term - car1_v_x_latter_term) >>> (3*PROCESS_WIDTH - 64);
    assign car1_after_collision_v_y_with_scale = (car1_v_y_former_term - car1_v_y_latter_term) >>> (3*PROCESS_WIDTH - 64);
    assign car2_after_collision_v_x_with_scale = (car2_v_x_former_term + car2_v_x_latter_term) >>> (3*PROCESS_WIDTH - 64);
    assign car2_after_collision_v_y_with_scale = (car2_v_y_former_term + car2_v_y_latter_term) >>> (3*PROCESS_WIDTH - 64);

    wire signed [63:0] scale_factor_in_division;
    assign scale_factor_in_division = scale_factor >>> (3*PROCESS_WIDTH - 64);

    assign o_car1_v_x = car1_after_collision_v_x_with_scale / scale_factor_in_division;
    assign o_car1_v_y = car1_after_collision_v_y_with_scale / scale_factor_in_division;

    assign o_car2_v_x = car2_after_collision_v_x_with_scale / scale_factor_in_division;
    assign o_car2_v_y = car2_after_collision_v_y_with_scale / scale_factor_in_division;

    assign o_collision = ((relative_x_square + relative_y_square) <= radius_sum_square_with_scale) & (dot_product_result < 0);
endmodule