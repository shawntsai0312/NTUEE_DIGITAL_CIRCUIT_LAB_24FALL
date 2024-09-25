module Rsa256Core (
	input          i_clk,
	input          i_rst,
	input          i_start,
	input  [255:0] i_a, // cipher text y
	input  [255:0] i_d, // private key
	input  [255:0] i_n,
	output [255:0] o_a_pow_d, // plain text x
	output         o_finished
	);

	// operations for RSA256 decryption
	// namely, the Montgomery algorithm

	parameter S_IDLE = 2'd0;
	parameter S_PREP = 2'd1;
	parameter S_MONT = 2'd2;
	parameter S_CALC = 2'd3;

	logic [1:0] state_r, state_w;
	logic [255:0] o_a_pow_d_r, o_a_pow_d_w;
	
	logic o_finished_r, o_finished_w;

	assign o_a_pow_d = o_a_pow_d_r;
	assign o_finished = 0;

	RsaPrep prep(
		.i_clk(i_clk),
		.i_rst(i_rst),
		.i_start(i_start),
		.i_a(i_a),
		.i_n(i_n),
		.o_result(o_a_pow_d_r),
		.o_finished(o_finished_r)
	);

	/*-------------------------------------------- RSA montgomery algorithm tester --------------------------------------------*/
	wire [255:0] test_a, test_b, test_n;
	assign test_a = 256'hee3ca49fc758f320488c88d171560086a2d558079716b6a0bda315be47e025ba;
	assign test_b = 256'hf91444d973e52a870d8900fa5648d11bda75686b4d15c6db0b8458d5d7d050d7;
	assign test_n = 256'hc81f20fc0fe23f89dcf7296bbca44b3380ed1679ce2ad6477b5572929eff1324;

	logic [255:0] test_result;
	logic test_finished;
	RsaMont mont(
		.i_clk(i_clk),
		.i_rst(i_rst),
		.i_start(i_start),
		.i_a(test_a),
		.i_b(test_b),
		.i_n(test_n),
		.o_result(test_result),
		.o_finished(test_finished)
	);
	/*-------------------------------------------- RSA montgomery algorithm tester --------------------------------------------*/

	// sequential logic
	always_ff @(posedge i_clk or negedge i_rst) begin
		if(i_rst) begin
			state_r <= S_IDLE;
			// o_a_pow_d_r <= 256'd0;
			// o_finished_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			// o_a_pow_d_r <= o_a_pow_d_w;
			// o_finished_r <= o_finished_w;
		end
	end
endmodule

module RsaPrep (
	input          i_clk,
	input          i_rst,
	input          i_start,
	input  [255:0] i_a,
	input  [255:0] i_n,
	output [255:0] o_result,
	output         o_finished
	);

	// do a * 2^(256) mod n

	parameter S_IDLE = 2'd0;
	parameter S_CALC = 2'd1;
	parameter S_DONE = 2'd2;

	logic [1:0] state_r, state_w;
	logic [7:0] counter_r, counter_w;

	logic [255:0] a_r, a_w;
	logic o_finished_r, o_finished_w;

	assign o_result = a_r;
	assign o_finished = o_finished_r;

	// state transition
	always_comb begin
		state_w = state_r;
		case(state_r)
			S_IDLE: if(i_start) state_w = S_CALC;
			S_CALC: if(counter_r == 255) state_w =S_DONE;
			S_DONE: state_w = S_IDLE;
		endcase
	end

	// counter logic
	always_comb begin
		counter_w = counter_r;
		case(state_r)
			S_CALC:  counter_w = counter_r + 1;
			default: counter_w = 0;
		endcase
	end

	// modulo logic
	// assume i_a < i_n
	logic [256:0] a_leftshift_1;
	always_comb begin
		a_w[255:0] = a_r[255:0];
		a_leftshift_1 = a_r << 1;
		case(state_r)
			S_IDLE: if(i_start) a_w[255:0] = i_a[255:0];
			S_CALC: begin
				if(a_leftshift_1 > i_n) a_w[255:0] = a_leftshift_1[256:0] - i_n[255:0];
				else 					a_w[255:0] = a_leftshift_1[255:0];
			end
		endcase
	end

	// output logic
	always_comb begin
		o_finished_w = 1'b0;
		case(state_r)
			S_CALC: if(counter_r == 255) o_finished_w = 1'b1;
		endcase
	end

	// sequential logic
	always_ff @(posedge i_clk or negedge i_rst) begin
		if(i_rst) begin
			state_r <= S_IDLE;
			counter_r <= 8'd0;
			a_r <= 256'd0;
			o_finished_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			counter_r <= counter_w;
			a_r <= a_w;
			o_finished_r <= o_finished_w;
		end
	end
endmodule

module RsaMont (
	input          i_clk,
	input          i_rst,
	input          i_start,
	input  [255:0] i_a,
	input  [255:0] i_b,
	input  [255:0] i_n,
	output [255:0] o_result,
	output         o_finished
	);

	// do a * b * 2^(-256) mod n

	parameter S_IDLE = 2'd0;
	parameter S_CALC = 2'd1;
	parameter S_DONE = 2'd3;

	logic [1:0] state_r, state_w;
	logic [7:0] counter_r, counter_w;

	logic [255:0] a_r, a_w;

	logic [256:0] o_result_r, o_result_w; // prevent overflow when caculating, but just output 256 bits
	logic o_finished_r, o_finished_w;

	assign o_result = o_result_r[255:0];
	assign o_finished = o_finished_r;

	// state transition
	always_comb begin
		state_w = state_r;
		case(state_r)
			S_IDLE: if(i_start) state_w = S_CALC;
			S_CALC: if(counter_r == 255) state_w =S_DONE;
			S_DONE: state_w = S_IDLE;
		endcase
	end

	// counter logic
	always_comb begin
		counter_w = counter_r;
		case(state_r)
			S_CALC:  counter_w = counter_r + 1;
			default: counter_w = 0;
		endcase
	end

	// a_r logic
	always_comb begin
		a_w = a_r;
		case(state_r)
			S_IDLE: if(i_start) a_w = i_a;
			S_CALC: a_w = (a_r >> 1);
		endcase
	end

	// modulo logic
	logic [257:0] temp1;
	logic [257:0] temp2;
	logic [256:0] temp3;
	always_comb begin
		o_result_w = o_result_r;
		case(state_r)
			S_CALC: begin
				if(a_r[0])	temp1 = o_result_r + i_b; // temp1 at most 258 bits since o_result_r + i_b at most 257 bits
				else		temp1 = o_result_r;

				if(temp1[0])	temp2 = temp1 + i_n; // temp2 at most 258 bits since temp1 + i_n at most 257 bits
				else			temp2 = temp1;

				temp3 = temp2 >> 1; // temp3 at most 257 bits since temp2 >> 1 at most 256 bits

				if(counter_r == 255) begin
					if(temp3 >= i_n)	o_result_w = temp3 - i_n;
					else 				o_result_w = temp3;
				end
				else o_result_w = temp3;
			end
		endcase
	end

	// output logic
	always_comb begin
		o_finished_w = 1'b0;
		case(state_r)
			S_CALC: if(counter_r == 255) o_finished_w = 1'b1;
		endcase
	end

	// sequential logic
	always_ff @(posedge i_clk or negedge i_rst) begin
		if(i_rst) begin
			state_r <= S_IDLE;
			counter_r <= 8'd0;
			a_r <= 256'd0;
			o_result_r <= 257'd0;
			o_finished_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			counter_r <= counter_w;
			a_r <= a_w;
			o_result_r <= o_result_w;
			o_finished_r <= o_finished_w;
		end
	end
endmodule
