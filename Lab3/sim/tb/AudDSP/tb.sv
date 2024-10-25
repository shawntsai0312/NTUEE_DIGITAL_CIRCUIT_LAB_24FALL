`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0
`define MEMFILE "../../tb/AudDSP/golden/mem.txt" // File for SRAM data
`define NUM_MEM_DATA 100
`define SIM_CYCLES 1000000

`define GOLDENFILE "../../tb/AudDSP/golden/linear/linear_7.txt" // File for golden data
`define SPEED 7
`define IS_SLOW 1
`define SLOW_MODE 1
`define NUM_GOLDEN_DATA (`NUM_MEM_DATA * `SPEED)

// `define GOLDENFILE "../../tb/AudDSP/golden/fast/fast_4.txt" // File for golden data
// `define SPEED 4
// `define IS_SLOW 0
// `define SLOW_MODE 1
// `define NUM_GOLDEN_DATA (`NUM_MEM_DATA / `SPEED)    

// `define GOLDENFILE "../../tb/AudDSP/golden/constant/constant_6.txt" // File for golden data
// `define SPEED 6
// `define IS_SLOW 1
// `define SLOW_MODE 0
// `define NUM_GOLDEN_DATA (`NUM_MEM_DATA * `SPEED)

// `define GOLDENFILE "../../tb/AudDSP/golden/normal.txt" // File for golden data
// `define SPEED 1
// `define IS_SLOW 1
// `define SLOW_MODE 0
// `define NUM_GOLDEN_DATA `NUM_MEM_DATA

module tb;
    // Dumping waveform files
    logic i_rst_n, i_clk, i_start, i_pause;
    logic [2:0] i_speed;
    logic i_is_slow, i_slow_mode, i_daclrck;
    logic [15:0] i_sram_data;
    logic [19:0] i_sram_stop_addr;
    logic [15:0] o_dac_data;
    logic o_en;
    logic [19:0] o_sram_addr;

    integer fp_mem, fp_golden;
    // logic [15:0] mem_data [0:`NUM_MEM_DATA-1];
    // logic [15:0] golden_data [0:`NUM_GOLDEN_DATA-1];
    reg [15:0] mem_data[`NUM_MEM_DATA];
    reg [15:0] golden_data[`NUM_GOLDEN_DATA];
    integer i;
    integer error;
    integer diff;

    AudDSP dsp (
        .i_rst_n             (i_rst_n),
        .i_clk               (i_clk),
        .i_start             (i_start),
        // start signal, sent by the controller, not a button press
        .i_pause             (i_pause),
        // pause signal, press to pause, press again to resume
        .i_speed             (i_speed),
        .i_is_slow           (i_is_slow),
        .i_slow_mode         (i_slow_mode),
        .i_daclrck           (i_daclrck),
        // prepare data when low
        .i_sram_data         (i_sram_data),
        .i_sram_stop_addr    (i_sram_stop_addr),
        // the last address to read from SRAM
        .o_dac_data          (o_dac_data),
        .o_en                (o_en),
        // enable signal for AudPlayer, !i_daclrck
        .o_sram_addr         (o_sram_addr)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end
    
    task load_mem_data;
        input string file_name;
        input integer fp;
        output reg [15:0] data_array[`NUM_MEM_DATA]; // 假設數據是16位寬度
        integer status;
        begin
            fp = $fopen(file_name, "rb");
            if (fp == 0) begin
                $display("Error: Could not open data file.");
                $finish;
            end
            for (integer i = 0; i < `NUM_MEM_DATA; i = i + 1) begin
                status = $fscanf(fp, "%b\n", data_array[i]);
            end
            $fclose(fp);
        end
    endtask

    task load_golden_data;
        input string file_name;
        input integer fp;
        output reg [15:0] data_array[`NUM_GOLDEN_DATA]; // 假設數據是16位寬度
        integer status;
        begin
            fp = $fopen(file_name, "rb");
            if (fp == 0) begin
                $display("Error: Could not open golden data file.");
                $finish;
            end
            for (integer i = 0; i < `NUM_GOLDEN_DATA; i = i + 1) begin
                status = $fscanf(fp, "%b\n", data_array[i]);
            end
            $fclose(fp);
        end
    endtask

    initial begin
        i_rst_n = 1'b1;
        i_start = 1'b0;
        i_pause = 1'b0;
        i_speed = `SPEED - 1;
        i_is_slow = `IS_SLOW;
        i_slow_mode = `SLOW_MODE;
        i_daclrck = 1'b0;
        i_sram_data = 16'h0000;
        i_sram_stop_addr = 20'hfffff;

        error = 0;
        diff = 0;
        
        // 加載記憶體數據
        load_mem_data(`MEMFILE, fp_mem, mem_data);
        
        // 加載 golden 數據
        load_golden_data(`GOLDENFILE, fp_golden, golden_data);

        // Reset sequence
        #(`CYCLE * 2.5) i_rst_n = 1'b0;
        #(`CYCLE * 3) i_rst_n = 1'b1;
        #(`CYCLE * 1) i_start = 1'b1;
        #(`CYCLE * 2) i_start = 1'b0;
        #(`CYCLE * 2) i_pause = 1'b1;
        #(`CYCLE * 1) i_pause = 1'b0;

        @(posedge i_clk) i_daclrck = 1'b1;
        // repeat (100) begin
        //     #(`CYCLE * 20) i_daclrck = 1'b0;
        //     #(`CYCLE * 20) i_daclrck = 1'b1;
        // end
        for (i = 0; i < `SIM_CYCLES; i = i + 1) begin
            i_sram_data = mem_data[o_sram_addr];
            #(`CYCLE * 20);
            i_daclrck = 1'b0;
            diff = o_dac_data - golden_data[i];
            if(o_en) begin
                if(diff < -1 || diff > 1) begin
                    // ignore diff = 1 or -1, we can accept this error
                    $display("Diff bigger than 1: Mismatch at case %d", i);
                    $display("Golden: %16b", golden_data[i]);
                    $display("Output: %16b", o_dac_data);
                    $display("");
                    error = error + 1;
                end
            end
            #(`CYCLE * 20);
            i_daclrck = 1'b1;
        end

        if (error == 0) begin
            // display_graph_pass;
            $display("==========================================");
            $display("======  Congratulations! You Pass!  ======");
            $display("==========================================");
        end else begin
            // display_graph_fail;
            $display("===============================");
            $display("There are %0d errors.", error);
            $display("===============================");
        end
        

        $finish;
    end

    initial begin
        $fsdbDumpfile("tb_AudDSP.fsdb");
        $fsdbDumpvars;
    end
    // initial #(`CYCLE*10000000) $finish;
endmodule