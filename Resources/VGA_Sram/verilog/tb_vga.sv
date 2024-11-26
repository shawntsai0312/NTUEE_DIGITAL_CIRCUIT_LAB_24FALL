`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0
`define FRANE_CYCLE_RATIO 108000000/60

module tb;

    reg i_clk, i_rst_n;
    reg [23:0] i_color;
    wire o_H_sync, o_V_sync;
    wire [23:0] o_RGB;
    wire o_RGB_valid;
    wire [31:0] o_frame_counter;
    wire [11:0] o_H_to_be_rendered;
    wire [10:0] o_V_to_be_rendered;
    wire o_to_be_rendered_valid;

    VGA u_VGA (
        .i_clk                     (i_clk),
        .i_rst_n                   (i_rst_n),
        .i_color                   (i_color),
        .o_H_sync                  (o_H_sync),
        .o_V_sync                  (o_V_sync),
        .o_RGB                     (o_RGB),
        .o_RGB_valid               (o_RGB_valid),
        .o_frame_counter           (o_frame_counter),
        .o_H_to_be_rendered        (o_H_to_be_rendered),
        .o_V_to_be_rendered        (o_V_to_be_rendered),
        .o_to_be_rendered_valid    (o_to_be_rendered_valid)
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
        i_color = 24'hffffff;
        #(`CYCLE*3) i_rst_n = 1'b1;
    end

    initial begin
        $dumpfile("tb_vga.vcd");
        $dumpvars;
    end

    initial #(`CYCLE*`FRANE_CYCLE_RATIO) $finish;
endmodule