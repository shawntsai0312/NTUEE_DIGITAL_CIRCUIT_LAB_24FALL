module Sram (
    input wire i_clk,                // Clock signal
    input wire i_rst_n,              // Reset signal (active low)
    input wire i_we_n,               // Write Enable (active low)
    input wire [19:0] i_addr,        // 20-bit address (2^20 locations)
    inout wire [15:0] io_data        // Bidirectional data bus
);

    // SRAM memory array: 2^20 x 16 bits
    reg [15:0] memory [0:(1<<20)-1];
    reg [15:0] read_data;            // Internal register for read data

    // Tri-state buffer for the io_data bus
    assign io_data = i_we_n ? read_data : 16'bz;

    integer file, bytes_read, init_addr;
    reg [7:0] byte_buffer [0:3];     // Temporary buffer for byte data
    reg [15:0] data_word;            // Temporary variable for 16-bit data

    // SRAM initialization from .bin file
    initial begin
        file = $fopen("../../sram/mapLUT.bin", "rb"); // Open binary file
        if (file == 0) begin
            $display("Error: Failed to open file mapLUT.bin");
            $finish;
        end

        // Read data from file and initialize memory
        init_addr = 0;
        while (!$feof(file)) begin
            bytes_read = $fread(byte_buffer, file);
            if (bytes_read != 4) break; // Ensure we read a full 16-bit word

            // Combine bytes into 16-bit word
            data_word = {byte_buffer[3][3:0], byte_buffer[2][3:0], byte_buffer[1][3:0], byte_buffer[0][3:0]};
            memory[init_addr] = data_word;
            init_addr = init_addr + 1;
        end

        $fclose(file);
        $display("SRAM initialized with %0d entries from mapLUT.bin", init_addr);
    end

    // SRAM read/write logic
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            // Reset operation
            read_data <= 16'b0;
        end else if (!i_we_n) begin
            // Write operation
            memory[i_addr] <= io_data;
        end else begin
            // Read operation
            read_data <= memory[i_addr];
        end
    end

endmodule
