`define DEFAULT_IMAGE_SIZE 60
`define DEFAULT_IMAGE_COOR_BIT 6
`define DEFAULT_ANG_WIDTH 9
`define DEFAULT_VEC_PROCESS_WIDTH 20

module RotateImage #(
    parameter IMAGE_SIZE = `DEFAULT_IMAGE_SIZE,
    parameter IMAGE_COOR_BIT = `DEFAULT_IMAGE_COOR_BIT,
    parameter ANG_WIDTH = `DEFAULT_ANG_WIDTH,
    parameter VEC_PROCESS_WIDTH = `DEFAULT_VEC_PROCESS_WIDTH
)(
    input i_clk,
    input i_rst_n,
    input i_start,
    input [IMAGE_COOR_BIT-1:0] i_H,
    input [IMAGE_COOR_BIT-1:0] i_V,
    input signed [ANG_WIDTH-1:0] i_angle,
    output [IMAGE_COOR_BIT-1:0] o_H,
    output [IMAGE_COOR_BIT-1:0] o_V,
    output o_outOfRange,
    output o_done
);
    wire signed [IMAGE_COOR_BIT:0] x_original, x_new, y_original, y_new;
    assign x_original = ($signed({1'b0, i_H}) <<< 1) + 1 - IMAGE_SIZE;
    assign y_original = -($signed({1'b0, i_V}) <<< 1) - 1 + IMAGE_SIZE;

    assign o_H = (x_new + IMAGE_SIZE - 1) >>> 1;
    assign o_V = (-y_new + IMAGE_SIZE - 1) >>> 1;
    assign o_outOfRange = (x_new >= IMAGE_SIZE) || (y_new >= IMAGE_SIZE) || (x_new < -IMAGE_SIZE) || (y_new < -IMAGE_SIZE);

    RotateXY #(
        .VEC_WIDTH(IMAGE_COOR_BIT+1),
        .ANG_WIDTH(ANG_WIDTH),
        .VEC_PROCESS_WIDTH(VEC_PROCESS_WIDTH)
    ) u_RotateXY (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (i_start),
        // vector, Integer
        // note that the magnitude of the vector should also be able to be expressed in VEC_WIDTH bits 
        .i_x                  (x_original),
        .i_y                  (y_original),
        // angle, Integer, from -180 to 180 degrees
        .i_angle              (i_angle),
        .o_x                  (x_new),
        // Integer, no floating point
        .o_y                  (y_new),
        // Integer, no floating point
        .o_done               (o_done)
    );

endmodule