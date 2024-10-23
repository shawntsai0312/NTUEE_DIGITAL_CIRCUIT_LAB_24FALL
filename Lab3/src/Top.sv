module Top (
	input i_rst_n, // map to key[3]
	input i_clk,
	input i_key_1, // start
	input i_key_2, // stop
	input [2:0] i_speed, // design how user can decide mode on your own
	input i_slow_mode, // design how user can decide mode on your own
	input i_is_slow, // design how user can decide mode on your own
	
	// AudDSP and SRAM
	output [19:0] o_SRAM_ADDR,
	inout  [15:0] io_SRAM_DQ,
	output        o_SRAM_WE_N,
	output        o_SRAM_CE_N, // no need to handle
	output        o_SRAM_OE_N, // no need to handle
	output        o_SRAM_LB_N, // no need to handle
	output        o_SRAM_UB_N, // no need to handle
	
	// I2C
	input  i_clk_100k,
	output o_I2C_SCLK,
	inout  io_I2C_SDAT,
	
	// AudPlayer
	input  i_AUD_ADCDAT,
	inout  i_AUD_ADCLRCK,
	inout  i_AUD_BCLK,
	inout  i_AUD_DACLRCK,
	output o_AUD_DACDAT,

	// SEVENDECODER (optional display)
	output [5:0] o_time

	// LCD (optional display)
	// input        i_clk_800k,
	// inout  [7:0] o_LCD_DATA,
	// output       o_LCD_EN,
	// output       o_LCD_RS,
	// output       o_LCD_RW,
	// output       o_LCD_ON,
	// output       o_LCD_BLON,

	// LED
	// output  [8:0] o_ledg,
	// output [17:0] o_ledr
);

	// design the FSM and states as you like
	parameter S_I2C  = 0;
	parameter S_REC  = 1;
	parameter S_PLAY = 2;

	reg [1:0] state_r, state_w;

	wire i2c_oen;
	wire i2c_done;
	reg i2c_done_r, i2c_done_w;
	wire recorder_start;
	assign recorder_start = i2c_done_r && (state_r == S_REC) && i_key_1;

	wire dsp_oen;
	wire rec_done;
	reg rec_done_r, rec_done_w;
	wire player_start;
	assign player_start = rec_done_r && (state_r == S_PLAY);

	wire [19:0] stop_address;
	logic [19:0] addr_record, addr_play;
	logic [15:0] data_record, data_play, dac_data;

	// if state_r = S_REC, then time = i_SRAM_ADDR[19:15]
	// if state_r = S_PLAY, then time = o_SRAM_ADDR[19:15]
	assign o_time = (state_r == S_REC) ? addr_record[19:15] : addr_play[19:15];
	// assign o_time = (state_r == S_REC) ? addr_record[6:2] : addr_play[6:2]; // only for tb

	assign o_SRAM_ADDR = (state_r == S_REC) ? addr_record : addr_play[19:0];
	assign io_SRAM_DQ  = (state_r == S_REC) ? data_record : 16'dz; // sram_dq as output
	assign data_play   = (state_r != S_REC) ? io_SRAM_DQ : 16'd0; // sram_dq as input
	assign o_SRAM_WE_N = (state_r == S_REC) ? 1'b0 : 1'b1;

	assign o_SRAM_CE_N = 1'b0;
	assign o_SRAM_OE_N = 1'b0;
	assign o_SRAM_LB_N = 1'b0;
	assign o_SRAM_UB_N = 1'b0;

	// below is a simple example for module division
	// you can design these as you like

	// === I2cInitializer ===
	// sequentially sent out settings to initialize WM8731 with I2C protocal
	I2cInitializer i2c(
		.i_rst_n(i_rst_n),
		.i_clk(i_clk_100k),
		.i_start(i_key_1),
		.o_finished(i2c_done),
		.o_sclk(o_I2C_SCLK),
		.io_sdat(io_I2C_SDAT),
		.o_oen(i2c_oen) // you are outputing (you are not outputing only when you are "ack"ing.)
	);

	// === AudDSP ===
	// responsible for DSP operations including fast play and slow play at different speed
	// in other words, determine which data addr to be fetch for player 
	AudDSP dsp(
		.i_rst_n(i_rst_n),
		.i_clk(i_AUD_BCLK),
		.i_start(player_start),
		.i_pause(i_key_2),
		.i_speed(i_speed), // total 3 bits, use 3 switches
		.i_is_slow(i_is_slow), // 0 for fast play, 1 for slow play, use 1 switch
		.i_slow_mode(i_slow_mode), // 0 for constant interpolation, 1 for linear interpolation, use 1 switch
		.i_daclrck(i_AUD_DACLRCK),
		.i_sram_data(data_play),
		.i_sram_stop_addr(stop_address),
		.o_dac_data(dac_data),
		.o_en(dsp_oen),
		.o_sram_addr(addr_play)
	);

	// === AudPlayer ===
	// receive data address from DSP and fetch data to sent to WM8731 with I2S protocal
	AudPlayer player(
		.i_rst_n(i_rst_n),
		.i_bclk(i_AUD_BCLK),
		.i_daclrck(i_AUD_DACLRCK),
		.i_en(dsp_oen), // enable AudPlayer only when playing audio, work with AudDSP
		.i_dac_data(dac_data),
		.o_aud_dacdat(o_AUD_DACDAT)
	);

	// === AudRecorder ===
	// receive data from WM8731 with I2S protocal and save to SRAM
	AudRecorder recorder(
		.i_rst_n(i_rst_n), 
		.i_clk(i_AUD_BCLK),
		.i_lrc(i_AUD_ADCLRCK),
		.i_start(recorder_start),
		.i_stop(i_key_2),
		.i_data(i_AUD_ADCDAT),
		.o_address(addr_record),
		.o_data(data_record),
		.o_stop_address(stop_address),
		.o_done(rec_done)
	);

	// state machine
	always @(*) begin
		state_w = state_r;
		case(state_r)
			S_I2C: begin
				if(i2c_done) state_w = S_REC;
				else         state_w = S_I2C;
			end
			S_REC: begin
				if(rec_done) state_w = S_PLAY;
				else         state_w = S_REC;
			end
			S_PLAY: state_w = S_PLAY;
		endcase
	end

	// i2c_done and rec_done logic
	always @(*) begin
		i2c_done_w = i2c_done_r;
		rec_done_w = rec_done_r;
		if(i2c_done) i2c_done_w = 1'b1;
		if(rec_done) rec_done_w = 1'b1;
	end


	always_ff @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n) begin
			state_r <= S_I2C;
			i2c_done_r <= 1'b0;
			rec_done_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			i2c_done_r <= i2c_done_w;
			rec_done_r <= rec_done_w;
		end
	end

endmodule
