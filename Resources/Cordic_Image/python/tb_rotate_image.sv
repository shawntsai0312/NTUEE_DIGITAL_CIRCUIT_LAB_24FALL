`timescale 1ns/10ps
`define CYCLE 10.0
`define HCYCLE 5.0

`define ANG_WIDTH 9

module tb;
    reg i_clk, i_rst_n, i_start;
    reg signed [`ANG_WIDTH-1:0] i_angle;
    wire [3:0] o_encoded_pixel;
    wire o_valid;
    integer log_file;
    wire [5:0] o_H_transformed, o_V_transformed;

    CarGenerator u_CarGenerator (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_start            (i_start),
        .i_angle            (i_angle),
        .o_encoded_pixel    (o_encoded_pixel),
        .o_H_transformed    (o_H_transformed),
        .o_V_transformed    (o_V_transformed),
        .o_valid            (o_valid)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    initial begin
        i_rst_n = 1'b0;
        i_start = 1'b0;

        i_angle = 71;

        #(`CYCLE*3) i_rst_n = 1'b1;
        #(`CYCLE*3) i_start = 1'b1;
    end

    initial begin
        log_file = $fopen("rotate_results.txt", "w");
    end
    
    always @(posedge i_clk) begin
        if (o_valid) begin
            // $display("o_encoded_pixel = %4b", o_encoded_pixel);
            $fwrite(log_file, "%4b\n", o_encoded_pixel);
        end
    end

    initial begin
        $dumpfile("tb_rotate_image.vcd");
        $dumpvars;
    end

    initial begin
        #(`CYCLE*100);
        @ (negedge o_valid);
        $fclose(log_file);
        $finish;
    end
endmodule