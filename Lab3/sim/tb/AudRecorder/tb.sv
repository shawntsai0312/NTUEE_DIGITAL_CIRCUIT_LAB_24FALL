`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0
`define GOLDENFILE "../../tb/AudRecorder/golden.txt" // File for golden data
`define PATTERN_NUM 16

module tb;
    integer fp_golden;
    logic [19:0] golden_data [0:`PATTERN_NUM-1];

    logic i_clk;
    logic i_rst_n;
    logic i_lrc;
    logic i_start;
    logic i_stop;
    logic i_data;
    logic [19:0] o_address;
    logic [15:0] o_data;
    logic [19:0] o_stop_address;

    // logic [15:0] recorder_data;
    integer error;

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    // DUT instantiation
    AudRecorder audRecorder (
        .i_rst_n           (i_rst_n),
        .i_clk             (i_clk),
        .i_lrc             (i_lrc),
        .i_start           (i_start),
        .i_stop            (i_stop),
        .i_data            (i_data),
        .o_address         (o_address),
        .o_data            (o_data),
        .o_stop_address    (o_stop_address)
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
            for (int i = 0; i < `PATTERN_NUM; i = i + 1) begin
                status = $fscanf(fp_golden, "%b\n", golden_data[i]);
            end
            $fclose(fp_golden);
        end
    endtask

    // Task to save error messages
    task save_error;
        input integer pattern;
        input integer bit_index;
        input bit recorder_out, golden_out;
        begin
            error = error + 1;
            $display("Error at pattern %0d bit %0d : recorder_out %b != golden_out %b", pattern, bit_index, recorder_out, golden_out);
        end
    endtask

    // Test process
    initial begin
        i_rst_n = 1'b1;
        i_lrc = 1'b1;
        i_stop = 1'b0;
        i_start = 1'b0;
        i_data = 1'b0;
        error = 0;
        load_golden_data(`GOLDENFILE);
        
        // Reset sequence
        #(`CYCLE * 2.5) i_rst_n = 1'b0;
        #(`CYCLE * 3)   i_rst_n = 1'b1;
        #(`CYCLE * 0.5) i_start = 1'b1;
        #(`CYCLE * 0.5) i_start = 1'b0;

        // Loop through test patterns
        for (int i = 0; i < `PATTERN_NUM; i = i + 1) begin
            // Set input data
            @ (negedge i_clk);
            i_lrc = 1'b0;
            #(`CYCLE * 20) i_lrc = 1'b1;
            #(`CYCLE * 1); // hold 1 cycle
            for(int j = 15; j >= 0; j = j - 1) begin
                @ (negedge i_clk);
                i_data = golden_data[i][j];
                // if ( i == 10 && j == 8) i_stop = 1'b1; // test mid stop
            end
            #(`CYCLE * 2);
            @ (negedge i_clk);
            if( o_data != golden_data[i] ) begin
                error = error + 1;
                $display("==========================================");
                $display("Test pattern %0d", i);
                $display("Time             : %0d", $time);
                $display("Golden data      : %16b", golden_data[i]);
                $display("Recorded data    : %16b", o_data);
                $display("Recorded address : %20b", o_address);
                $display("Stop address     : %20b", o_stop_address);
                $display("==========================================");
            end
            #(`CYCLE * 2);
        end
        // i_stop = 1'b1;
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
        $fsdbDumpfile("tb_AudRecorder.fsdb");
        $fsdbDumpvars;
    end
    initial #(`CYCLE*10000000) $finish;
endmodule
