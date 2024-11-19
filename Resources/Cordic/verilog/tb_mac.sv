`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

module tb;
    reg i_clk, i_rst_n, i_start;
    reg [15:0] i_x, i_y;
    reg [21:0] i_angle;
    wire [15:0] o_x, o_y;
    wire o_done;

    Rotate #(
        .DATA_WIDTH    (16),
        .ITERATIONS    (16)
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
        i_x = 16'h376f;         // 2^15 * cos(-30)
        i_y = 16'he000;         // 2^15 * sin(-30)
        // i_angle = 22'b0010000110000010101001;    // 30 degrees in radians
        // i_angle = 22'b1101111001111101010111;       // -30 degrees in radians
        i_angle = 22'b0100001100000101010010;      // 60 degrees in radians

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        
    end

    initial begin
        $dumpfile("tb_rotate.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*100000) $finish;
endmodule