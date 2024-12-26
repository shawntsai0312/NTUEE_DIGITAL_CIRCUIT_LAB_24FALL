import game_pkg::*;
import sram_pkg::*;

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

	logic key0down, key1down, key2down, key3down;
	logic clk_108m, clk_12m, clk_100k, clk_400k;

	wire [31:0] frame_counter;
	wire [31:0] timer;
	assign timer = frame_counter / 60;

	wire rst_n, rst_n_acc_sensor;
	assign rst_n = KEY[3];
	assign rst_n_acc_sensor = KEY[0];

	qsys u_qsys (
		.altpll_108m_clk                      (clk_108m),
		.altpll_12m_clk                       (clk_12m),
		.altpll_100k_clk                      (clk_100k),
		.altpll_400k_clk                      (clk_400k),
		.clk_clk                              (CLOCK_50),
		.reset_reset_n                        (rst_n),
		
		// .usb_0_avalon_usb_slave_address       (),
		// .usb_0_avalon_usb_slave_chipselect    (),
		// .usb_0_avalon_usb_slave_read          (),
		// .usb_0_avalon_usb_slave_write         (),
		// .usb_0_avalon_usb_slave_writedata     (),
		// .usb_0_avalon_usb_slave_readdata      (), // only this one is output

		// .usb_0_external_interface_INT1        (), // i don't know what this is
		// .usb_0_external_interface_DATA        (OTG_DATA),
		// .usb_0_external_interface_RST_N       (OTG_RST_N),
		// .usb_0_external_interface_ADDR        (OTG_ADDR),
		// .usb_0_external_interface_CS_N        (OTG_CS_N),
		// .usb_0_external_interface_RD_N        (OTG_RD_N),
		// .usb_0_external_interface_WR_N        (OTG_WR_N),
		// .usb_0_external_interface_INT0        (OTG_INT)
	);

	// you can decide key down settings on your own, below is just an example
	Debounce deb0(
		.i_in(KEY[0]), // Record/Pause
		.i_rst_n(KEY[3]),
		.i_clk(clk_108m),
		.o_neg(key0down) 
	);

	Debounce deb1(
		.i_in(KEY[1]), // Reset
		.i_rst_n(KEY[3]),
		.i_clk(clk_108m),
		.o_neg(key1down) 
	);

	Debounce deb2(
		.i_in(KEY[2]), // Start
		.i_rst_n(KEY[3]),
		.i_clk(clk_108m),
		.o_neg(key2down) 
	);

	assign VGA_SYNC_N  = 1'b0;
	assign VGA_BLANK_N = 1'b1;
	assign VGA_CLK = clk_108m;

	assign o_SRAM_CE_N = 1'b0;
	assign o_SRAM_OE_N = 1'b0;
	assign o_SRAM_LB_N = 1'b0;
	assign o_SRAM_UB_N = 1'b0;

	assign AUD_XCK = clk_12m;

	// wire signed [game_pkg::ANG_WIDTH-1:0] o_car1_angle, o_car2_angle;
	wire [game_pkg::VELOCITY_OUTPUT_WIDTH-1:0] car1_v_m, car2_v_m;

	wire [2:0] car1_acc, car2_acc;
	wire [2:0] car1_brake, car2_brake;
	wire signed [3:0] car1_omega, car2_omega;

	wire [2:0] car1_acc_by_ADXL, car2_acc_by_ADXL;
	wire signed [3:0] car1_omega_by_ADXL, car2_omega_by_ADXL;

	wire signed [7:0] car1_acc_value, car2_acc_value;
	wire signed [7:0] car1_brake_value, car2_brake_value;

	PaddleHandler u_PaddleHandler_car1_acc (
		.i_clk                   (clk_100k),
		.i_rst_n                 (rst_n_acc_sensor),
		.o_CS					 (GPIO[24]),
		.o_SPC					 (GPIO[18]),
		.o_SDI					 (GPIO[20]),
		.i_SDO					 (GPIO[22]),
		.i_level0_lower_bound    (45),
		.i_level1_lower_bound    (42),
		.i_level2_lower_bound    (39),
		.i_level3_lower_bound    (36),
		.i_level4_lower_bound    (33),
		.i_level5_lower_bound    (30),
		.i_level6_lower_bound    (27),
		.o_acc_value			 (car1_acc_value),
		.o_level                 (car1_acc_by_ADXL)
	);

	// PaddleHandler u_PaddleHandler_car1_brake (
	// 	.i_clk                   (clk_100k),
	// 	.i_rst_n                 (rst_n_acc_sensor),
	// 	.o_CS                    (GPIO[16]),
	// 	.o_SPC                   (GPIO[10]),
	// 	.o_SDI                   (GPIO[12]),
	// 	.i_SDO                   (GPIO[14]),
	// 	.i_level0_lower_bound    (160),
	// 	.i_level1_lower_bound    (130),
	// 	.i_level2_lower_bound    (115),
	// 	.i_level3_lower_bound    (108),
	// 	.i_level4_lower_bound    (104),
	// 	.i_level5_lower_bound    (102),
	// 	.i_level6_lower_bound    (100),
	// 	.o_acc_value			 (car1_brake_value),
	// 	.o_level                 (car1_brake)
	// );

	WheelHandler u_WheelHandler_car1_omega (
		.i_clk                   (clk_100k),
		.i_rst_n                 (rst_n_acc_sensor),
		.o_CS					 (GPIO[6]),
		.o_SPC					 (GPIO[0]),
		.o_SDI					 (GPIO[2]),
		.i_SDO					 (GPIO[4]),
		.i_level0_x_bound	 	 (30),
		.i_level1_x_bound	 	 (36),
		.i_level2_x_bound	 	 (42),
		.i_level3_x_bound	 	 (48),
		.i_level4_x_bound	 	 (54),
		.i_level5_x_bound	 	 (60),
		.o_level                 (car1_omega_by_ADXL)
	);

	PaddleHandler u_PaddleHandler_car2_acc (
		.i_clk                   (clk_100k),
		.i_rst_n                 (rst_n_acc_sensor),
		.o_CS					 (GPIO[25]),
		.o_SPC					 (GPIO[19]),
		.o_SDI					 (GPIO[21]),
		.i_SDO					 (GPIO[23]),
		// .i_level0_lower_bound    (45),
		// .i_level1_lower_bound    (42),
		// .i_level2_lower_bound    (39),
		// .i_level3_lower_bound    (36),
		// .i_level4_lower_bound    (33),
		// .i_level5_lower_bound    (30),
		// .i_level6_lower_bound    (27),
		.i_level0_lower_bound    (50),
		.i_level1_lower_bound    (46),
		.i_level2_lower_bound    (42),
		.i_level3_lower_bound    (38),
		.i_level4_lower_bound    (34),
		.i_level5_lower_bound    (30),
		.i_level6_lower_bound    (25),
		.o_acc_value			 (car2_acc_value),
		.o_level                 (car2_acc_by_ADXL)
	);

	// PaddleHandler u_PaddleHandler_car2_brake (
	// 	.i_clk                   (clk_100k),
	// 	.i_rst_n                 (rst_n_acc_sensor),
	// 	.o_CS                    (GPIO[17]),
	// 	.o_SPC                   (GPIO[11]),
	// 	.o_SDI                   (GPIO[13]),
	// 	.i_SDO                   (GPIO[15]),
	// 	.i_level0_lower_bound    (190),
	// 	.i_level1_lower_bound    (160),
	// 	.i_level2_lower_bound    (145),
	// 	.i_level3_lower_bound    (130),
	// 	.i_level4_lower_bound    (115),
	// 	.i_level5_lower_bound    (105),
	// 	.i_level6_lower_bound    (100),
	// 	.o_acc_value			 (car2_brake_value),
	// 	.o_level                 (car2_brake)
	// );

	WheelHandler u_WheelHandler_car2_omega (
		.i_clk                   (clk_100k),
		.i_rst_n                 (rst_n_acc_sensor),
		.o_CS					 (GPIO[7]),
		.o_SPC					 (GPIO[1]),
		.o_SDI					 (GPIO[3]),
		.i_SDO					 (GPIO[5]),
		.i_level0_x_bound	 	 (30),
		.i_level1_x_bound	 	 (36),
		.i_level2_x_bound	 	 (42),
		.i_level3_x_bound	 	 (48),
		.i_level4_x_bound	 	 (54),
		.i_level5_x_bound	 	 (60),
		.o_level                 (car2_omega_by_ADXL)
	);

	assign car1_acc = SW[17] ? SW[12:10] : car1_acc_by_ADXL;
	assign car1_brake = 0;
	assign car1_omega = SW[17] ? SW[16:13] : car1_omega_by_ADXL;

	assign car2_acc = SW[7] ? SW[2:0] : car2_acc_by_ADXL;
	assign car2_brake = 0;
	assign car2_omega = SW[7] ? SW[6:3] : car2_omega_by_ADXL;

	StatusDecoder u_StatusDecoder_car1 (
		.i_omega		(car1_omega_by_ADXL),
		.i_acc_value	(car1_acc_value),
		.o_omega_sign	(HEX7),
		.o_omega_abs	(HEX6),
		.o_acc_ten		(HEX5),
		.o_acc_one		(HEX4)
	);

	StatusDecoder u_StatusDecoder_car2 (
		.i_omega		(car2_omega_by_ADXL),
		.i_acc_value	(car2_acc_value),
		.o_omega_sign	(HEX3),
		.o_omega_abs	(HEX2),
		.o_acc_ten		(HEX1),
		.o_acc_one		(HEX0)
	);

	wire [2:0] game_state;
	assign LEDG[0] = (game_state == 0);
	assign LEDG[1] = (game_state == 1);
	assign LEDG[2] = (game_state == 2);
	assign LEDG[3] = (game_state == 3);
	assign LEDG[4] = (game_state == 4);

	wire car1_vibrate, car2_vibrate;
	// assign GPIO[30] = !car1_vibrate;
	// assign GPIO[31] = !car2_vibrate;
	assign GPIO[30] = !(car1_acc > 5);
	assign GPIO[31] = !(car2_acc > 5);

	wire game_start, game_restart;
	assign game_start = (SW[8] | (GPIO[34] & GPIO[35]));
	assign game_restart = SW[9];

	Main u_Main (
		.i_clk              (clk_108m),
		.i_rst_n            (rst_n),
		.i_start       		(game_start),
		.i_restart			(game_restart),
		.i_I2C_clk          (clk_100k),
		.o_I2C_sclk         (I2C_SCLK),
		.io_I2C_sdat        (I2C_SDAT),
		.i_AUD_BCLK         (AUD_BCLK),
		.i_AUD_DACLRCK      (AUD_DACLRCK),
		.o_AUD_DACDAT       (AUD_DACDAT),
		.i_car1_acc         (car1_acc),
		.i_car2_acc         (car2_acc),
		.i_car1_brake       (car1_brake),
        .i_car2_brake       (car2_brake),
		.i_car1_omega	    (car1_omega),
		.i_car2_omega	    (car2_omega),
		.o_car1_vibrate     (car1_vibrate),
		.o_car2_vibrate     (car2_vibrate),
		.o_game_state		(game_state),
		.o_car1_v_m         (car1_v_m),
		.o_car2_v_m         (car2_v_m),
		.o_SRAM_ADDR        (SRAM_ADDR),
		.io_SRAM_DQ         (SRAM_DQ),
		.o_SRAM_WE_N        (SRAM_WE_N),
		.o_H_sync           (VGA_HS),
		.o_V_sync           (VGA_VS),
		.o_RGB              ({VGA_R, VGA_G, VGA_B}),
		.o_frame_counter	(frame_counter)
	);

	// comment those are use for display
	// SevenHexDecoder seven_dec0(
	// 	.i_hex(timer),			// time
	// 	.o_seven_ten(HEX1),
	// 	.o_seven_one(HEX0)
	// );
	// assign HEX0 = '1;
	// assign HEX1 = '1;
	// assign HEX2 = '1;
	// assign HEX3 = '1;
	// assign HEX4 = '1;
	// assign HEX5 = '1;
	// assign HEX6 = '1;
	// assign HEX7 = '1;

endmodule
