`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0
`define DATA_WIDTH 7
`define PROCESS_WIDTH 16
`define ITERATIONS 16

module tb;
    reg i_clk, i_rst_n, i_start;
    reg [`DATA_WIDTH-1:0] i_x, i_y;
    reg [21:0] i_angle;
    wire [`DATA_WIDTH-1:0] o_x, o_y;
    wire o_done;

    Rotate #(
        .DATA_WIDTH    (`DATA_WIDTH),
        .PROCESS_WIDTH (`PROCESS_WIDTH),
        .ITERATIONS    (`ITERATIONS)
    ) rotate_inst (
        .i_clk         (i_clk),
        .i_rst_n       (i_rst_n),
        .i_start       (i_start),
        .i_x           (i_x),
        .i_y           (i_y),
        .i_angle       (i_angle),
        .o_x           (o_x),
        .o_y           (o_y),
        .o_done        (o_done)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    initial begin
        i_rst_n = 1'b0;
        i_start = 1'b0;

        // i_x = 16'h4000;         // 2^15
        // i_y = 16'h0000;         // 0
        // i_x = 16'h376f;         // 2^15 * cos(30)
        // i_y = 16'h1fff;         // 2^15 * sin(30)
        // i_x = 16'h376f;         // 2^15 * cos(-30)
        // i_y = 16'he000;         // 2^15 * sin(-30)
        // i_angle = 22'b0000010000110000010101;        // 3.75 degrees in radians
        // i_angle = 22'b0000100001100000101010;        // 7.5 degrees in radians
        // i_angle = 22'b0001000011000001010100;        // 15 degrees in radians
        // i_angle = 22'b0010000110000010101001;        // 30 degrees in radians
        // i_angle = 22'b1101111001111101010111;        // -30 degrees in radians
        // i_angle = 22'b0011001001000011111110;        // 45 degrees in radians
        // i_angle = 22'b0010000110000010101001;        // 30 degrees in radians
        // i_angle = 22'b0100001100000101010010;        // 60 degrees in radians
        // i_angle = 22'b0110010010000111111011;        // 90 degrees in radians

        // 正負相間
        // roughly 38.1966 degrees
        i_angle = 22'd699040;

        // i_x = 7'd20;
        // i_y = 7'd20;
        i_x = 7'b11101100; // -20
        i_y = 7'b11101100; // -20
        // i_angle = 22'b0000000000000000000000;      // 0 degrees in radians

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        
    end

    initial begin
        $dumpfile("tb_rotate.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*100000) $finish;
endmodule