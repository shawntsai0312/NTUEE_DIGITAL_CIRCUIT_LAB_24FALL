
module qsys (
	altpll_108m_clk,
	clk_clk,
	reset_reset_n,
	usb_0_avalon_usb_slave_address,
	usb_0_avalon_usb_slave_chipselect,
	usb_0_avalon_usb_slave_read,
	usb_0_avalon_usb_slave_write,
	usb_0_avalon_usb_slave_writedata,
	usb_0_avalon_usb_slave_readdata,
	usb_0_external_interface_INT1,
	usb_0_external_interface_DATA,
	usb_0_external_interface_RST_N,
	usb_0_external_interface_ADDR,
	usb_0_external_interface_CS_N,
	usb_0_external_interface_RD_N,
	usb_0_external_interface_WR_N,
	usb_0_external_interface_INT0,
	altpll_12m_clk,
	altpll_100k_clk,
	altpll_400k_clk);	

	output		altpll_108m_clk;
	input		clk_clk;
	input		reset_reset_n;
	input	[1:0]	usb_0_avalon_usb_slave_address;
	input		usb_0_avalon_usb_slave_chipselect;
	input		usb_0_avalon_usb_slave_read;
	input		usb_0_avalon_usb_slave_write;
	input	[15:0]	usb_0_avalon_usb_slave_writedata;
	output	[15:0]	usb_0_avalon_usb_slave_readdata;
	input		usb_0_external_interface_INT1;
	inout	[15:0]	usb_0_external_interface_DATA;
	output		usb_0_external_interface_RST_N;
	output	[1:0]	usb_0_external_interface_ADDR;
	output		usb_0_external_interface_CS_N;
	output		usb_0_external_interface_RD_N;
	output		usb_0_external_interface_WR_N;
	input		usb_0_external_interface_INT0;
	output		altpll_12m_clk;
	output		altpll_100k_clk;
	output		altpll_400k_clk;
endmodule
