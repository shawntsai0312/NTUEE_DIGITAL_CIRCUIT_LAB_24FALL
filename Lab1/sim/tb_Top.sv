`timescale 1us/1us

module Top_test;

parameter	cycle = 100.0;

logic 		i_clk;
logic 		i_rst_n, i_start;
logic       i_stop;
logic       i_show;
logic [3:0] o_random_out;

initial i_clk = 0;
always #(cycle/2.0) i_clk = ~i_clk;

Top top0(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_start(i_start),
	.i_stop(i_stop),
	.i_show(i_show),
	.o_random_out(o_random_out)
);

initial begin
	$fsdbDumpfile("Lab1_test.fsdb");
	$fsdbDumpvars(0, Top_test, "+all");
end

initial begin	
    i_clk 	= 0;
    i_rst_n = 1;
    i_start	= 0;
	i_stop  = 0;
	i_show  = 0;

	// new operaion for result 1
    repeat(3) @(negedge i_clk);
    i_rst_n = 0;
    @(negedge i_clk) i_rst_n = 1; 
    repeat(3) @(negedge i_clk);
    i_start = 1;
    repeat(2) @(negedge i_clk);
    i_start = 0;

	// stop for result 1
	repeat(491) @(negedge i_clk);
	i_stop = 1;
	repeat(2) @(negedge i_clk);
    i_stop = 0;

	// new operaion for result 2
	repeat(3) @(negedge i_clk);
    i_rst_n = 0;
    @(negedge i_clk) i_rst_n = 1; 
    repeat(3) @(negedge i_clk);
    i_start = 1;
    repeat(2) @(negedge i_clk);
    i_start = 0;

	// result 2
	repeat(182) @(negedge i_clk);
	i_stop = 1;
	repeat(2) @(negedge i_clk);
    i_stop = 0;

	// show result 1
	repeat(3) @(negedge i_clk);
	i_show = 1;
	repeat(50) @(negedge i_clk);
	i_show = 0;

	// new operaion for result 3
	repeat(3) @(negedge i_clk);
    i_rst_n = 0;
    @(negedge i_clk) i_rst_n = 1; 
    repeat(3) @(negedge i_clk);
    i_start = 1;
    repeat(2) @(negedge i_clk);
    i_start = 0;

	// show result 2
	repeat(1000) @(negedge i_clk);
	i_show = 1;
	repeat(50) @(negedge i_clk);
	i_show = 0;
end

initial #(cycle*10000000) $finish;

endmodule
