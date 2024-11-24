`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

`define IMAGE_SIZE 60
`define IMAGE_COOR_BIT 7
`define ANG_WIDTH 9

module tb;
    reg i_clk, i_rst_n, i_start;
    reg [`IMAGE_COOR_BIT-1:0] i_H, i_V;
    reg signed [`ANG_WIDTH-1:0] i_angle;
    wire [`IMAGE_COOR_BIT-1:0] o_H, o_V;
    wire o_done, o_outOfRange;

    RotateImage #(
        .IMAGE_SIZE(`IMAGE_SIZE),
        .IMAGE_COOR_BIT(`IMAGE_COOR_BIT),
        .ANG_WIDTH(`ANG_WIDTH)
    ) u_RotateImage (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_start(i_start),
        .i_H(i_H),
        .i_V(i_V),
        .i_angle(i_angle),
        .o_H(o_H),
        .o_V(o_V),
        .o_done(o_done),
        .o_outOfRange(o_outOfRange)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    always @(posedge i_clk) begin
        if(o_done) begin
            $display("i_H = %d, i_V = %d, i_angle = %d", i_H, i_V, i_angle);
            $display("o_H = %d, o_V = %d, o_outOfRange = %b\n", o_H, o_V, o_outOfRange);
        end
    end

    initial begin
        i_rst_n = 1'b0;
        i_start = 1'b0;

        i_H = 0;
        i_V = 30;
        i_angle = 45;

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        
    end

    initial begin
        $dumpfile("tb_rotate_image.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*50) $finish;
endmodule