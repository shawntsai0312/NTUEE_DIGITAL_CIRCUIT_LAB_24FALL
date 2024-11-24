module Sram (
    input wire i_clk,                // Clock signal
    input wire i_we,                 // Write Enable
    input wire [19:0] i_addr,        // 20-bit address (2^20 locations)
    inout wire [15:0] io_data        // Bidirectional data bus
);

    // SRAM memory array: 2^20 x 16 bits
    reg [15:0] memory [0:(1<<20)-1];
    reg [15:0] read_data;            // Internal register for read data

    // Tri-state buffer for the io_data bus
    assign io_data = (i_we == 1'b0) ? read_data : 16'bz;

    always @(posedge i_clk) begin
        if (i_we) begin
            // Write operation
            memory[i_addr] <= io_data;
        end else begin
            // Read operation
            read_data <= memory[i_addr];
        end
    end

endmodule
