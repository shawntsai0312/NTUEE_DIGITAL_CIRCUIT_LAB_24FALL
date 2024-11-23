`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

`define VEC_WIDTH 8
`define ANG_WIDTH 9
`define VEC_PROCESS_WIDTH 16
`define ANG_PROCESS_WIDTH 16
`define ITERATIONS 12
`define ANG_TABLE_WIDTH (`ANG_PROCESS_WIDTH - 1)

module tb;
    reg i_clk, i_rst_n, i_start;
    reg signed [`VEC_WIDTH-1:0] i_x, i_y;
    reg signed [`ANG_WIDTH-1:0] i_angle;
    wire signed [`VEC_WIDTH-1:0] o_x, o_y;
    wire o_done;

    Rotate #(
        .VEC_WIDTH            (`VEC_WIDTH),
        .ANG_WIDTH            (`ANG_WIDTH),
        .VEC_PROCESS_WIDTH    (`VEC_PROCESS_WIDTH),
        .ANG_PROCESS_WIDTH    (`ANG_PROCESS_WIDTH),
        .ITERATIONS           (`ITERATIONS),
        .ANG_TABLE_WIDTH      (`ANG_TABLE_WIDTH)
    ) u_Rotate (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (i_start),
        .i_x                  (i_x),
        // Integer, no floating point
        .i_y                  (i_y),
        // Integer, no floating point
        .i_angle              (i_angle),
        // Integer, no floating point
        // Input from -180 to 180 degrees
        // the MSB is -2^8

        .o_x                  (o_x),
        // Integer, no floating point
        .o_y                  (o_y),
        // Integer, no floating point
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
            $display("i_x = %d, i_y = %d, i_angle = %d", i_x, i_y, i_angle);
            $display("o_x = %d, o_y = %d\n", o_x, o_y);
        end
    end

    initial begin
        i_rst_n = 1'b0;
        i_start = 1'b0;

        i_x = -61;
        i_y = -49;
        i_angle = 32;

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        
    end

    initial begin
        $dumpfile("tb_rotate.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*50) $finish;
endmodule