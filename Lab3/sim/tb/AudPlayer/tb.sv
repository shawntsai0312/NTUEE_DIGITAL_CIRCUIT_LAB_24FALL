`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0
`define GOLDENFILE "../../tb/AudPlayer/golden.txt" // File for golden data
`define PATTERN_NUM 4

module tb;
    integer fp_golden;
    logic [15:0] golden_data [0:`PATTERN_NUM-1];
    logic i_clk, check;
    integer error, i;

    logic i_rst_n, i_daclrck, i_en;
    logic [15:0] i_dac_data;
    logic o_aud_dacdat;

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    // DUT instantiation
    AudPlayer player (
        .i_rst_n      (i_rst_n),
        .i_bclk       (i_clk),
        .i_daclrck    (i_daclrck),
        .i_en         (i_en),
        .i_dac_data   (i_dac_data),
        .o_aud_dacdat (o_aud_dacdat)
    );

    // Task to load golden data
    task load_golden_data;
        input string file_name;
        integer status;
        begin
            fp_golden = $fopen(file_name, "rb");
            if (fp_golden == 0) begin
                $display("Error: Could not open golden data file.");
                $finish;
            end
            for (i = 0; i < `PATTERN_NUM; i = i + 1) begin
                status = $fscanf(fp_golden, "%b\n", golden_data[i]);
            end
            $fclose(fp_golden);
        end
    endtask

    // Task to save error messages
    task save_error;
        input integer pattern;
        input integer bit_index;
        input bit player_out, golden_out;
        begin
            error = error + 1;
            $display("Error at pattern %0d bit %0d : player_out %b != golden_out %b", pattern, bit_index, player_out, golden_out);
        end
    endtask

    // Test process
    initial begin
        i_rst_n = 1'b1; check = 1'b0; i_en = 1'b0; i_daclrck = 1'b1;
        error = 0;
        load_golden_data(`GOLDENFILE);
        
        // Reset sequence
        #(`CYCLE * 2.5) i_rst_n = 1'b0;
        #(`CYCLE * 3) i_rst_n = 1'b1;

        // Loop through test patterns
        for (i = 0; i < `PATTERN_NUM; i = i + 1) begin
            // Set input data
            @ (negedge i_clk);
            i_en = 1'b1;
            i_daclrck = 1'b0;
            i_dac_data = golden_data[i];
            #(`CYCLE *1) check = 1'b1; // the first cycle is hold
            // Compare each bit of i_dac_data with the corresponding output
            for (int bit_index = 15; bit_index >= 0; bit_index = bit_index - 1) begin
                #(`CYCLE * 0.5); // detect at the falling edge of bclk
                if (o_aud_dacdat !== i_dac_data[bit_index]) begin
                    save_error(i, bit_index, o_aud_dacdat, i_dac_data[bit_index]);  // Check each bit
                end
                // $display("Pattern %0d bit %2d: player_out %b == golden_out %b, time %5d", i, bit_index, o_aud_dacdat, i_dac_data[bit_index], $time);
                #(`CYCLE * 0.5);
            end
            check = 1'b0;
            #(`CYCLE * 3) i_daclrck = 1'b1;
            #(`CYCLE * 20) i_en = 1'b0;
            $display("");
        end

        // Check if any errors occurred
        if (error == 0) begin
            $display("==========================================");
            $display("======  Congratulations! You Pass!  ======");
            $display("==========================================");
        end else begin
            $display("===============================");
            $display("There are %0d errors.", error);
            $display("===============================");
        end
        $finish;
    end

    // Dumping waveform files
    initial begin
        $fsdbDumpfile("tb_AudPlayer.fsdb");
        $fsdbDumpvars;
    end
    initial #(`CYCLE*10000000) $finish;
endmodule
