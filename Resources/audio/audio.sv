module Audio (
	input i_clk,
	input i_rst_n,
	
	// SDRAM
	
	// I2C
	input  i_clk_100k,
	output o_I2C_SCLK,
	inout  io_I2C_SDAT,
	
	// AudPlayer
	inout  i_AUD_BCLK,
	inout  i_AUD_DACLRCK,
	output o_AUD_DACDAT,
);

	// design the FSM and states as you like
	parameter S_I2C  = 0;
	parameter S_PLAY = 1;

	reg [1:0] state_r, state_w;

	wire i2c_oen;
	wire i2c_done;
	reg i2c_done_r, i2c_done_w;

	wire dsp_oen;
	wire player_start;
	assign player_start = i2c_done_r && (state_r == S_PLAY);

	wire [19:0] stop_address;
	logic [19:0] addr_play;
	logic [15:0] data_play, dac_data;

	// if state_r = S_REC, then time = i_SRAM_ADDR[19:15]
	// if state_r = S_PLAY, then time = o_SRAM_ADDR[19:15]
	assign o_time = (state_r == S_REC) ? addr_record[19:15] : addr_play[19:15];
	// assign o_time = (state_r == S_REC) ? addr_record[6:2] : addr_play[6:2]; // only for tb

	// assign o_SRAM_ADDR = (state_r == S_REC) ? addr_record : addr_play[19:0];
	// assign io_SRAM_DQ  = (state_r == S_REC) ? data_record : 16'dz; // sram_dq as output
	// assign data_play   = (state_r != S_REC) ? io_SRAM_DQ : 16'd0; // sram_dq as input
	// assign o_SRAM_WE_N = (state_r == S_REC) ? 1'b0 : 1'b1;

	// assign o_SRAM_CE_N = 1'b0;
	// assign o_SRAM_OE_N = 1'b0;
	// assign o_SRAM_LB_N = 1'b0;
	// assign o_SRAM_UB_N = 1'b0;

	// below is a simple example for module division
	// you can design these as you like

	reg i2c_start_r, i2c_start_w;
	reg dsp_start_r, dsp_start_w;
	

	always @(*) begin
		i2c_start_w = i2c_start_r;
		dsp_start_w = dsp_start_r;
		if(i2c_done_r) i2c_start_w = 1'b0;
		if(player_start) dsp_start_w = 1'b1;
	end

	wire is_player_pause;

	// === I2cInitializer ===
	// sequentially sent out settings to initialize WM8731 with I2C protocal
	AudioInitializer i2c(
		.i_rst_n(i_rst_n),
		.i_clk(i_clk_100k),
		.i_start(i2c_start_r),
		.o_finished(i2c_done),
		.o_sclk(o_I2C_SCLK),
		.io_sdat(io_I2C_SDAT),
		.o_oen(i2c_oen) // you are outputing (you are not outputing only when you are "ack"ing.)
	);

	// === AudDSP ===
	// responsible for DSP operations including fast play and slow play at different speed
	// in other words, determine which data addr to be fetch for player 
	AudioDSP dsp(
		.i_rst_n(i_rst_n),
		.i_clk(i_AUD_BCLK),
		.i_start(dsp_start_r),
		.i_pause(i_key_2),
		.i_speed(i_speed), // total 3 bits, use 3 switches
		.i_is_slow(i_is_slow), // 0 for fast play, 1 for slow play, use 1 switch
		.i_slow_mode(i_slow_mode), // 0 for constant interpolation, 1 for linear interpolation, use 1 switch
		.i_daclrck(i_AUD_DACLRCK),
		.i_sram_data(data_play),
		.i_sram_stop_addr(stop_address),
		.o_dac_data(dac_data),
		.o_en(dsp_oen),
		.o_is_pause(is_player_pause),
		.o_sram_addr(addr_play)
	);

	// === AudPlayer ===
	// receive data address from DSP and fetch data to sent to WM8731 with I2S protocal
	AudioPlayer player(
		.i_rst_n(i_rst_n),
		.i_bclk(i_AUD_BCLK),
		.i_daclrck(i_AUD_DACLRCK),
		.i_en(dsp_oen), // enable AudPlayer only when playing audio, work with AudDSP
		.i_dac_data(dac_data),
		.o_aud_dacdat(o_AUD_DACDAT)
	);

	// state machine
	always @(*) begin
		state_w = state_r;
		case(state_r)
			S_I2C: begin
				if(i2c_done) state_w = S_PLAY;
				else         state_w = S_I2C;
			end
			S_PLAY: state_w = S_PLAY;
		endcase
	end

	// i2c_done and logic
	always @(*) begin
		i2c_done_w = i2c_done_r;
		if(i2c_done) i2c_done_w = 1'b1;
	end


	always_ff @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n) begin
			state_r <= S_I2C;
			i2c_done_r <= 1'b0;

			i2c_start_r <= 1'b1;
			dsp_start_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			i2c_done_r <= i2c_done_w;

			i2c_start_r <= i2c_start_w;
			dsp_start_r <= dsp_start_w;
		end
	end

endmodule
