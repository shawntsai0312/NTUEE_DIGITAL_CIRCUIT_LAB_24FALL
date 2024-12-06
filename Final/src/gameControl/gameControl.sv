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

    parameter DECIMAL_WIDTH = 6;

    parameter car1_init_x = -750;
    parameter car1_init_y = 200;
    parameter car2_init_x = 750;
    parameter car2_init_y = -200;

    parameter x_max = 750;
    parameter x_min = -750;
    parameter y_max = 350;
    parameter y_min = -350;

    reg signed [sram_pkg::ANG_WIDTH:0] car1_angle_r, car1_angle_w; // 0 to 360
    reg signed [sram_pkg::ANG_WIDTH:0] car2_angle_r, car2_angle_w; // 0 to 360
    reg signed [sram_pkg::MAP_H_WIDTH+DECIMAL_WIDTH-1:0] car1_x_r, car1_x_w; // -750 to 750, with decimal
    reg signed [sram_pkg::MAP_V_WIDTH+DECIMAL_WIDTH-1:0] car1_y_r, car1_y_w; // -350 to 350, with decimal
    reg signed [sram_pkg::MAP_H_WIDTH+DECIMAL_WIDTH-1:0] car2_x_r, car2_x_w; // -750 to 750, with decimal
    reg signed [sram_pkg::MAP_V_WIDTH+DECIMAL_WIDTH-1:0] car2_y_r, car2_y_w; // -350 to 350, with decimal

    assign o_car1_angle = car1_angle_r - 180;
    assign o_car2_angle = car2_angle_r - 180;
    assign o_car1_x = (car1_x_r >>> DECIMAL_WIDTH) + car1_x_r[DECIMAL_WIDTH-1]; // round to nearest
    assign o_car1_y = (car1_y_r >>> DECIMAL_WIDTH) + car1_y_r[DECIMAL_WIDTH-1]; // round to nearest
    assign o_car2_x = (car2_x_r >>> DECIMAL_WIDTH) + car2_x_r[DECIMAL_WIDTH-1]; // round to nearest
    assign o_car2_y = (car2_y_r >>> DECIMAL_WIDTH) + car2_y_r[DECIMAL_WIDTH-1]; // round to nearest

    wire [2+DECIMAL_WIDTH:0] car1_v_x, car1_v_y, car2_v_x, car2_v_y; // 2 bits for integer part, 6 bits for decimal part
    assign car1_v_x = 8'b00100000; // 0.5
    assign car1_v_y = 8'b00000000; // 0
    assign car2_v_x = 8'b01000000; // 1
    assign car2_v_y = 8'b00000000; // 0

    // position update
    always @(*) begin
        car1_x_w = car1_x_r + car1_v_x;
        car1_y_w = car1_y_r + car1_v_y;
        car2_x_w = car2_x_r + car2_v_x;
        car2_y_w = car2_y_r + car2_v_y;

        // fix position, the rangen of x can only be [-750, 750], the range of y can only be [-350, 350]
        if (car1_x_w <= (x_min << DECIMAL_WIDTH)) car1_x_w = car1_x_w + ((x_max - x_min) << DECIMAL_WIDTH);
        if (car2_x_w <= (x_min << DECIMAL_WIDTH)) car2_x_w = car2_x_w + ((x_max - x_min) << DECIMAL_WIDTH);
        if (car1_x_w >= (x_max << DECIMAL_WIDTH)) car1_x_w = car1_x_w - ((x_max - x_min) << DECIMAL_WIDTH);
        if (car2_x_w >= (x_max << DECIMAL_WIDTH)) car2_x_w = car2_x_w - ((x_max - x_min) << DECIMAL_WIDTH);
        if (car1_y_w <= (y_min << DECIMAL_WIDTH)) car1_y_w = car1_y_w + ((y_max - y_min) << DECIMAL_WIDTH);
        if (car2_y_w <= (y_min << DECIMAL_WIDTH)) car2_y_w = car2_y_w + ((y_max - y_min) << DECIMAL_WIDTH);
        if (car1_y_w >= (y_max << DECIMAL_WIDTH)) car1_y_w = car1_y_w - ((y_max - y_min) << DECIMAL_WIDTH);
        if (car2_y_w >= (y_max << DECIMAL_WIDTH)) car2_y_w = car2_y_w - ((y_max - y_min) << DECIMAL_WIDTH);
    end

    // angle update
    always @(*) begin
        car1_angle_w = car1_angle_r;
        car2_angle_w = car2_angle_r;

        // fix angle, the range can only be [-180, 180]
        if (car1_angle_w <= 0) car1_angle_w = car1_angle_w + 360;
        if (car2_angle_w <= 0) car2_angle_w = car2_angle_w + 360;
        if (car1_angle_w >= 360) car1_angle_w = car1_angle_w - 360;
        if (car2_angle_w >= 360) car2_angle_w = car2_angle_w - 360;
    end

    always @(posedge i_render_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            car1_angle_r <= 0;
            car1_x_r <= (car1_init_x << DECIMAL_WIDTH);
            car1_y_r <= (car1_init_y << DECIMAL_WIDTH);
            car2_angle_r <= 0;
            car2_x_r <= (car2_init_x << DECIMAL_WIDTH);
            car2_y_r <= (car2_init_y << DECIMAL_WIDTH);
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