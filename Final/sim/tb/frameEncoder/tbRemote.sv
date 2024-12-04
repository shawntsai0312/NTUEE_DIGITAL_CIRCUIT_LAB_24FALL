`timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5
// `define SIM_CYCLE 108000000 / 60 // 1600*900@60 1 frames
// `define SIM_CYCLE 180000
`define SIM_CYCLE 10000

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

    // wire [3:0] car1_lut_data [0:59][0:59];
    // car1_lut u_car1_lut (
    //     .pixel_data    (car1_lut_data)
    // );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    initial begin
        $display("Initial block start");
        // $display("car1 [14][24] = %d", car1_lut_data[14][24]);
        i_rst_n = 1'b0;
        i_start = 1'b0;
        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
        i_car1_angle = 0;
        i_car2_angle = 90;
        #(`CYCLE*1000) i_start = 1'b0;
    end

    integer cycle_count = 0;
    always @(posedge i_clk) begin
        cycle_count = cycle_count + 1;
        if (cycle_count % 1000 == 0) begin
            $display("simulation cycle = %10d / %10d, progress = %0.2f%%", cycle_count, `SIM_CYCLE, (cycle_count * 100.0) / `SIM_CYCLE);
        end
    end

    initial begin
        $fsdbDumpfile("tb_frameEncoder.fsdb");
        $fsdbDumpvars;
    end

    initial begin
        // #(`CYCLE * `SIM_TIME * 108000000)
        #(`CYCLE * `SIM_CYCLE) // 1600*900@60 1 frames
        // #(`CYCLE * 25200000 / 60) // 640*480@60 1 frames
        // #(`CYCLE * 1000)
        $display("Simulation end");
        $finish;
    end

endmodule