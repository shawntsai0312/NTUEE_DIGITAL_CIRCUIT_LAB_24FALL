`timescale 1ns/10ps
`define CYCLE 10
`define HCYCLE 5
`define SIM_CYCLE 100

module tb;

    reg i_clk, i_rst_n;

    reg [19:0] addr;
    wire [15:0] data;
    reg we_n;

    // SRAM module instantiation
    Sram u_Sram (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .i_we_n     (we_n),
        .i_addr     (addr),
        .io_data    (data)
    );

    // Clock generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    // Reset sequence
    initial begin
        i_rst_n = 1'b0;
        #(`CYCLE*3)
        i_rst_n = 1'b1; // Release reset after a few cycles
        $display("Simulation start");
        addr = 0;
        we_n = 1;
    end

    // Simulation progress
    integer cycle_count = 0;
    always @(posedge i_clk) begin
        cycle_count = cycle_count + 1;
        if (cycle_count % 1000 == 0) begin
            $display("simulation cycle = %10d / %10d, progress = %0.2f%%", cycle_count, `SIM_CYCLE, (cycle_count * 100.0) / `SIM_CYCLE);
        end
    end

    // Simulation termination
    initial begin
        $fsdbDumpfile("tb_sram.fsdb");
        $fsdbDumpvars;
        #(`CYCLE * `SIM_CYCLE);
        $display("Simulation end");
        $finish;
    end

endmodule
