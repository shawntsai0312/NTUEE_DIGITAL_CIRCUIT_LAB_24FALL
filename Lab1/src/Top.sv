module Top (
	input        i_clk,
	input        i_rst_n,	// key 1
	input        i_start,	// key 0
	output [3:0] o_random_out
);

// please check out the working example in lab1 README (or Top_exmaple.sv) first

// ===== States =====
parameter S_IDLE   = 3'd0;
parameter S_FAST   = 3'd1;
parameter S_MEDIUM = 3'd2;
parameter S_SLOW   = 3'd3;
parameter S_DONE   = 3'd4;

parameter SEED = 16'b1001_0001_0000_0000;

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic [2:0] state_r, state_w;
logic [15:0] lfsr_r, lfsr_w; // taps = 15, 14, 12, 3
logic [7:0] counter_r, counter_w;

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====

// state transition
always_comb begin
	state_w = state_r;

	case(state_r)
	S_IDLE: begin
		if (i_start) state_w = S_FAST;
		else 		 state_w = S_IDLE;
	end
	S_FAST:   state_w = (counter_r == 8'd255) ? S_MEDIUM : S_FAST;
	S_MEDIUM: state_w = (counter_r == 8'd255) ? S_SLOW : S_MEDIUM;
	S_SLOW:   state_w = (counter_r == 8'd255) ? S_DONE : S_SLOW;
	S_DONE: begin
		if (i_start) state_w = S_IDLE;
		else 		 state_w = S_DONE;
	end
	endcase
end

// lfsr transition
// taps = 15, 14, 12, 3
always_comb begin
	lfsr_w = lfsr_r;

	case(state_r)
	S_IDLE: begin
		lfsr_w = SEED;
	end
	S_DONE: begin
		lfsr_w = SEED;
	end
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
	S_IDLE: begin
		counter_w = 8'd0;
	end
	S_DONE: begin
		counter_w = 8'd0;
	end
	default: begin
		counter_w = (counter_r == 8'd255) ? 8'd0 : counter_r + 8'd1;
	end
	endcase
end

// output transition
logic [8:0] temp;
always_comb begin
	o_random_out_w = o_random_out_r;
	temp = counter_r + 8'd1;
	case(state_r)
	S_IDLE: begin
		o_random_out_w = 4'd0;
	end
	S_FAST: begin
		if (temp[0]^counter_r[0])  o_random_out_w = lfsr_r[3:0];
	end
	S_MEDIUM: begin
		if (temp[3]^counter_r[3])  o_random_out_w = lfsr_r[3:0];
	end
	S_SLOW: begin
		if (temp[6]^counter_r[6])  o_random_out_w = lfsr_r[3:0];
	end
	S_DONE: begin
		o_random_out_w = o_random_out_r;
	end
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	if (!i_rst_n) begin
		lfsr_r 		   <= SEED;
		counter_r	   <= 8'd0;
		o_random_out_r <= 4'd0;
		state_r        <= S_IDLE;
	end
	else begin
		lfsr_r         <= lfsr_w;
		counter_r      <= counter_w;
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
	end
end

endmodule
