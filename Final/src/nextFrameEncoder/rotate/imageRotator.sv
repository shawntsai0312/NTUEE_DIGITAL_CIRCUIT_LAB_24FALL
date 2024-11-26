`define DEFAULT_IMAGE_SIZE 60 // H,V from 0 to 59
`define DEFAULT_IMAGE_COOR_BIT 6
`define DEFAULT_ANG_WIDTH 9

module ImageRotator #(
    parameter IMAGE_SIZE = `DEFAULT_IMAGE_SIZE,
    parameter IMAGE_COOR_BIT = `DEFAULT_IMAGE_COOR_BIT,
    parameter ANG_WIDTH = `DEFAULT_ANG_WIDTH
)(
    input i_clk,
    input i_rst_n,
    input i_start,
    input signed [ANG_WIDTH-1:0] i_angle,
    input [3:0] pixel_data [0:`IMAGE_SIZE-1][0:`IMAGE_SIZE-1],
    output reg [3:0] o_encoded_pixel,
    output [`IMAGE_COOR_BIT-1:0] o_H_transformed,
    output [`IMAGE_COOR_BIT-1:0] o_V_transformed,
    output o_valid
);

    reg [`IMAGE_COOR_BIT-1:0] H_r, H_w, V_r, V_w;
    reg start_r, start_w;

    wire [`IMAGE_COOR_BIT-1:0] H_transformed, V_transformed;
    wire outOfRange;
    assign o_H_transformed = H_transformed;
    assign o_V_transformed = V_transformed;

    RotateImageCoor #(
        .IMAGE_SIZE           (`IMAGE_SIZE),
        .IMAGE_COOR_BIT       (`IMAGE_COOR_BIT),
        .ANG_WIDTH            (ANG_WIDTH)
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

    always @(*) begin
        o_encoded_pixel = 4'b0000;
        if(o_valid) begin
            if(outOfRange) begin
                o_encoded_pixel = 4'b0000;
            end
            else begin
                o_encoded_pixel = pixel_data[V_transformed][H_transformed];
            end
        end
    end

    always @(*) begin
        start_w = i_start;
        if(H_r == `IMAGE_SIZE-1 && V_r == `IMAGE_SIZE-1) start_w = 0;
    end

    always @(*) begin
        H_w = H_r;
        V_w = V_r;
        if(start_r) begin
            if(H_r == `IMAGE_SIZE-1) begin
                if(V_r == `IMAGE_SIZE-1) begin
                    H_w = 0;
                    V_w = 0;
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