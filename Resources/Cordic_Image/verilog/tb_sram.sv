module tb_sram_emulator;

    // Testbench signals
    reg i_clk;                     // Clock signal
    reg i_we;                      // Write Enable signal
    reg [19:0] i_addr;             // Address signal
    reg [15:0] io_data_in;         // Input data to SRAM for writing
    wire [15:0] io_data;           // Bidirectional data bus

    // Instantiate the SRAM emulator module
    Sram uut (
        .i_clk(i_clk),
        .i_we(i_we),
        .i_addr(i_addr),
        .io_data(io_data)
    );

    // Clock generation: 10ns period (100 MHz clock)
    always begin
        #5 i_clk = ~i_clk;   // Toggle clock every 5ns
    end

    // Stimulus
    initial begin
        // Initialize signals
        i_clk = 0;
        i_we = 0;
        i_addr = 0;
        io_data_in = 0;

        // Wait for global reset
        #10;

        // Write data to address 0
        i_addr = 20'd0;
        io_data_in = 16'hABCD;
        i_we = 1;  // Enable write
        // Drive io_data with io_data_in
        #10;       // Wait one clock cycle

        // Disable write and read back the data from address 0
        i_we = 0;  // Disable write
        #10;       // Wait one clock cycle
        if (io_data == 16'hABCD) begin
            $display("Test 1 Passed: Data read back correctly from address 0.");
        end else begin
            $display("Test 1 Failed: Data mismatch at address 0.");
        end

        // Write data to address 1
        i_addr = 20'd1;
        io_data_in = 16'h1234;
        i_we = 1;  // Enable write
        // Drive io_data with io_data_in
        #10;       // Wait one clock cycle

        // Disable write and read back the data from address 1
        i_we = 0;  // Disable write
        #10;       // Wait one clock cycle
        if (io_data == 16'h1234) begin
            $display("Test 2 Passed: Data read back correctly from address 1.");
        end else begin
            $display("Test 2 Failed: Data mismatch at address 1.");
        end

        // Write data to address 1024
        i_addr = 20'd1024;
        io_data_in = 16'hFFFF;
        i_we = 1;  // Enable write
        // Drive io_data with io_data_in
        #10;       // Wait one clock cycle

        // Disable write and read back the data from address 1024
        i_we = 0;  // Disable write
        #10;       // Wait one clock cycle
        if (io_data == 16'hFFFF) begin
            $display("Test 3 Passed: Data read back correctly from address 1024.");
        end else begin
            $display("Test 3 Failed: Data mismatch at address 1024.");
        end

        // End simulation
        $stop;
    end

    // Assign io_data_in to io_data during writes
    assign io_data = (i_we) ? io_data_in : 16'bz;

endmodule
