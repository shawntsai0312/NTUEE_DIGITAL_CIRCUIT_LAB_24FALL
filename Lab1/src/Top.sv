module Top (
	input        i_clk,
	input        i_rst_n,	// key 1
	input        i_start,	// key 0
	output [3:0] o_random_out
);

// please check out the working example in lab1 README (or Top_exmaple.sv) first

// ===== States =====
parameter S_IDLE = 1'b0;
parameter S_PROC = 1'b1;

// ===== Output Buffers =====
logic [3:0] o_random_out_r, o_random_out_w;

// ===== Registers & Wires =====
logic state_r, state_w;

logic [15:0] lfsr_r, lfsr_w; // taps = 15, 14, 12, 3

// ===== Output Assignments =====
assign o_random_out = o_random_out_r;

// ===== Combinational Circuits =====

// state transition
always_comb begin
	state_w = state_r;

	case(state_r)
	S_IDLE: begin
		if (i_start) begin
			state_w = S_PROC;
		end
	end
	S_PROC: begin
		if (i_start) begin
			state_w = (o_random_out_r == 4'd10) ? S_IDLE : state_w;
		end
	end
	endcase
end

// lfsr transition
// taps = 15, 14, 12, 3
always_comb begin
	lfsr_w = lfsr_r;

	case(state_r)
	S_IDLE: begin
		lfsr_w = lfsr_r;
	end
	S_PROC: begin
		lfsr_w[15:1] = lfsr_r[14:0];
		lfsr_w[0] = lfsr_r[15] ^ lfsr_r[14] ^ lfsr_r[12] ^ lfsr_r[3];
	end
	endcase
end

// output transition
always_comb begin
	o_random_out_w = o_random_out_r;

	case(state_r)
	S_IDLE: begin
		o_random_out_w = 4'd0;
	end
	S_PROC: begin
		o_random_out_w = lfsr_r[3:0];
	end
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	if (!i_rst_n) begin
		lfsr_r 		   <= 16'd1000_0000_0000_0000;
		o_random_out_r <= 4'd0;
		state_r        <= S_IDLE;
	end
	else begin
		lfsr_r         <= lfsr_w;
		o_random_out_r <= o_random_out_w;
		state_r        <= state_w;
	end
end

endmodule
