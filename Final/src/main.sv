import object_pkg::*;
import sram_pkg::*;

module Main (
    input i_clk,
    input i_rst_n,

    output [sram_pkg::SRAM_ADDR_COUNT-1:0] o_SRAM_ADDR,
	inout  [sram_pkg::SRAM_DATA_WIDTH-1:0] io_SRAM_DQ,
	output o_SRAM_WE_N,

    output o_H_sync,
    output o_V_sync,
    output [23:0] o_RGB,
    output o_RGB_valid,
    output [31:0] o_frame_counter,
    output o_render_clk,

    output o_car1_opacity_map [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1],
    output o_car2_opacity_map [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1]
);

    wire render_clk;
    assign o_render_clk = render_clk;

    wire sram_writing;
    wire [23:0] decoded_color;

    reg [sram_pkg::SRAM_ADDR_COUNT-1:0] addr_encode, addr_decode;
    reg [sram_pkg::SRAM_DATA_WIDTH-1:0] data_encode, data_decode;

    assign o_SRAM_WE_N = !sram_writing;
    assign o_SRAM_ADDR = sram_writing ? addr_encode : addr_decode;
    assign io_SRAM_DQ  = sram_writing ? data_encode : 16'dz;
    assign data_decode = sram_writing ? 16'd0 : io_SRAM_DQ;
    

    wire signed [sram_pkg::ANG_WIDTH-1:0] car1_angle_gameControl_output, car2_angle_gameControl_output;

    wire signed [sram_pkg::MAP_H_WIDTH-1:0] car1_x_gameControl_output, car2_x_gameControl_output;
    wire signed [sram_pkg::MAP_V_WIDTH-1:0] car1_y_gameControl_output, car2_y_gameControl_output;

    reg signed [sram_pkg::MAP_H_WIDTH-1:0] car1_x_frameDecoder_input, car2_x_frameDecoder_input;
    reg signed [sram_pkg::MAP_V_WIDTH-1:0] car1_y_frameDecoder_input, car2_y_frameDecoder_input;

    wire [sram_pkg::MAP_H_WIDTH-1:0] H_to_be_rendered;
    wire [sram_pkg::MAP_V_WIDTH-1:0] V_to_be_rendered;

    object_pkg::ObjectID pixel_object_id;

    wire [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] pixel_counter;
    wire [sram_pkg::IMAGE_COOR_WIDTH-1:0] H_frameEncoder_output, V_frameEncoder_output;
    assign H_frameEncoder_output = pixel_counter % sram_pkg::IMAGE_SIZE;
    assign V_frameEncoder_output = pixel_counter / sram_pkg::IMAGE_SIZE;

    wire pixel_opacity, pixel_opacity_valid, frameEncode_done;

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
        .o_car2_y        (car2_y_gameControl_output)
    );

    FrameEncoder u_FrameEncoder (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_start            (!render_clk),
        .i_car1_angle       (car1_angle_gameControl_output),
        .i_car2_angle       (car2_angle_gameControl_output),
        .o_sram_addr        (addr_encode),
        .o_sram_data        (data_encode),
        .o_sram_writing     (sram_writing),
        .o_object_id        (pixel_object_id), 
        .o_pixel_counter    (pixel_counter),
        .o_opacity          (pixel_opacity),
        .o_opacity_valid    (pixel_opacity_valid),
        .o_done             (frameEncode_done)
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
    genvar i, j;
    generate
        for (i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin: opacity_map_generate_i
            for (j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin: opacity_map_generate_j
                assign car1_opacity_map_w[i][j] = ( H_frameEncoder_output == i &&
                                                    V_frameEncoder_output == j &&
                                                    pixel_object_id == object_pkg::OBJECT_CAR1 &&
                                                    pixel_opacity_valid ) ? 
                                                    pixel_opacity : car1_opacity_map_r[i][j];
                assign car2_opacity_map_w[i][j] = ( H_frameEncoder_output == i &&
                                                    V_frameEncoder_output == j &&
                                                    pixel_object_id == object_pkg::OBJECT_CAR2 &&
                                                    pixel_opacity_valid ) ? 
                                                    pixel_opacity : car2_opacity_map_r[i][j];
            end
        end
    endgenerate

    // opacity map output assignment
    assign o_car1_opacity_map = car1_opacity_map_r;
    assign o_car2_opacity_map = car2_opacity_map_r;

    // opacity map sequential logic
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            for (integer i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin
                        car1_opacity_map_r[i][j] <= 0;
                        car2_opacity_map_r[i][j] <= 0;
                end
            end
        end
        else begin
            for (integer i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin
                    car1_opacity_map_r[i][j] <= car1_opacity_map_w[i][j];
                    car2_opacity_map_r[i][j] <= car2_opacity_map_w[i][j];
                end
            end
        end
    end

    // position sequential logic
    always @(negedge render_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            // inittial position, debug only, change back to 0 while implementing
            car1_x_frameDecoder_input <= -750;
            car1_y_frameDecoder_input <= 350;
            car2_x_frameDecoder_input <= 650;
            car2_y_frameDecoder_input <= -250;
        end
        else begin
            car1_x_frameDecoder_input <= car1_x_gameControl_output;
            car1_y_frameDecoder_input <= car1_y_gameControl_output;
            car2_x_frameDecoder_input <= car2_x_gameControl_output;
            car2_y_frameDecoder_input <= car2_y_gameControl_output;
        end
    end

endmodule