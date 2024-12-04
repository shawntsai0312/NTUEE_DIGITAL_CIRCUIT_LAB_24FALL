import object_pkg::*;
import sram_pkg::*;

module Main(
    input i_clk,
    input i_rst_n,

    output [sram_pkg::SRAM_ADDR_COUNT-1:0] o_SRAM_ADDR,
	inout  [sram_pkg::SRAM_DATA_WIDTH-1:0] io_SRAM_DQ,
	output o_SRAM_WE_N,

    output o_H_sync,
    output o_V_sync,
    output [23:0] o_RGB,
    output o_RGB_valid,
    output [31:0] o_frame_counter
);

    wire render_clk;
    wire [23:0] decoded_color;

    reg [sram_pkg::SRAM_ADDR_COUNT-1:0] addr_encode, addr_decode;
    reg [sram_pkg::SRAM_DATA_WIDTH-1:0] data_encode, data_decode;

    assign o_SRAM_ADDR = render_clk ? addr_decode : addr_encode;
    assign io_SRAM_DQ  = render_clk ? data_decode : 16'dz;
    assign data_encode = render_clk ? 16'd0 : io_SRAM_DQ;
    assign o_SRAM_WE_N = !render_clk;

    wire signed [sram_pkg::ANG_WIDTH-1:0] car1_angle_gameControl_output, car2_angle_gameControl_output;

    wire signed [sram_pkg::MAP_H_WIDTH-1:0] car1_x_gameControl_output, car2_x_gameControl_output;
    wire signed [sram_pkg::MAP_V_WIDTH-1:0] car1_y_gameControl_output, car2_y_gameControl_output;

    reg signed [sram_pkg::MAP_H_WIDTH-1:0] car1_x_frameDecoder_input, car2_x_frameDecoder_input;
    reg signed [sram_pkg::MAP_V_WIDTH-1:0] car1_y_frameDecoder_input, car2_y_frameDecoder_input;

    wire [sram_pkg::MAP_H_WIDTH-1:0] H_to_be_rendered;
    wire [sram_pkg::MAP_V_WIDTH-1:0] V_to_be_rendered;

    reg car1_opacity_map_r [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    reg car1_opacity_map_w [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];

    reg car2_opacity_map_r [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    reg car2_opacity_map_w [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    

    GameControl u_GameControl (
        .i_render_clk    (render_clk),
        .i_rst_n         (i_rst_n),
        .o_car1_angle    (car1_angle_gameControl_output),
        .o_car2_angle    (car2_angle_gameControl_output),
        .o_car1_x        (car1_x_gameControl_output),
        .o_car1_y        (car1_y_gameControl_output),
        .o_car2_x        (car2_x_gameControl_output),
        .o_car2_y        (car2_y_gameControl_output),
    );

    FrameEncoder u_FrameEncoder (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_start            (!render_clk),
        .i_car1_angle       (car1_angle_gameControl_output),
        .i_car2_angle       (car2_angle_gameControl_output),
        .o_sram_addr        (addr_encode),
        .o_sram_data        (data_encode),
        .o_proc_counter     (),
        .o_pixel_counter    (),
        .o_opacity          (),
        .o_opacity_valid    (),
        .o_done             ()
    );

    FrameDecoder u_FrameDecoder (
        .i_clk                  (i_clk),
        .i_rst_n                (i_rst_n),
        .i_car1_x               (car1_x_frameDecoder_input),
        .i_car1_y               (car1_y_frameDecoder_input),
        .i_car2_x               (car2_x_frameDecoder_input),
        .i_car2_y               (car2_y_frameDecoder_input),
        .i_car1_opacity_map     (car1_opacity_map_r),
        .i_car2_opacity_map     (car2_opacity_map_r),
        .i_VGA_H                (H_to_be_rendered),
        .i_VGA_V                (V_to_be_rendered),
        .o_sram_addr            (addr_decode),
        .i_sram_data            (data_decode),
        .o_decoded_color        (decoded_color)
    );

    VGA u_VGA (
        .i_clk                     (i_clk),
        .i_rst_n                   (i_rst_n),
        .i_color                   (decoded_color),
        .o_H_sync                  (o_H_sync),
        .o_V_sync                  (o_V_sync),
        .o_RGB                     (o_RGB),
        .o_RGB_valid               (o_RGB_valid),
        .o_frame_counter           (o_frame_counter),
        .o_H_to_be_rendered        (H_to_be_rendered),
        .o_V_to_be_rendered        (V_to_be_rendered),
        .o_render_clk              (render_clk)
    );

    // opacity map combinatorial logic
    always @(*) begin

    end

    // opacity map sequential logic
    always @(posedge render_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            for (integer i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin
                        car1_pacity_map_r[i][j] <= 0;
                        car2_pacity_map_r[i][j] <= 0;
                end
            end
        end
        else begin
            for (integer i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin
                    car1_pacity_map_r[i][j] <= car1_pacity_map_w[i][j];
                    car2_pacity_map_r[i][j] <= car2_pacity_map_w[i][j];
                end
            end
        end
    end

    // position sequential logic
    always @(negedge render_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            car1_x_frameDecoder_input <= 0;
            car1_y_frameDecoder_input <= 0;
            car2_x_frameDecoder_input <= 0;
            car2_y_frameDecoder_input <= 0;
        end
        else begin
            car1_x_frameDecoder_input <= car1_x_gameControl_output;
            car1_y_frameDecoder_input <= car1_y_gameControl_output;
            car2_x_frameDecoder_input <= car2_x_gameControl_output;
            car2_y_frameDecoder_input <= car2_y_gameControl_output;
        end
    end

endmodule