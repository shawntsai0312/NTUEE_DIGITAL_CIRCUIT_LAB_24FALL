`define DEFAULT_ANG_WIDTH 9

import game_pkg::*;
import sram_pkg::*;

module ImageRotator #(
    parameter ANG_WIDTH = `DEFAULT_ANG_WIDTH
)(
    input i_clk,
    input i_rst_n,
    input i_start, // hold high for each image
    input signed [ANG_WIDTH-1:0] i_angle,
    input [sram_pkg::COLOR_WIDTH-1:0] i_lut_data [0:sram_pkg::CAR_SIZE-1][0:sram_pkg::CAR_SIZE-1],
    output [sram_pkg::COLOR_WIDTH-1:0] o_encoded_pixel,
    output o_opacity,
    output [sram_pkg::CAR_COOR_WIDTH-1:0] o_H_to_be_processed,
    output [sram_pkg::CAR_COOR_WIDTH-1:0] o_V_to_be_processed,
    output o_valid
);

    reg [sram_pkg::CAR_COOR_WIDTH-1:0] H_r, H_w, V_r, V_w;
    assign o_H_to_be_processed = H_r;
    assign o_V_to_be_processed = V_r;

    reg start_r, start_w;

    wire [sram_pkg::CAR_COOR_WIDTH-1:0] H_transformed, V_transformed;
    wire outOfRange;

    RotateImageCoor #(
        .ANG_WIDTH            (game_pkg::ANG_WIDTH)
    ) u_RotateImageCoor (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (start_r),
        .i_H                  (H_r),
        .i_V                  (V_r),
        .i_angle              (-i_angle),
        .o_H                  (H_transformed),
        .o_V                  (V_transformed),
        .o_outOfRange         (outOfRange),
        .o_valid              (o_valid)
    );

    reg [sram_pkg::COLOR_WIDTH-1:0] encoded_pixel;
    reg opacity;
    assign o_encoded_pixel = encoded_pixel;
    assign o_opacity = opacity;

    always @(*) begin
        encoded_pixel = 0;
        opacity = 0;
        if(o_valid) begin
            if(outOfRange) begin
                encoded_pixel = 0;
                opacity = 0;
            end
            else begin
                encoded_pixel = i_lut_data[V_transformed][H_transformed];
                opacity = (encoded_pixel != 0); 
            end
        end
    end

    always @(*) begin
        start_w = i_start;
        if(H_r == sram_pkg::CAR_SIZE-1 && V_r == sram_pkg::CAR_SIZE-1) start_w = 0;
    end

    always @(*) begin
        H_w = H_r;
        V_w = V_r;
        if(start_r) begin
            if(H_r == sram_pkg::CAR_SIZE-1) begin
                if(V_r == sram_pkg::CAR_SIZE-1) begin
                    H_w = H_r;
                    V_w = H_w;
                end
                else begin
                    H_w = 0;
                    V_w = V_r + 1;
                end
            end
            else begin
                H_w = H_r + 1;
                V_w = V_r;
            end
        end
        else begin
            H_w = 0;
            V_w = 0;
        end
    end


    always_ff @(posedge i_clk or negedge i_rst_n) begin 
        if (!i_rst_n) begin
            H_r <= 0;
            V_r <= 0;
            start_r <= 0;
        end
        else begin
            H_r <= H_w;
            V_r <= V_w;
            start_r <= start_w;
        end
    end

endmodule