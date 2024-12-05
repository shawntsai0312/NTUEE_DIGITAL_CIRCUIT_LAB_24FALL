`timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5
`define SIM_CYCLE (108000000 / 60 + 100) // 1 frames, 100 for margin
// `define SIM_CYCLE 220000 // test only, enough for prepare 1 frame
// `define SIM_CYCLE 7500 // test only, enough for image rotation

// `define SIM_CYCLE (108000000 + 100) // 60 frames, 100 for margin

`define PRINT_PROGRESS_CYCLE 100000

module tb;

    reg i_clk, i_rst_n;

    wire [19:0] addr;
    tri [15:0] data;
    wire we_n;

    wire [23:0] o_RGB;
    wire o_RGB_valid;

    wire o_render_clk;

    // wire o_car1_opacity_mask [0:59][0:59];
    // wire o_car2_opacity_mask [0:59][0:59];

    // Main module instantiation
    Main u_Main (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .o_SRAM_ADDR        (addr),
        .io_SRAM_DQ         (data),
        .o_SRAM_WE_N        (we_n),
        // .o_car1_opacity_mask (o_car1_opacity_mask),
        // .o_car2_opacity_mask (o_car2_opacity_mask),
        .o_RGB              (o_RGB),
        .o_RGB_valid        (o_RGB_valid),
        .o_render_clk       (o_render_clk)
    );

    // SRAM module instantiation
    Sram u_Sram (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .i_we_n     (we_n),
        .i_addr     (addr),
        .io_data    (data)
    );

    integer vga_video;
    initial begin
        vga_video = $fopen("vga_video.bin", "wb");
    end

    always @(posedge i_clk) begin
        if (o_RGB_valid) begin
            // if(o_R!=0 || o_G!=0 || o_B!=0) $display("RGB(%d, %d, %d)", o_R, o_G, o_B);
            $fwrite(vga_video, "%c%c%c", o_RGB[23:16], o_RGB[15:8], o_RGB[7:0]);
        end
    end

    // Clock generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    integer sim_cycle_counter;
    real progress_percentage;

    initial begin
        sim_cycle_counter = 0;
    end

    always @(posedge i_clk) begin
        sim_cycle_counter = sim_cycle_counter + 1;

        // Calculate percentage
        progress_percentage = (sim_cycle_counter * 100.0) / `SIM_CYCLE;

        // Print progress every 10,000 cycles (or choose your interval)
        if (sim_cycle_counter % `PRINT_PROGRESS_CYCLE == 0 || sim_cycle_counter == `SIM_CYCLE) begin
            $display("Simulation cycle: %8d/%8d (%.2f%%)", sim_cycle_counter, `SIM_CYCLE, progress_percentage);
        end

        // Check for simulation end
        if (sim_cycle_counter >= `SIM_CYCLE) begin
            $display("Simulation complete: %8d/%8d (%.2f%%)", sim_cycle_counter, `SIM_CYCLE, progress_percentage);
            $finish;
        end
    end


    // Reset sequence
    initial begin
        i_rst_n = 1'b0;
        #(`CYCLE*3) i_rst_n = 1'b1; // Release reset after a few cycles
        $display("Simulation start");
    end
    
    // Simulation termination
    initial begin
        $fsdbDumpfile("tb_main.fsdb");
        $fsdbDumpvars;
        #(`CYCLE * `SIM_CYCLE);
        $display("Simulation end");
        $finish;
    end

endmodule
