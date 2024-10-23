`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0


`define MEMFILE "../../tb/Top/golden/mem.txt" // File for SRAM data
`define NUM_MEM_DATA 100
`define SIM_CYCLES 1000000

`define GOLDENFILE "../../tb/Top/golden/linear/linear_7.txt" // File for golden data
`define SPEED 7
`define IS_SLOW 1
`define SLOW_MODE 1
`define NUM_GOLDEN_DATA (`NUM_MEM_DATA * `SPEED)

// `define GOLDENFILE "../../tb/Top/golden/fast/fast_4.txt" // File for golden data
// `define SPEED 4
// `define IS_SLOW 0
// `define SLOW_MODE 1
// `define NUM_GOLDEN_DATA (`NUM_MEM_DATA / `SPEED)    

// `define GOLDENFILE "../../tb/Top/golden/constant/constant_6.txt" // File for golden data
// `define SPEED 6
// `define IS_SLOW 1
// `define SLOW_MODE 0
// `define NUM_GOLDEN_DATA (`NUM_MEM_DATA * `SPEED)

// `define GOLDENFILE "../../tb/Top/golden/normal.txt" // File for golden data
// `define SPEED 1
// `define IS_SLOW 1
// `define SLOW_MODE 0
// `define NUM_GOLDEN_DATA `NUM_MEM_DATA


module tb;
    reg i_rst_n, i_clk, i_start, i_pause;
    reg [2:0] i_speed;
    reg i_slow_mode, i_is_slow;

    reg [19:0] o_SRAM_ADDR;

    wire [15:0] io_SRAM_DQ;
    reg [15:0]  io_SRAM_DQ_drive;
    reg o_SRAM_WE_N, o_SRAM_CE_N, o_SRAM_OE_N, o_SRAM_LB_N, o_SRAM_UB_N;
    assign io_SRAM_DQ = o_SRAM_WE_N ? io_SRAM_DQ_drive : 16'hzzzz;

    

    reg o_I2C_SCLK;

    wire io_I2C_SDAT;
    reg io_I2C_SDAT_drive;
    assign io_I2C_SDAT = io_I2C_SDAT_drive;

    reg [15:0] i_AUD_ADCDAT;
    wire io_lrck;
    reg i_lrck;
    assign io_lrck = i_lrck;
    wire io_bclk;
    assign io_bclk = i_clk;
    reg o_AUD_DACDAT;

    integer fp_mem, fp_golden;
    // logic [15:0] mem_data [0:`NUM_MEM_DATA-1];
    // logic [15:0] golden_data [0:`NUM_GOLDEN_DATA-1];
    reg [15:0] mem_data[`NUM_MEM_DATA];
    reg [15:0] golden_data[`NUM_GOLDEN_DATA];
    integer error;
    integer diff;


    Top u_Top (
        .i_rst_n          (i_rst_n),
	    .i_clk            (i_clk),
	    .i_key_1          (i_start),
	    .i_key_2          (i_pause),
	    .i_speed          (i_speed),
	    .i_slow_mode      (i_slow_mode),
	    .i_is_slow        (i_is_slow),
        
	    .o_SRAM_ADDR      (o_SRAM_ADDR),
        .io_SRAM_DQ       (io_SRAM_DQ),
        .o_SRAM_WE_N      (o_SRAM_WE_N),
        .o_SRAM_CE_N      (o_SRAM_CE_N),
	    .o_SRAM_OE_N      (o_SRAM_OE_N),
	    .o_SRAM_LB_N      (o_SRAM_LB_N),
	    .o_SRAM_UB_N      (o_SRAM_UB_N),

	    .i_clk_100k       (i_clk),
        .o_I2C_SCLK       (o_I2C_SCLK),
        .io_I2C_SDAT      (io_I2C_SDAT),

	    .i_AUD_ADCDAT     (i_AUD_ADCDAT),
        .i_AUD_ADCLRCK    (io_lrck),
        .i_AUD_BCLK       (io_bclk),
        .i_AUD_DACLRCK    (io_lrck),
        .o_AUD_DACDAT     (o_AUD_DACDAT)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    // lrck generation
    initial begin
        i_lrck = 1'b0;
        @ (negedge i_clk);
        repeat(100000000) begin
            #(`CYCLE * 20) i_lrck = 1'b1;
            #(`CYCLE * 20) i_lrck = 1'b0;
        end
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
        

        load_mem_data(`MEMFILE, fp_mem, mem_data);
        load_golden_data(`GOLDENFILE, fp_golden, golden_data);

        // Reset sequence
        #(`CYCLE * 2.5) i_rst_n = 1'b0;
        #(`CYCLE * 3)   i_rst_n = 1'b1;
        #(`CYCLE * 0.5) i_start = 1'b1;
        #(`CYCLE * 0.5) i_start = 1'b0;

        // wait for i2c initialization and start recording
        #(`CYCLE * 800) i_start = 1'b1;
        #(`CYCLE * 1) i_start = 1'b0;
        $display("Start recording, Time: %0d", $time);
        // Loop through test patterns
        @ (negedge i_clk);
        for (int i = 0; i < `NUM_MEM_DATA; i = i + 1) begin
            // Set input data
            @ (posedge i_lrck);
            #(`CYCLE * 1); // hold 1 cycle
            for(int j = 15; j >= 0; j = j - 1) begin
                @ (negedge i_clk);
                i_AUD_ADCDAT = mem_data[i][j];
                // if ( i == 10 && j == 8) i_stop = 1'b1; // test mid stop
            end
            #(`CYCLE * 2);
            @ (negedge i_clk);
            // if( o_data != mem_data[i] ) begin
            //     error = error + 1;
            //     $display("==========================================");
            //     $display("Test pattern %0d", i);
            //     $display("Time             : %0d", $time);
            //     $display("Golden data      : %16b", golden_data[i]);
            //     $display("Recorded data    : %16b", o_data);
            //     $display("Recorded address : %20b", o_address);
            //     $display("Stop address     : %20b", o_stop_address);
            //     $display("==========================================");
            // end
            #(`CYCLE * 2);

            if(i == 64) begin // record 65 data and pause
                i_pause = 1'b1;
                #(`CYCLE * 1) i_pause = 1'b0;
                // jump out of loop
                i = `NUM_MEM_DATA;
            end
        end
        // i_pause = 1'b1;
        // #(`CYCLE * 1) i_pause = 1'b0;
        repeat(70) @(posedge i_clk);
        // start playing
        i_pause = 1'b1;
        #(`CYCLE * 2) i_pause = 1'b0; 
        $display("Start playing, Time: %0d", $time);

        repeat(7000) @(posedge i_clk);
        // stop playing
        i_pause = 1'b1;
        #(`CYCLE * 2) i_pause = 1'b0; 
        $display("Stop playing , Time: %0d", $time);

        repeat(70) @(posedge i_clk);
        // start playing
        i_pause = 1'b1;
        #(`CYCLE * 2) i_pause = 1'b0; 
        $display("Start playing, Time: %0d", $time);
    end

    always @(o_SRAM_ADDR) begin
        io_SRAM_DQ_drive = mem_data[o_SRAM_ADDR];
    end

    initial begin
        $fsdbDumpfile("tb_AudDSP.fsdb");
        $fsdbDumpvars;
    end

    initial #(`CYCLE*10000000) $finish;
endmodule