module PeddleHandler (
    input i_clk,
    input i_rst_n,
    output o_CS,
    output o_SPC,
    output o_SDI,
    input i_SDO,

    input [15:0] i_level0_lower_bound,
    input [15:0] i_level1_lower_bound,
    input [15:0] i_level2_lower_bound,
    input [15:0] i_level3_lower_bound,
    input [15:0] i_level4_lower_bound,
    input [15:0] i_level5_lower_bound,
    input [15:0] i_level6_lower_bound,
    output [15:0] o_acc_value,
    output reg [2:0] o_level
);
    wire signed [15:0] acc;
    assign o_acc_value = acc;

    ADXL345_ONE_DIR u_ADXL345 (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .i_dir      (1),    // y direction
        .o_CS       (o_CS),
        .o_SPC      (o_SPC),
        .o_SDI      (o_SDI),
        .i_SDO      (i_SDO),
        .o_av       (acc)
    );

    always @(*) begin
        o_level = 0;

        if (acc > i_level0_lower_bound) begin
            o_level = 0;
        end else if (acc > i_level1_lower_bound) begin
            o_level = 1;
        end else if (acc > i_level2_lower_bound) begin
            o_level = 2;
        end else if (acc > i_level3_lower_bound) begin
            o_level = 3;
        end else if (acc > i_level4_lower_bound) begin
            o_level = 4;
        end else if (acc > i_level5_lower_bound) begin
            o_level = 5;
        end else if (acc > i_level6_lower_bound) begin
            o_level = 6;
        end else begin
            o_level = 7;
        end
    end

endmodule

module WheelHandler (
    input i_clk,
    input i_rst_n,
    output o_CS,
    output o_SPC,
    output o_SDI,
    input i_SDO,

    input signed [15:0] i_level0_x_bound,
    input signed [15:0] i_level1_x_bound,
    input signed [15:0] i_level2_x_bound,
    input signed [15:0] i_level3_x_bound,
    input signed [15:0] i_level4_x_bound,

    output reg signed [3:0] o_level
);
    wire signed [15:0] acc_x, acc_y;
    ADXL345_TWO_DIR u_ADXL345 (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .o_CS       (o_CS),
        .o_SPC      (o_SPC),
        .o_SDI      (o_SDI),
        .i_SDO      (i_SDO),
        .o_av_x     (acc_x),
        .o_av_y     (acc_y)
    );

    always @(*) begin
        o_level = 0;
        if (acc_x >= -i_level0_x_bound && acc_x <= i_level0_x_bound && acc_y <= 0) begin
            o_level = 0;
        end
        else if (acc_x < -i_level0_x_bound && acc_y <= 0) begin
            o_level = -1;
        end
        else if (acc_x < -i_level1_x_bound && acc_y <= 0) begin
            o_level = -2;
        end
        else if (acc_x < -i_level2_x_bound && acc_y <= 0) begin
            o_level = -3;
        end
        else if (acc_x < -i_level3_x_bound && acc_y <= 0) begin
            o_level = -4;
        end
        else if (acc_x < -i_level4_x_bound && acc_y <= 0) begin
            o_level = -5;
        end
        else if (acc_x < -i_level0_x_bound && acc_y > 0) begin
            o_level = -7;
        end
        else if (acc_x > i_level0_x_bound && acc_y <= 0) begin
            o_level = 1;
        end
        else if (acc_x > i_level1_x_bound && acc_y <= 0) begin
            o_level = 2;
        end
        else if (acc_x > i_level2_x_bound && acc_y <= 0) begin
            o_level = 3;
        end
        else if (acc_x > i_level3_x_bound && acc_y <= 0) begin
            o_level = 4;
        end
        else if (acc_x > i_level4_x_bound && acc_y <= 0) begin
            o_level = 5;
        end
        else if (acc_x > i_level0_x_bound && acc_y > 0) begin
            o_level = 7;
        end
        else begin
            o_level = 0;
        end
    end

endmodule