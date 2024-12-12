`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

`define VEC_WIDTH 8
`define ANG_WIDTH 9

module tb;
    reg i_clk, i_rst_n, i_start;
    reg signed [`VEC_WIDTH-1:0] i_x, i_y;
    wire signed [`ANG_WIDTH-1:0] o_angle;
    wire o_done;

    AngleXYnonPipelined #(
        .VEC_WIDTH            (`VEC_WIDTH),
        .ANG_WIDTH            (`ANG_WIDTH)
    ) u_Rotate (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (i_start),
        .i_x                  (i_x),
        .i_y                  (i_y),
        .o_angle              (o_angle),
        .o_done               (o_done)
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
            $display("i_x = %d, i_y = %d", i_x, i_y);
            $display("o_angle = %d\n", o_angle);
        end
    end

    initial begin
        i_rst_n = 1'b0;
        i_start = 1'b0;

        i_x = 30;
        i_y = 40;

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        
    end

    initial begin
        $dumpfile("tb_rotate.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*50) $finish;
endmodule