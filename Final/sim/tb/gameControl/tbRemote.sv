// `timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5

`define RENDER_CYCLE_RATIO 100

`define RENDER_CYCLE `RENDER_CYCLE_RATIO * `CYCLE
`define RENDER_HCYCLE `RENDER_CYCLE_RATIO * `HCYCLE

`define FRAME 400

`define SIM_CYCLE (`RENDER_CYCLE*`FRAME + 100) // 100 cycles for reset

`define PRINT_PROGRESS_CYCLE 1000

import game_pkg::*;
import sram_pkg::*;
import track_pkg::*;

module tb;

    reg i_clk, i_rst_n, i_render_clk;
    reg [2:0] i_car1_acc, i_car2_acc;
    reg [1:0] i_car1_omega, i_car2_omega;


    GameControl u_GameControl (
        .i_clk                (i_clk),
        .i_render_clk         (i_render_clk),
        .i_rst_n              (i_rst_n),
        .i_car1_acc           (i_car1_acc),
        .i_car2_acc           (i_car2_acc),
        .i_car1_omega         (i_car1_omega),
        .i_car2_omega         (i_car2_omega),
        .i_next_state         (1'b1)
    );
    

    // Clock generation
    initial begin
        i_clk = 1'b1;
        i_render_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    always begin
        #(`RENDER_HCYCLE) i_render_clk = ~i_render_clk;
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
        i_car1_acc = 0;
        i_car2_acc = 4;
        i_car1_omega = 2'b00;
        i_car2_omega = 2'b00;
        #(`RENDER_CYCLE*`FRAME/2) begin
            i_car1_acc = 0;
            i_car2_acc = 0;
        end
    end
    
    // Simulation termination
    initial begin
        $fsdbDumpfile("tb_gameControl.fsdb");
        $fsdbDumpvars;
        #(`CYCLE * `SIM_CYCLE);
        $display("Simulation end");
        $finish;
    end

endmodule
