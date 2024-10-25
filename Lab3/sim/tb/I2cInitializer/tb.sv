`timescale 1us/1us

module tb;

parameter cycle = 10.0; // cycle = 10us, 100kHz

logic i_rst_n;
logic i_clk;
logic i_start;
logic o_finished;
logic o_sclk;  // SCL output from module
tri io_sdat;   // SDA bidirectional line (input/output depending on o_oen)
logic o_oen;   // Output enable for SDA

/*------------------------------------------- Testbench use only -------------------------------------------*/
    // logic [3:0] o_bit_counter; // Testbench use only
    // logic [1:0] o_byte_counter; // Testbench use only
    // logic [3:0] o_command_counter; // Testbench use only

// Clock generation
initial i_clk = 0;
always #(cycle/2.0) i_clk = ~i_clk;

// Instantiate the DUT (Device Under Test)
I2cInitializer i2c (
    .i_rst_n(i_rst_n),
    .i_clk(i_clk),
    .i_start(i_start),
    /*------------------------------------------- Testbench use only -------------------------------------------*/
        // .o_bit_counter(o_bit_counter), // Testbench use only
        // .o_byte_counter(o_byte_counter), // Testbench use only
        // .o_command_counter(o_command_counter), // Testbench use only
    .o_finished(o_finished),
    .o_sclk(o_sclk),
    .io_sdat(io_sdat),
    .o_oen(o_oen)
);

integer fp_golden; // File pointer for golden file
reg [23:0] golden_data [0:10]; // 11 x 24-bit golden data
reg [23:0] detected_data; // Detected 24-bit data storage
integer i, j;

// SDA control logic based on o_oen
assign io_sdat = o_oen ? 1'bz : 1'b0; // Pull SDA low when o_oen is 0

// I2C protocol tasks
task check_start_condition;
    // Ensure SDA goes low when SCL is high (Start condition)
    // @(posedge o_sclk);
    @(negedge i_clk);
    // $display("---------------------------------------------------------------------------");
    // $display("Start time: %0t", $time);
    // if (!io_sdat)
    //     $display("Start condition detected");
    // else
    //     $display("Error: Start condition failed, io_sdat = %b", io_sdat);
endtask

task check_stop_condition;
    // Ensure SDA goes high when SCL is high (Stop condition)
    @(posedge o_sclk);
    @(negedge i_clk);
    // $display("Stop time: %0t", $time);
    // if (io_sdat)
    //     $display("Stop condition detected");
    // else
    //     $display("Error: Stop condition failed, io_sdat = %b", io_sdat);
    // $display("---------------------------------------------------------------------------");
endtask

task send_ack;
    // Send ACK (pull SDA low) after each 8-bit transmission
    @(posedge o_sclk);
    force io_sdat = 0;  // Acknowledge by pulling SDA low
    @(negedge o_sclk);  // Keep SDA low during the high phase of SCL
    release io_sdat;    // Release SDA after ACK
endtask

// Test procedure
initial begin
    // Dump waveform
    $fsdbDumpfile("tb_I2cInitializer.fsdb");
    $fsdbDumpvars(0, tb, "+all");
    $display("");

    // Reset and initialize signals
    i_clk = 0;
    i_rst_n = 1;
    i_start = 0;

    repeat(3) @(negedge i_clk);
    i_rst_n = 0;
    @(negedge i_clk);
    i_rst_n = 1; 
    repeat(3) @(negedge i_clk);
    i_start = 1;
    @(posedge i_clk);
    i_start = 0;

    // Open and read golden file
    fp_golden = $fopen("../../tb/I2cInitializer/golden.txt", "rb");
    if (fp_golden == 0) begin
        $display("ERROR: Could not open golden.txt file");
        $finish;
    end

    // Read the 11 x 24-bit golden data
    for (i = 0; i < 11; i = i + 1) begin
        // $fscanf(fp_golden, "%h\n", golden_data[i]);
        $fscanf(fp_golden, "%b\n", golden_data[i]);

    end

    // I2C transmission test for each 24-bit data frame
    for (i = 0; i < 11; i = i + 1) begin
        // Reset detected data for each frame
        detected_data = 24'b0;

        // Check start condition before sending 24 bits
        check_start_condition();

        // Send 24 bits of data in 8-bit chunks
        for (j = 23; j >= 0; j = j - 1) begin
            @(posedge o_sclk);
            @(negedge i_clk);
            // $display("Current time: %0t", $time);

            // Shift detected bits into the detected_data register
            detected_data[j] = io_sdat;

            /*------------------------------------------- Testbench use only -------------------------------------------*/
                // $display("Theory: Command %0d, Byte %0d, Bit %0d: %b", i, (23-j)/8, (23-j)%8, golden_data[i][j]);
                // $display("Actual: Command %0d, Byte %0d, Bit %0d: %b", o_command_counter, o_byte_counter, o_bit_counter, io_sdat);
                // $display("");

            // After sending every 8 bits, send acknowledgment
            if ((j % 8) == 0) begin
                send_ack();
            end
        end

        

        // Check stop condition after sending 24 bits
        check_stop_condition();

        // Print both golden and detected data for this 24-bit frame
        $display("Command %0d:", i);
        $display("Golden data:   %b", golden_data[i]);
        $display("Detected data: %b", detected_data);
        if (golden_data[i] == detected_data) begin
            $display("Data match");
        end else begin
            $display("Data mismatch");
        end
        $display("");
    end

    $fclose(fp_golden);

    @(posedge o_sclk);
    @(negedge i_clk);
    $display("Finish time: %0t", $time);
    if (o_finished) begin
        $display("I2C transaction completed successfully");
    end else begin
        $display("Error: I2C transaction did not complete");
    end

    $finish;
end

initial #(cycle*15000000) $finish;

endmodule
