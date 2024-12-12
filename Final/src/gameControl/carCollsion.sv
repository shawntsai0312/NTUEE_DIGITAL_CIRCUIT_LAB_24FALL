module CarCollision (
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

    output o_collision
);

    localparam PROCESS_WIDTH = game_pkg::VELOCITY_INTEGER_WIDTH
                                + game_pkg::VELOCITY_FRACTION_WIDTH 
                                + game_pkg::CAR_MASS_LEVEL_NUM_WIDTH + 1
                                + 2*sram_pkg::IMAGE_COOR_WIDTH;

    wire signed [PROCESS_WIDTH-1:0] radius_sum;
    assign radius_sum = i_car1_radius + i_car2_radius;

    wire signed [PROCESS_WIDTH-1:0] scale_factor;
    assign scale_factor = (i_car1_mass + i_car2_mass) * radius_sum * radius_sum;

    wire signed [PROCESS_WIDTH-1:0] relative_v_x, relative_v_y;
    assign relative_v_x = i_car1_v_x - i_car2_v_x;
    assign relative_v_y = i_car1_v_y - i_car2_v_y;

    wire signed [PROCESS_WIDTH-1:0] relative_x, relative_y;
    assign relative_x = i_car1_x - i_car2_x;
    assign relative_y = i_car1_y - i_car2_y;

    wire signed [PROCESS_WIDTH-1:0] dot_product_result;
    assign dot_product_result = relative_v_x * relative_x + relative_v_y * relative_y;

    wire signed [PROCESS_WIDTH-1:0] car1_after_collision_v_x_with_scale, car1_after_collision_v_y_with_scale;
    wire signed [PROCESS_WIDTH-1:0] car2_after_collision_v_x_with_scale, car2_after_collision_v_y_with_scale;
    assign car1_after_collision_v_x_with_scale = scale_factor * i_car1_v_x - 2 * i_car2_mass * dot_product_result * relative_x;
    assign car1_after_collision_v_y_with_scale = scale_factor * i_car1_v_y - 2 * i_car2_mass * dot_product_result * relative_y;
    assign car2_after_collision_v_x_with_scale = scale_factor * i_car2_v_x + 2 * i_car1_mass * dot_product_result * relative_x;
    assign car2_after_collision_v_y_with_scale = scale_factor * i_car2_v_y + 2 * i_car1_mass * dot_product_result * relative_y;

    assign o_car1_v_x = car1_after_collision_v_x_with_scale / scale_factor;
    assign o_car1_v_y = car1_after_collision_v_y_with_scale / scale_factor;

    assign o_collision = relative_x * relative_x + relative_y * relative_y <= radius_sum * radius_sum;
endmodule