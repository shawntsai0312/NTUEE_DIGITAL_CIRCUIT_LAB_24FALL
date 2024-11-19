`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

module tb;

    reg i_clk, i_rst_n;
    wire o_H_sync, o_V_sync;
    wire [7:0] o_R, o_G, o_B;

    vga u_vga (
    .i_clk       (i_clk),
    .i_rst_n     (i_rst_n),
    .o_H_sync    (o_H_sync),
    .o_V_sync    (o_V_sync),
    .o_R         (o_R),
    .o_G         (o_G),
    .o_B         (o_B)
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
        #(`CYCLE*3) i_rst_n = 1'b1;
    end

    initial begin
        $dumpfile("tb_vga.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*10000000) $finish;
endmodule