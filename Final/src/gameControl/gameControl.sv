import object_pkg::*;
import sram_pkg::*;

module GameControl (
    input i_render_clk,
    input i_rst_n,
    output signed [sram_pkg::ANG_WIDTH-1:0] o_car1_angle,
    output signed [sram_pkg::ANG_WIDTH-1:0] o_car2_angle,
    output signed [sram_pkg::MAP_H_WIDTH-1:0] o_car1_x,
    output signed [sram_pkg::MAP_V_WIDTH-1:0] o_car1_y,
    output signed [sram_pkg::MAP_H_WIDTH-1:0] o_car2_x,
    output signed [sram_pkg::MAP_V_WIDTH-1:0] o_car2_y
);

    // test only
    // assign o_car1_angle = 0;
    // assign o_car1_x = -750;
    // assign o_car1_y = 350;

    // assign o_car2_angle = 90;
    // assign o_car2_x = 650;
    // assign o_car2_y = -250;

    reg signed [sram_pkg::ANG_WIDTH-1:0] car1_angle_r, car1_angle_w;
    reg signed [sram_pkg::ANG_WIDTH-1:0] car2_angle_r, car2_angle_w;
    reg signed [sram_pkg::MAP_H_WIDTH-1:0] car1_x_r, car1_x_w;
    reg signed [sram_pkg::MAP_V_WIDTH-1:0] car1_y_r, car1_y_w;
    reg signed [sram_pkg::MAP_H_WIDTH-1:0] car2_x_r, car2_x_w;
    reg signed [sram_pkg::MAP_V_WIDTH-1:0] car2_y_r, car2_y_w;

    // assign o_car1_angle = car1_angle_r;
    // assign o_car2_angle = car2_angle_r;
    // assign o_car1_x = car1_x_r;
    // assign o_car1_y = car1_y_r;
    // assign o_car2_x = car2_x_r;
    // assign o_car2_y = car2_y_r;

    // test only
    assign o_car1_angle = 90;
    assign o_car2_angle = 0;
    assign o_car1_x = -200;
    assign o_car1_y = 0;
    assign o_car2_x = 200;
    assign o_car2_y = 0;

    // position update
    always @(*) begin
        car1_x_w = car1_x_r + 1;
        car1_y_w = car1_y_r;
        car2_x_w = car2_x_r - 1;
        car2_y_w = car2_y_r;

        // fix position, the rangen of x can only be [-750, 750], the range of y can only be [-350, 350]
        if (car1_x_w <= -750) car1_x_w = car1_x_w + 1500;
        if (car2_x_w <= -750) car2_x_w = car2_x_w + 1500;
        if (car1_x_w >= 750) car1_x_w = car1_x_w - 1500;
        if (car2_x_w >= 750) car2_x_w = car2_x_w - 1500;
        if (car1_y_w <= -350) car1_y_w = car1_y_w + 700;
        if (car2_y_w <= -350) car2_y_w = car2_y_w + 700;
        if (car1_y_w >= 350) car1_y_w = car1_y_w - 700;
        if (car2_y_w >= 350) car2_y_w = car2_y_w - 700;
    end

    // angle update
    always @(*) begin
        car1_angle_w = car1_angle_r + 1;
        car2_angle_w = car2_angle_r - 1;

        // fix angle, the range can only be [-180, 180]
        if (car1_angle_w <= -180) car1_angle_w = car1_angle_w + 360;
        if (car2_angle_w <= -180) car2_angle_w = car2_angle_w + 360;
        if (car1_angle_w >= 180) car1_angle_w = car1_angle_w - 360;
        if (car2_angle_w >= 180) car2_angle_w = car1_angle_w - 360;
    end

    always @(posedge i_render_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            car1_angle_r <= 90;
            car1_x_r <= -750;
            car1_y_r <= 350;
            car2_angle_r <= 0;
            car2_x_r <= 650;
            car2_y_r <= -250;
        end
        else begin
            car1_angle_r <= car1_angle_w;
            car1_x_r <= car1_x_w;
            car1_y_r <= car1_y_w;
            car2_angle_r <= car2_angle_w;
            car2_x_r <= car2_x_w;
            car2_y_r <= car2_y_w;
        end
    end

endmodule