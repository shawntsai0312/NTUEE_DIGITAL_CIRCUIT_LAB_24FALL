// `timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5
`define SIM_CYCLE 10 // test only, enough for prepare 1 frame

`define PRINT_PROGRESS_CYCLE 10000

import sram_pkg::*;
import game_pkg::*;

module tb;

    reg i_clk, i_rst_n;

    reg signed [sram_pkg::MAP_H_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_x, i_car2_x;
    reg signed [sram_pkg::MAP_V_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_y, i_car2_y;

    reg signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_car1_v_x, i_car1_v_y, i_car2_v_x, i_car2_v_y;


    CarCollision u_CarCollision (
        .i_car1_x         (i_car1_x),
        .i_car1_y         (i_car1_y),
        .i_car2_x         (i_car2_x),
        .i_car2_y         (i_car2_y),
        .i_car1_v_x       (i_car1_v_x),
        .i_car1_v_y       (i_car1_v_y),
        .i_car2_v_x       (i_car2_v_x),
        .i_car2_v_y       (i_car2_v_y),
        .i_car1_radius    (20),
        .i_car2_radius    (20),
        .i_car1_mass      (1),
        .i_car2_mass      (1)
    );

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
        i_car1_x = -32143;
        i_car1_y = -18952;
        i_car2_x = -32000;
        i_car2_y = -21440;
        i_car1_v_x = -6;
        i_car1_v_y = -49;
        i_car2_v_x = 0;
        i_car2_v_y = 0;
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
