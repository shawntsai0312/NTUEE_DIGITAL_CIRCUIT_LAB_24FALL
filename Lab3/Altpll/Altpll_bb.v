
module Altpll (
	clk_clk,
	reset_reset_n,
	altpll_12m_clk,
	altpll_100k_clk,
	altpll_800k_clk);	

	input		clk_clk;
	input		reset_reset_n;
	output		altpll_12m_clk;
	output		altpll_100k_clk;
	output		altpll_800k_clk;
endmodule
