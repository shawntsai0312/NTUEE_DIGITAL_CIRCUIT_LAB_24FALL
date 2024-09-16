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

logic [15:0] SEED_r, SEED_w;
// modify when uploading to FPGA, clock is 50MHz, clock period is 20ns
parameter COUNTER_BITS = 26;
parameter COUNTER_LOWER = 26'b0;
parameter COUNTER_INC = 26'b1;

parameter S_PROCESS_PERIOD = 26'b10_0000_0000_0000_0000_0000_0000;
parameter S_SHOW_PERIOD   = 26'b01_0000_0000_0000_0000_0000_0000;


// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic [2:0] state_r, state_w;
logic [15:0] lfsr_r, lfsr_w; // taps = 15, 14, 12, 3
logic [COUNTER_BITS-1:0] counter_r, counter_w;
logic [3:0] lastResult_r, lastResult_w;

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====

// state transition
always_comb begin
	state_w = state_r;

	case(state_r)
	S_IDLE: begin	  
		state_w = i_start ? S_FAST : S_IDLE;
			end
	S_FAST: begin
		if(i_stop) 	state_w = S_DONE;
		else 		state_w = (counter_r == S_PROCESS_PERIOD) ? S_MEDIUM : S_FAST;
	end
	S_MEDIUM: begin
		if(i_stop) 	state_w = S_DONE;
		else 		state_w = (counter_r == S_PROCESS_PERIOD) ? S_SLOW : S_MEDIUM;
	end
	S_SLOW: begin
		if(i_stop) 	state_w = S_DONE;
		else 		state_w = (counter_r == S_PROCESS_PERIOD) ? S_DONE : S_SLOW;
	end
	S_DONE: begin
		if(i_start) state_w = S_FAST;
		else		state_w = i_show ? S_SHOW : S_DONE;
	end
	S_SHOW:   state_w = (counter_r == S_SHOW_PERIOD) ? S_DONE : S_SHOW;
	endcase
end

// SEED transition
always_comb begin
	// SEED_w = SEED_r;
	// case(state_r)
	// S_IDLE: SEED_w = (SEED_r == 16'b0)? 16'b1000_0000_0000_0000 : SEED_r + 1;
	// default: SEED_w = SEED_r;
	// endcase
	SEED_w = (SEED_r == 16'b0)? 16'b1000_0000_0000_0000 : SEED_r + 1;
end

// lfsr transition
// taps = 15, 14, 12, 3
always_comb begin
	lfsr_w = lfsr_r;

	case(state_r)
	S_IDLE: lfsr_w = SEED_r;
	S_DONE: lfsr_w = SEED_r;
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
	S_IDLE:  counter_w = COUNTER_LOWER;
	S_DONE:  counter_w = COUNTER_LOWER;
	default: counter_w = (counter_r == S_PROCESS_PERIOD) ? COUNTER_LOWER : counter_r + COUNTER_INC;
	endcase
end

// lastResult transition
always_comb begin
	lastResult_w = lastResult_r;
	case(state_r)
	S_DONE: begin
		if(i_start) lastResult_w = o_random_out_r;
		else		lastResult_w = i_show ? o_random_out_r : lastResult_r;
	end
	S_SHOW: lastResult_w = (counter_r == S_SHOW_PERIOD) ? o_random_out_r : lastResult_r;
	endcase
end

// output transition
logic [COUNTER_BITS-1:0] temp;
always_comb begin
	o_random_out_w = o_random_out_r;
	temp = counter_r + COUNTER_INC;
	case(state_r)
	S_IDLE: o_random_out_w = o_random_out_r +1;
	S_FAST: 	if (temp[19]^counter_r[19])  o_random_out_w = lfsr_r[3:0];
	S_MEDIUM: 	if (temp[21]^counter_r[21])  o_random_out_w = lfsr_r[3:0];
	S_SLOW: 	if (temp[23]^counter_r[23])  o_random_out_w = lfsr_r[3:0];
	S_DONE: o_random_out_w = i_show ? lastResult_r : o_random_out_r;
	S_SHOW: o_random_out_w = (counter_r == S_SHOW_PERIOD) ? lastResult_r : o_random_out_r;
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	if (!i_rst_n) begin
		SEED_r         <= 16'b1000_0000_0000_0000;
		lfsr_r 		   <= SEED_w;
		counter_r	   <= COUNTER_LOWER;
		o_random_out_r <= 4'd0;
		state_r        <= S_IDLE;
		lastResult_r   <= 4'd0;
	end
	else begin
		SEED_r         <= SEED_w;
		lfsr_r         <= lfsr_w;
		counter_r      <= counter_w;
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
		lastResult_r   <= lastResult_w;
	end
end

endmodule
