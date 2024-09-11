`timescale 1us/1us

module Top_test;

parameter	cycle = 100.0;

logic 		i_clk;
logic 		i_rst_n, i_start;
logic [3:0] o_random_out;

initial i_clk = 0;
always #(cycle/2.0) i_clk = ~i_clk;

Top top0(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_start(i_start),
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

	@(negedge i_clk);
	@(negedge i_clk);
	@(negedge i_clk) i_rst_n = 0;
	@(negedge i_clk) i_rst_n = 1; 


	@(negedge i_clk);
	@(negedge i_clk);
	@(negedge i_clk);
	@(negedge i_clk) i_start = 1;
	@(negedge i_clk);
	@(negedge i_clk) i_start = 0;
end

initial #(cycle*10000000) $finish;

endmodule
