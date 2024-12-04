`timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5

module tb;

    reg i_clk, i_rst_n, i_start;
    reg signed [31:0] i_car1_angle, i_car2_angle;

    wire [19:0] o_sram_addr;
    wire [15:0] o_sram_data;
    
    wire [31:0] o_proc_counter;
    wire [31:0] o_pixel_counter;
    wire o_opacity;
    wire o_opacity_valid;
    wire o_done;

    FrameEncoder u_FrameEncoder (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_start            (i_start),
        .i_car1_angle       (i_car1_angle),
        .i_car2_angle       (i_car2_angle),
        .o_sram_addr        (o_sram_addr),
        .o_sram_data        (o_sram_data),
        .o_proc_counter     (o_proc_counter),
        .o_pixel_counter    (o_pixel_counter),
        .o_opacity          (o_opacity),
        .o_opacity_valid    (o_opacity_valid),
        .o_done             (o_done)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    initial begin
        // $display("Initial block start");
        i_rst_n = 1'b0;
        i_start = 1'b0;

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        $display("Start");
        i_car1_angle = 60;
        i_car2_angle = 120;
    end

    initial begin
        $dumpfile("tb_frameEncoder.vcd");
        $dumpvars;
    end

    initial begin
        // #(`CYCLE * `SIM_TIME * 108000000)
        // #(`CYCLE * 108000000 / 60) // 1600*900@60 1 frames
        // #(`CYCLE * 25200000 / 60) // 640*480@60 1 frames
        #(`CYCLE * 1000)
        $display("Simulation end");
        $finish;
    end

endmodule