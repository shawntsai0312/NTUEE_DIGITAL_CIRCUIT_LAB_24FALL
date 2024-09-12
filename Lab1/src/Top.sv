module Top (
	input        i_clk,
	input        i_rst_n,	// key 1
	input        i_start,	// key 0
	input        i_stop,	// key 2
	input		 i_show,	// key 3
	output [3:0] o_random_out
);

// please check out the working example in lab1 README (or Top_exmaple.sv) first

// ===== States =====
parameter S_IDLE   = 3'd0;
parameter S_FAST   = 3'd1;
parameter S_MEDIUM = 3'd2;
parameter S_SLOW   = 3'd3;
parameter S_DONE   = 3'd4;
parameter S_SHOW   = 3'd5;

parameter SEED = 16'b1001_0001_1001_0000;

// modify when uploading to FPGA, clock is 50MHz
parameter S_FAST_PERIOD   = 8'd255;
parameter S_MEDIUM_PERIOD = 8'd255;
parameter S_SLOW_PERIOD   = 8'd255;
parameter S_SHOW_PERIOD   = 8'd15;

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic [2:0] state_r, state_w;
logic [15:0] lfsr_r, lfsr_w; // taps = 15, 14, 12, 3
logic [7:0] counter_r, counter_w;
logic [3:0] lastResult_r, lastResult_w;

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====

// state transition
always_comb begin
	state_w = state_r;

	case(state_r)
	S_IDLE:	  state_w = i_start ? S_FAST : S_IDLE;
	S_FAST: begin
		if(i_stop) 	state_w = S_DONE;
		else 		state_w = (counter_r == S_FAST_PERIOD) ? S_MEDIUM : S_FAST;
	end
	S_MEDIUM: begin
		if(i_stop) 	state_w = S_DONE;
		else 		state_w = (counter_r == S_MEDIUM_PERIOD) ? S_SLOW : S_MEDIUM;
	end
	S_SLOW: begin
		if(i_stop) 	state_w = S_DONE;
		else 		state_w = (counter_r == S_SLOW_PERIOD) ? S_DONE : S_SLOW;
	end
	S_DONE:   state_w = i_show ? S_SHOW : S_DONE;
	S_SHOW:   state_w = (counter_r == S_SHOW_PERIOD) ? S_IDLE : S_SHOW;
	endcase
end

// lfsr transition
// taps = 15, 14, 12, 3
always_comb begin
	lfsr_w = lfsr_r;

	case(state_r)
	S_IDLE: lfsr_w = SEED;
	S_DONE: lfsr_w = SEED;
	default: begin
		lfsr_w[15:1] = lfsr_r[14:0];
		lfsr_w[0] = lfsr_r[15] ^ lfsr_r[14] ^ lfsr_r[12] ^ lfsr_r[3];
	end
	endcase
end

// counter transition
always_comb begin
	counter_w = counter_r;

	case(state_r)
	S_IDLE:  counter_w = 8'd0;
	S_DONE:  counter_w = 8'd0;
	default: counter_w = (counter_r == 8'd255) ? 8'd0 : counter_r + 8'd1;
	endcase
end

// lastResult transition
always_comb begin
	lastResult_w = lastResult_r;

	if(lastResult_r ==4'bzzzz) lastResult_w = 4'd0;

	case(state_r)
	S_DONE: lastResult_w = i_show ? o_random_out_r : lastResult_r;
	S_SHOW: lastResult_w = (counter_r == S_SHOW_PERIOD) ? o_random_out_r : lastResult_r;
	endcase
	if(!i_rst_n) lastResult_w = o_random_out_r;
end

// output transition
logic [8:0] temp;
always_comb begin
	o_random_out_w = o_random_out_r;
	temp = counter_r + 8'd1;
	case(state_r)
	S_FAST: begin
		if (counter == 8'd1) o_random_out_w = 4'd0;
		if (temp[0]^counter_r[0])  o_random_out_w = lfsr_r[3:0];
	end
	S_MEDIUM: 	if (temp[3]^counter_r[3])  o_random_out_w = lfsr_r[3:0];
	S_SLOW: 	if (temp[6]^counter_r[6])  o_random_out_w = lfsr_r[3:0];
	S_DONE: o_random_out_w = i_show ? lastResult_r : o_random_out_r;
	S_SHOW: o_random_out_w = (counter_r == S_SHOW_PERIOD) ? lastResult_r : o_random_out_r;
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	if (!i_rst_n) begin
		lfsr_r 		   <= SEED;
		counter_r	   <= 8'd0;
		o_random_out_r <= o_random_out_w;
		state_r        <= S_IDLE;
		lastResult_r   <= o_random_out_w;
	end
	else begin
		lfsr_r         <= lfsr_w;
		counter_r      <= counter_w;
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
		lastResult_r   <= lastResult_w;
	end
end

endmodule
