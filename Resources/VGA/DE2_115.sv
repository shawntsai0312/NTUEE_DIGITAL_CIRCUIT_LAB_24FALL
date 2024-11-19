module DE2_115 (
	input CLOCK_50,
	input CLOCK2_50,
	input CLOCK3_50,
	input ENETCLK_25,
	input SMA_CLKIN,
	output SMA_CLKOUT,
	output [8:0] LEDG,
	output [17:0] LEDR,
	input [3:0] KEY,
	input [17:0] SW,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output LCD_BLON,
	inout [7:0] LCD_DATA,
	output LCD_EN,
	output LCD_ON,
	output LCD_RS,
	output LCD_RW,
	output UART_CTS,
	input UART_RTS,
	input UART_RXD,
	output UART_TXD,
	inout PS2_CLK,
	inout PS2_DAT,
	inout PS2_CLK2,
	inout PS2_DAT2,
	output SD_CLK,
	inout SD_CMD,
	inout [3:0] SD_DAT,
	input SD_WP_N,
	output [7:0] VGA_B,
	output VGA_BLANK_N,
	output VGA_CLK,
	output [7:0] VGA_G,
	output VGA_HS,
	output [7:0] VGA_R,
	output VGA_SYNC_N,
	output VGA_VS,
	input AUD_ADCDAT,
	inout AUD_ADCLRCK,
	inout AUD_BCLK,
	output AUD_DACDAT,
	inout AUD_DACLRCK,
	output AUD_XCK,
	output EEP_I2C_SCLK,
	inout EEP_I2C_SDAT,
	output I2C_SCLK,
	inout I2C_SDAT,
	output ENET0_GTX_CLK,
	input ENET0_INT_N,
	output ENET0_MDC,
	input ENET0_MDIO,
	output ENET0_RST_N,
	input ENET0_RX_CLK,
	input ENET0_RX_COL,
	input ENET0_RX_CRS,
	input [3:0] ENET0_RX_DATA,
	input ENET0_RX_DV,
	input ENET0_RX_ER,
	input ENET0_TX_CLK,
	output [3:0] ENET0_TX_DATA,
	output ENET0_TX_EN,
	output ENET0_TX_ER,
	input ENET0_LINK100,
	output ENET1_GTX_CLK,
	input ENET1_INT_N,
	output ENET1_MDC,
	input ENET1_MDIO,
	output ENET1_RST_N,
	input ENET1_RX_CLK,
	input ENET1_RX_COL,
	input ENET1_RX_CRS,
	input [3:0] ENET1_RX_DATA,
	input ENET1_RX_DV,
	input ENET1_RX_ER,
	input ENET1_TX_CLK,
	output [3:0] ENET1_TX_DATA,
	output ENET1_TX_EN,
	output ENET1_TX_ER,
	input ENET1_LINK100,
	input TD_CLK27,
	input [7:0] TD_DATA,
	input TD_HS,
	output TD_RESET_N,
	input TD_VS,
	inout [15:0] OTG_DATA,
	output [1:0] OTG_ADDR,
	output OTG_CS_N,
	output OTG_WR_N,
	output OTG_RD_N,
	input OTG_INT,
	output OTG_RST_N,
	input IRDA_RXD,
	output [12:0] DRAM_ADDR,
	output [1:0] DRAM_BA,
	output DRAM_CAS_N,
	output DRAM_CKE,
	output DRAM_CLK,
	output DRAM_CS_N,
	inout [31:0] DRAM_DQ,
	output [3:0] DRAM_DQM,
	output DRAM_RAS_N,
	output DRAM_WE_N,
	output [19:0] SRAM_ADDR,
	output SRAM_CE_N,
	inout [15:0] SRAM_DQ,
	output SRAM_LB_N,
	output SRAM_OE_N,
	output SRAM_UB_N,
	output SRAM_WE_N,
	output [22:0] FL_ADDR,
	output FL_CE_N,
	inout [7:0] FL_DQ,
	output FL_OE_N,
	output FL_RST_N,
	input FL_RY,
	output FL_WE_N,
	output FL_WP_N,
	inout [35:0] GPIO,
	input HSMC_CLKIN_P1,
	input HSMC_CLKIN_P2,
	input HSMC_CLKIN0,
	output HSMC_CLKOUT_P1,
	output HSMC_CLKOUT_P2,
	output HSMC_CLKOUT0,
	inout [3:0] HSMC_D,
	input [16:0] HSMC_RX_D_P,
	output [16:0] HSMC_TX_D_P,
	inout [6:0] EX_IO
);

wire clk_25m;

pll_25m pll0 (
	.clk_25m_clk(clk_25m),
	.clk_clk(CLOCK_50),
	.reset_reset_n(KEY[0])
);

wire H_sync, V_sync;
wire [7:0] R, G, B;
assign VGA_R = R;
assign VGA_G = G;
assign VGA_B = B;
assign VGA_HS = H_sync;
assign VGA_VS = V_sync;
assign VGA_CLK = clk_25m; 
assign VGA_BLANK_N = 1;
assign VGA_SYNC_N = 0;

vga vga0(
    .i_clk(clk_25m),
    .i_rst_n(KEY[0]),
    .o_H_sync(H_sync), 
    .o_V_sync(V_sync),
    .o_R(R), 
    .o_G(G), 
    .o_B(B)
);

// Degree Degree_0(
// 	.i_clk(CLOCK_50),
// 	.i_rst_n(KEY[0]),
// 	.i_av(av),
// 	.o_angle(angle)
// );

// always_comb begin 
// 	if(~av[7]) begin
// 		light = {av[6:0] >= 7'd120, av[6:0] >= 7'd113, av[6:0] >= 7'd106, av[6:0] >= 7'd99, av[6:0] >= 7'd92, av[6:0] >= 7'd85, av[6:0] >= 7'd78, av[6:0] >= 7'd71, av[6:0] >= 7'd64, av[6:0] >= 7'd57, av[6:0] >= 7'd50, av[6:0] >= 7'd43, av[6:0] >= 7'd36, av[6:0] >= 7'd29, av[6:0] >= 7'd22, av[6:0] >= 7'd15, av[6:0] >= 7'd8, av[6:0] >= 7'd1};
// 	end 
// 	else begin
// 		light = 0;
// 	end
// end
// // always_comb light = {10'd0, av[7:0]};

// SevenHexDecoder seven_dec0(
// 	.i_hex(angle[22:15]),
// 	.o_hex_0(HEX0),
// 	.o_hex_1(HEX1),
// 	.o_hex_2(HEX2),
// 	.o_hex_3(HEX3),
// 	.o_hex_4(HEX4),
// 	.o_hex_5(HEX5),
// 	.o_hex_6(HEX6),
// 	.o_hex_7(HEX7)
// );


// logic keydown;
// logic [3:0] random_value;

// Debounce deb0(
// 	.i_in(KEY[0]),
// 	.i_rst_n(KEY[1]),
// 	.i_clk(CLOCK_50),
// 	.o_neg(keydown)
// );


// SevenHexDecoder seven_dec0(
// 	.i_hex(random_value),
// 	.o_seven_ten(HEX1),
// 	.o_seven_one(HEX0)
// );

// assign HEX2 = '1;
// assign HEX3 = '1;
// assign HEX4 = '1;
// assign HEX5 = '1;
// assign HEX6 = '1;
// assign HEX7 = '1;


endmodule
