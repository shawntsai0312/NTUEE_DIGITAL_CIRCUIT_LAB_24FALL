`timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5
// `define SIM_CYCLE 108000000 / 60 // 1600*900@60 1 frames
// `define SIM_CYCLE 180000
`define SIM_CYCLE 10000

module tb;

    reg i_clk, i_rst_n;
    reg signed [sram_pkg::MAP_H_WIDTH-1:0] car1_x_frameDecoder_input, car2_x_frameDecoder_input;
    reg signed [sram_pkg::MAP_H_WIDTH-1:0] car1_y_frameDecoder_input, car2_y_frameDecoder_input;

    reg car1_opacity_map [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    reg car2_opacity_map [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    
    FrameDecoder u_FrameDecoder (
        .i_clk                  (i_clk),
        .i_rst_n                (i_rst_n),
        .i_car1_x               (car1_x_frameDecoder_input),
        .i_car1_y               (car1_y_frameDecoder_input),
        .i_car2_x               (car2_x_frameDecoder_input),
        .i_car2_y               (car2_y_frameDecoder_input),
        .i_car1_opacity_map     (car1_opacity_map),
        .i_car2_opacity_map     (car2_opacity_map),
        .i_VGA_H                (H_to_be_rendered),
        .i_VGA_V                (V_to_be_rendered),
        .o_sram_addr            (addr_decode),
        .i_sram_data            (data_decode),
        .o_decoded_color        (decoded_color)
    );

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
    end

    integer cycle_count = 0;
    always @(posedge i_clk) begin
        cycle_count = cycle_count + 1;
        if (cycle_count % 1000 == 0) begin
            $display("simulation cycle = %10d / %10d, progress = %0.2f%%", cycle_count, `SIM_CYCLE, (cycle_count * 100.0) / `SIM_CYCLE);
        end
    end

    initial begin
        $fsdbDumpfile("tb_frameDecoder.fsdb");
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