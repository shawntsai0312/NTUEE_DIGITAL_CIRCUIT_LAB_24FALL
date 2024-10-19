// Digital Circuit Lab Fall 2020
// Testbench for AudPlayer.sv

`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0
//`define INFILE "in.pattern"
//`define OUTFILE "out_golden.pattern"

module tb;
    integer fp_i, fp_o;
    logic [15:0] data_base1;
    logic        data_base2;
    logic clock, stop, check;
    integer error, num, i;
    parameter pattern_num = 4;

    logic rst, daclrck, enable;
    logic [15:0] dac_data;
    logic o_aud_dacdat;

    //clock
    initial begin
        clock = 1'b1;
    end
    always begin #(`HCYCLE) clock = ~clock;
    end

    //DUT
    AudPlayer player(
        .i_rst_n      (rst),
        .i_bclk       (clock),
        .i_daclrck    (daclrck),
        .i_en         (enable),
        .i_dac_data   (dac_data),
        .o_aud_dacdat (o_aud_dacdat)
    );

    //Read file
    initial begin
        //$readmemh(`INFILE,  data_base1);
        //$readmemh(`OUTFILE, data_base2);
        //fp_i  = $fopen("in.pattern", "rb");
        //fp_o  = $fopen("out_golden.pattern", "rb"); 
        error = 0;
        stop  = 1'b0;
        i     = 1;
        #(`CYCLE * (44 * pattern_num + 10)) stop = 1'b1;
    end

    //Test
    initial begin
        rst = 1'b1; check = 1'b0; enable = 1'b0; daclrck = 1'b1;
        #(`CYCLE * 2.5) rst = 1'b0;
        #(`CYCLE * 3) rst = 1'b1;

        #(`CYCLE * 2.5) enable = 1'b1;
        #(`CYCLE * 2) daclrck = 1'b0;
        dac_data = 16'b1011101000001110;
        #(`CYCLE * 1) check = 1'b1;
        #(`CYCLE * 16) check = 1'b0;
        #(`CYCLE * 3) daclrck = 1'b1; 
        #(`CYCLE * 20) enable = 1'b0;

        #(`CYCLE * 2) enable = 1'b1;
        #(`CYCLE * 2) daclrck = 1'b0;
        dac_data = 16'b0101111000111010;
        #(`CYCLE * 1) check = 1'b1;
        #(`CYCLE * 16) check = 1'b0;
        #(`CYCLE * 3) daclrck = 1'b1; 
        #(`CYCLE * 20) enable = 1'b0;

        #(`CYCLE * 2) enable = 1'b1;
        #(`CYCLE * 2) daclrck = 1'b0;
        dac_data = 16'b1110101000011001;
        #(`CYCLE * 1) check = 1'b1;
        #(`CYCLE * 16) check = 1'b0;
        #(`CYCLE * 3) daclrck = 1'b1; 
        #(`CYCLE * 20) enable = 1'b0;

        #(`CYCLE * 2) enable = 1'b1;
        #(`CYCLE * 2) daclrck = 1'b0;
        dac_data = 16'b1111100000010101;
        #(`CYCLE * 1) check = 1'b1;
        #(`CYCLE * 16) check = 1'b0;
        #(`CYCLE * 3) daclrck = 1'b1; 
        #(`CYCLE * 20) enable = 1'b0;

        /*for(num = 0; num < pattern_num; num = num + 1) begin
            //$fread(data_base1, fp_i);
            #(`CYCLE * 2) enable = 1'b1;
            #(`CYCLE * 2) daclrck = 1'b0;
            dac_data = data_base1;
            #(`CYCLE * 1) check = 1'b1;
            #(`CYCLE * 16) check = 1'b0;
            #(`CYCLE * 3) daclrck = 1'b1; 
            #(`CYCLE * 20) enable = 1'b0; 
        end*/
    end

    //Check
    initial begin
        #(`CYCLE * 6)

        #(`CYCLE * 5) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 24)

        #(`CYCLE * 5) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 24)

        #(`CYCLE * 5) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 24)

        #(`CYCLE * 5) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
        #(`CYCLE * 1) data_base2 = 0;
        #(`CYCLE * 1) data_base2 = 1;
    end

    always@(negedge clock) begin
        if(check) begin
            i <= i + 1;
            //$fread(data_base2, fp_o);
            if(o_aud_dacdat !== data_base2) begin
                error <= error + 1;
                $display("time = %d", $time);
                $display("An ERROR occurs at no.%d pattern: player_out %b != answer %b.\n", i, o_aud_dacdat, data_base2);
            end
        end
        /*else begin
            i <= i;
        end*/
    end

    initial begin
        @(posedge stop) begin
            if(error == 0) begin
                $display("==========================================\n");
				$display("======  Congratulation! You Pass!  =======\n");
				$display("==========================================\n");
            end
            else begin
                $display("===============================\n");
				$display("There are %d errors.", error);
				$display("===============================\n");
            end
            $finish;
        end
    end

    //Dumping waveform files
    initial begin
        $fsdbDumpfile("AudPlayer.fsdb");
        $fsdbDumpvars;
    end

endmodule