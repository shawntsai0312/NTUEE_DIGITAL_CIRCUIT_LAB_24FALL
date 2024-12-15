module QBlockHandler (
    input i_render_clk,
    input i_rst_n,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_y,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_car1_radius,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_car2_radius,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_qblock_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_qblock_y,
    input signed [sram_pkg::QBLOCK_COOR_WIDTH-1:0] i_qblock_radius,
    output o_car1_collision,
    output o_car2_collision,
    output o_display
);

    QBlockCollision qblock_collision(
        .i_render_clk       (i_render_clk),
        .i_rst_n            (i_rst_n),
        .i_display          (o_display),
        .i_car1_x           (i_car1_x),
        .i_car1_y           (i_car1_y),
        .i_car2_x           (i_car2_x),
        .i_car2_y           (i_car2_y),
        .i_car1_radius      (i_car1_radius),
        .i_car2_radius      (i_car2_radius),
        .i_qblock_x         (i_qblock_x),
        .i_qblock_y         (i_qblock_y),
        .i_qblock_radius    (i_qblock_radius),
        .o_car1_collision   (o_car1_collision),
        .o_car2_collision   (o_car2_collision)
    );

    QBlockGeneration qblock_generation(
        .i_render_clk   (i_render_clk),
        .i_rst_n        (i_rst_n),
        .i_hide         (o_car1_collision || o_car2_collision),
        .o_display      (o_display)
    );

endmodule

module QBlockCollision (
    input i_render_clk,
    input i_rst_n,
    input i_display,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_y,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car2_y,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_car1_radius,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_car2_radius,
    input signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_qblock_x,
    input signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_qblock_y,
    input signed [sram_pkg::QBLOCK_COOR_WIDTH-1:0] i_qblock_radius,
    output o_car1_collision,
    output o_car2_collision
);
    wire signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_x_diff;
    wire signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_y_diff;
    wire signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car1_qblock_radius_sum;
    assign car1_x_diff = i_car1_x - i_qblock_x;
    assign car1_y_diff = i_car1_y - i_qblock_y;
    assign car1_qblock_radius_sum = (i_car1_radius + i_qblock_radius) << game_pkg::VELOCITY_FRACTION_WIDTH;

    wire signed [39:0] car1_x_diff_square;
    wire signed [39:0] car1_y_diff_square;
    wire signed [39:0] car1_qblock_radius_sum_square;
    reg car1_collision_r, car1_collision_w;
    assign car1_x_diff_square = car1_x_diff * car1_x_diff;
    assign car1_y_diff_square = car1_y_diff * car1_y_diff;
    assign car1_qblock_radius_sum_square = car1_qblock_radius_sum * car1_qblock_radius_sum;
    assign car1_collision_w = ((car1_x_diff_square + car1_y_diff_square) <= car1_qblock_radius_sum_square) & i_display;
    assign o_car1_collision = car1_collision_r;

    wire signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_x_diff;
    wire signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_y_diff;
    wire signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] car2_qblock_radius_sum;
    assign car2_x_diff = i_car2_x - i_qblock_x;
    assign car2_y_diff = i_car2_y - i_qblock_y;
    assign car2_qblock_radius_sum = (i_car2_radius + i_qblock_radius) << game_pkg::VELOCITY_FRACTION_WIDTH;

    wire signed [39:0] car2_x_diff_square;
    wire signed [39:0] car2_y_diff_square;
    wire signed [39:0] car2_qblock_radius_sum_square;
    reg car2_collision_r, car2_collision_w;
    assign car2_x_diff_square = car2_x_diff * car2_x_diff;
    assign car2_y_diff_square = car2_y_diff * car2_y_diff;
    assign car2_qblock_radius_sum_square = car2_qblock_radius_sum * car2_qblock_radius_sum;
    assign car2_collision_w = ((car2_x_diff_square + car2_y_diff_square) <= car2_qblock_radius_sum_square) & i_display;
    assign o_car2_collision = car2_collision_r;

    always @(posedge i_render_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            car1_collision_r <= 0;
            car2_collision_r <= 0;
        end
        else begin
            car1_collision_r <= car1_collision_w;
            car2_collision_r <= car2_collision_w;
        end
    end
endmodule

module QBlockGeneration (
    input i_render_clk,
    input i_rst_n,
    input i_hide,
    output o_display
);
    localparam S_DISPLAY = 0;
    localparam S_HIDE = 1;

    reg [1:0] state_r, state_w;
    assign o_display = (state_r == S_DISPLAY);

    reg [5:0] frame_counter_r, frame_counter_w;
    reg [game_pkg::QBLOCK_REGENERATE_INTERVAL_WIDTH-1:0] timer_r, timer_w;

    always @(*) begin
        state_w = state_r;
        case (state_r)
            S_DISPLAY: if(i_hide) state_w = S_HIDE;
            S_HIDE: if(timer_r == game_pkg::QBLOCK_REGENERATE_INTERVAL) state_w = S_DISPLAY;
        endcase
    end

    always @(*) begin
        timer_w = timer_r;
        case (state_r)
            S_DISPLAY: timer_w = 0;
            S_HIDE: if(frame_counter_r == sram_pkg::VGA_FRAME_RATE - 1) timer_w = timer_r + 1;
        endcase
    end

    always @(*) begin
        frame_counter_w = frame_counter_r;
        case (state_r)
            S_DISPLAY: frame_counter_w = 0;
            S_HIDE: begin
                if (frame_counter_r == sram_pkg::VGA_FRAME_RATE - 1) frame_counter_w = 0;
                else frame_counter_w = frame_counter_r + 1;
            end
        endcase
    end

    always @(posedge i_render_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_DISPLAY;
            timer_r <= 0;
            frame_counter_r <= 0;
        end
        else begin
            state_r <= state_w;
            timer_r <= timer_w;
            frame_counter_r <= frame_counter_w;
        end
    end
endmodule