module Random (
	input        i_clk,
	input        i_rst_n,
	output [3:0] o_random_out // random from 0 to 15
);

// please check out the working example in lab1 README (or Top_exmaple.sv) first

// ===== States =====
parameter S_IDLE   = 3'd0;
parameter S_FAST   = 3'd1;

logic [15:0] SEED_r, SEED_w;

// ===== Registers & Wires =====
logic [2:0] state_r, state_w;
logic [15:0] lfsr_r, lfsr_w; // taps = 15, 14, 12, 3

// ===== Output Assignments =====
assign o_random_out = lfsr_r;

// ===== Combinational Circuits =====

// state transition
always @(*) begin
	state_w = state_r;

	case(state_r)
        S_IDLE: begin	  
            state_w = S_FAST;
        end
	endcase
end

// SEED transition
always @(*) begin
	SEED_w = (SEED_r == 16'b0)? 16'b1000_0000_0000_0000 : SEED_r + 1;
end

// lfsr transition
// taps = 15, 14, 12, 3
always @(*) begin
	lfsr_w = lfsr_r;
	case(state_r)
	S_IDLE: lfsr_w = SEED_r;
	default: begin
		lfsr_w[15:1] = lfsr_r[14:0];
		lfsr_w[0] = lfsr_r[15] ^ lfsr_r[14] ^ lfsr_r[12] ^ lfsr_r[3];
	end
	endcase
end

// ===== Sequential Circuits =====
always_ff @(posedge i_clk or negedge i_rst_n) begin
	// reset
	if (!i_rst_n) begin
		SEED_r         <= 16'b1000_0000_0000_0000;
		lfsr_r 		   <= SEED_w;
		state_r        <= S_IDLE;
	end
	else begin
		SEED_r         <= SEED_w;
		lfsr_r         <= lfsr_w;
		state_r        <= state_w;
	end
end

endmodule
