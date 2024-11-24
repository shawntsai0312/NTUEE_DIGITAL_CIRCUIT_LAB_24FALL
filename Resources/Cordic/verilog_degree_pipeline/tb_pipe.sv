`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

`define VEC_WIDTH 8
`define ANG_WIDTH 9
`define VEC_PROCESS_WIDTH 22

module tb;
    reg i_clk, i_rst_n, i_start;
    reg signed [`VEC_WIDTH-1:0] i_x, i_y;
    reg signed [`ANG_WIDTH-1:0] i_angle;
    wire signed [`VEC_WIDTH-1:0] o_x, o_y;
    wire o_valid;

    integer testdata_file, goldendata_file, log_file;
    integer testdata_status, goldendata_status;
    integer test_count = 0;
    reg signed [`VEC_WIDTH-1:0] golden_x, golden_y;

    RotateXY #(
        .VEC_WIDTH            (`VEC_WIDTH),
        .ANG_WIDTH            (`ANG_WIDTH)
    ) u_Rotate (
        .i_clk                (i_clk),
        .i_rst_n              (i_rst_n),
        .i_start              (i_start),
        .i_x                  (i_x),
        .i_y                  (i_y),
        .i_angle              (i_angle),
        .o_x                  (o_x),
        .o_y                  (o_y),
        .o_valid              (o_valid)
    );

    // Clock generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    // Feed test data and verify outputs
    // 定義存儲輸出結果的陣列
    int o_x_array[0:9999];
    int o_y_array[0:9999];
    int output_count = 0;
    int error = 0;
    
    initial begin
        // Open the test data and golden data files
        testdata_file = $fopen("testdata.txt", "r");
        goldendata_file = $fopen("goldendata.txt", "r");
        log_file = $fopen("test_results.log", "w");
    
        if (!testdata_file || !goldendata_file) begin
            $display("Failed to open test data or golden data file.");
            $finish;
        end
    
        // Apply test data and verify outputs
        i_start = 1'b1; // Set start signal to true initially
        while (!$feof(testdata_file)) begin
            // Read test inputs
            testdata_status = $fscanf(testdata_file, "%d %d %d\n", i_x, i_y, i_angle);
    
            // Wait for clock posedge and store outputs if o_valid is true
            @(posedge i_clk);
            if (o_valid) begin
                o_x_array[output_count] = o_x;
                o_y_array[output_count] = o_y;
                output_count = output_count + 1;
            end
        end
    
        i_start = 1'b0; // Set start signal to false after all inputs are read
    
        // Verify outputs after simulation
        for (int i = 0; i < output_count; i++) begin
            goldendata_status = $fscanf(goldendata_file, "%d %d\n", golden_x, golden_y);
            if (o_x_array[i] !== golden_x || o_y_array[i] !== golden_y) begin
                error += 1;
                $display("\nMismatch in Test %0d:", i);
                $display("Output:      o_x =%6d,      o_y =%6d", o_x_array[i], o_y_array[i]);
                $display("Golden: golden_x =%6d, golden_y =%6d", golden_x, golden_y);
                
                $fwrite(log_file, "Mismatch in Test %0d:\n", i);
                $fwrite(log_file, "Output:      o_x =%6d,      o_y =%6d\n", o_x_array[i], o_y_array[i]);
                $fwrite(log_file, "Golden: golden_x =%6d, golden_y =%6d\n\n", golden_x, golden_y);
            end
        end
    
        $display("\nAll %d tests completed.", output_count);
        $display("Total errors: %d", error);
        $display("Error rate: %f%%", (error * 100.0) / output_count);
        $fclose(testdata_file);
        $fclose(goldendata_file);
        $fclose(log_file);
        $finish;
    end


    // Waveform dump
    initial begin
        $dumpfile("tb_rotate.vcd");
        $dumpvars;
    end
endmodule
