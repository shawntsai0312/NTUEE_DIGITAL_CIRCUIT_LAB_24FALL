`timescale 1us/1us

module tb;

parameter	cycle = 10.0; // cycle = 10us, 100kHz

logic i_rst_n;
logic i_clk;
logic i_start;
logic o_finished;
logic o_sclk;
wire io_sdat;
logic o_oen;

initial i_clk = 0;
always #(cycle/2.0) i_clk = ~i_clk;

I2cInitializer i2c(
	.i_rst_n(i_rst_n),
	.i_clk(i_clk),
	.i_start(i_start),
	.o_finished(o_finished),
	.o_sclk(o_sclk),
	.io_sdat(io_sdat),
	.o_oen(o_oen) 
);


integer fp_golden; // file pointer for golden file
initial begin
	$fsdbDumpfile("tb_I2cInitializer.fsdb");
	$fsdbDumpvars(0, tb, "+all");
    // fp_golden = $fopen("../tb/I2cInitializer/golden.txt", "r"); // relative path to the golden file
    // if (fp_golden == 0) begin
    //     $display("ERROR: Could not open golden.txt file");
    //     $finish;
    // end 

	i_clk = 0;
	i_rst_n = 1;
	i_start = 0;

	repeat(3) @(negedge i_clk);
    i_rst_n = 0;
    @(negedge i_clk)
	i_rst_n = 1; 
    repeat(3) @(negedge i_clk);
    i_start = 1;
    repeat(2) @(negedge i_clk);
    i_start = 0;
end

initial #(cycle*10000000) $finish;

endmodule