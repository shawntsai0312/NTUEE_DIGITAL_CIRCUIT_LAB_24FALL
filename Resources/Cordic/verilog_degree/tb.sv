`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

module tb;

    reg i_clk, i_rst_n;

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    initial begin
        $fsdbDumpfile("tb_rotate.fsdb");
        $fsdbDumpvars;
    end

    initial #(`CYCLE*10000000) $finish;
endmodule