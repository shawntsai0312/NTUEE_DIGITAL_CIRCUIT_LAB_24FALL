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

/*-------------------------------------------- submodule RsaMont tester --------------------------------------------*/
	// wire [255:0] test_a, test_b, test_n;
	// assign test_a = 256'hee3ca49fc758f320488c88d171560086a2d558079716b6a0bda315be47e025ba;
	// assign test_b = 256'hf91444d973e52a870d8900fa5648d11bda75686b4d15c6db0b8458d5d7d050d7;
	// assign test_n = 256'hc81f20fc0fe23f89dcf7296bbca44b3380ed1679ce2ad6477b5572929eff1324;

	// logic [255:0] test_result;
	// logic test_finished;
	// RsaMont mont(
	// 	.i_clk(i_clk),
	// 	.i_rst(i_rst),
	// 	.i_start(i_start),
	// 	.i_a(test_a),
	// 	.i_b(test_b),
	// 	.i_n(test_n),
	// 	.o_result(test_result),
	// 	.o_finished(test_finished)
	// );
/*-------------------------------------------- submodule RsaMont tester --------------------------------------------*/

	// operations for RSA256 decryption
	// namely, the Montgomery algorithm

	// parameters
	parameter S_IDLE = 2'd0;
	parameter S_PREP = 2'd1;
	parameter S_MONT = 2'd2;
	parameter S_CALC = 2'd3;

	// registers
	reg [1:0] state_r, state_w;
	reg [8:0] counter_r, counter_w; // 0 to 256

	reg mont_start_r, mont_start_w;	// mont_start_r used on both mont_Nmt and mont_Ntt, they will start and finish at the same time

	reg [255:0] d_r, d_w;			// d_r[i] used to determine whether to update m

	reg [255:0] t_r, t_w;
	reg [255:0] m_r, m_w;

	reg o_finished_r, o_finished_w;
	
	// submodules
	wire [255:0] prep_result;
	wire prep_finished;
	RsaPrep prep(
		.i_clk(i_clk),
		.i_rst(i_rst),
		.i_start(i_start),
		.i_a(i_a),
		.i_n(i_n),
		.o_result(prep_result),
		.o_finished(prep_finished)
	);

	wire [255:0] mont_Nmt_result;
	wire mont_Nmt_finished;
	RsaMont mont_Nmt(
		.i_clk(i_clk),
		.i_rst(i_rst),
		.i_start(mont_start_r), // do it when d[i] == 1 in S_MONT
		.i_n(i_n),
		.i_a(m_r), // namely m in the algorithm
		.i_b(t_r), // namely t in the algorithm
		.o_result(mont_Nmt_result),
		.o_finished(mont_Nmt_finished)
	);

	wire [255:0] mont_Ntt_result;
	wire mont_Ntt_finished;
	RsaMont mont_Ntt(
		.i_clk(i_clk),
		.i_rst(i_rst),
		.i_start(mont_start_r), // do it in every cycle of S_MONT
		.i_n(i_n),
		.i_a(t_r), // namely t in the algorithm
		.i_b(t_r), // namely t in the algorithm
		.o_result(mont_Ntt_result),
		.o_finished(mont_Ntt_finished)
	);

	assign o_a_pow_d = m_r;
	assign o_finished = o_finished_r;

	// state transition
	always_comb begin
		state_w = state_r;
		case(state_r)
			// S_IDLE:  state_w = i_start ? S_PREP : S_IDLE;
			S_IDLE: begin
				if(i_start) state_w = S_PREP;
				else		state_w = S_IDLE;
			end
			// S_PREP:  state_w = prep_finished ? S_MONT : S_PREP;
			S_PREP: begin
				if(prep_finished) state_w = S_MONT;
				else			  state_w = S_PREP;
			end
			// S_MONT:  state_w = (mont_Nmt_finished && mont_Ntt_finished)? S_CALC : S_MONT;
			S_MONT: begin
				if(mont_Nmt_finished && mont_Ntt_finished)  state_w = S_CALC;
				else										state_w = S_MONT;
			end
			// S_CALC:  state_w = counter_r[8] ? S_IDLE : S_MONT;
			S_CALC: begin
				if(counter_r[8]) state_w = S_IDLE;
				else			 state_w = S_MONT;
			end
		endcase
	end

	// counter logic
	always_comb begin
		counter_w = counter_r;
		case(state_r)
			S_IDLE: counter_w = 0;
			S_CALC: counter_w = counter_r + 1;
		endcase
	end

	// mont start logic
	always_comb begin
		mont_start_w = 1'b0;
		case(state_r)
			S_PREP: mont_start_w = prep_finished;
			S_CALC: mont_start_w = 1'b1;
		endcase
	end

	// d logic
	always_comb begin
		d_w = d_r;
		case(state_r)
			S_IDLE: if(i_start) d_w = i_d;
			S_CALC: d_w = d_r >> 1;
		endcase
	end

	// t logic
	always_comb begin
		t_w = t_r;
		case(state_r)
			S_PREP: if(prep_finished) t_w = prep_result;
			S_MONT: if(mont_Ntt_finished) t_w = mont_Ntt_result;
		endcase
	end

	// output / m logic
	always_comb begin
		m_w = m_r;
		case(state_r)
			S_PREP: m_w = 256'd1;
			S_MONT: if(mont_Nmt_finished && d_r[0])	m_w = mont_Nmt_result;
		endcase
	end

	// output signal logic
	always_comb begin
		o_finished_w = 1'b0;
		case(state_r)
			S_CALC: if(counter_r[8]) o_finished_w = 1'b1;
		endcase
	end

	// sequential logic
	always_ff @(posedge i_clk or posedge i_rst) begin
		if(i_rst) begin
			state_r <= S_IDLE;
			counter_r <= 9'd0;
			t_r <= 256'd0;
			m_r <= 256'd1;
			d_r <= 256'd0;
			mont_start_r <= 1'b0;
			o_finished_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			counter_r <= counter_w;
			t_r <= t_w;
			m_r <= m_w;
			d_r <= d_w;
			mont_start_r <= mont_start_w;
			o_finished_r <= o_finished_w;
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

	logic [255:0] o_result_r, o_result_w;
	logic o_finished_r, o_finished_w; // namely m in the algorithm

	assign o_result = o_result_r;
	assign o_finished = o_finished_r;

	// state transition
	always_comb begin
		state_w = state_r;
		case(state_r)
			// S_IDLE:  state_w = (i_start)? 			S_CALC : S_IDLE;
			S_IDLE: begin
				if(i_start) state_w = S_CALC;
				else		state_w = S_IDLE;
			end
			// S_CALC:  state_w = (counter_r == 255)? 	S_DONE : S_CALC;
			S_CALC: begin
				if(counter_r == 255) state_w = S_DONE;
				else				 state_w = S_CALC;
			end
			S_DONE:  state_w = S_IDLE;
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

	// output logic
	// assume i_a < i_n
	logic [256:0] a_leftshift_1;
	always_comb begin
		o_result_w[255:0] = o_result_r[255:0];
		a_leftshift_1 = o_result_r << 1;
		case(state_r)
			S_IDLE: if(i_start) o_result_w[255:0] = i_a[255:0];
			S_CALC: begin
				if(a_leftshift_1 > i_n) o_result_w[255:0] = a_leftshift_1[256:0] - i_n[255:0];
				else 					o_result_w[255:0] = a_leftshift_1[255:0];
			end
		endcase
	end

	// output signal logic
	always_comb begin
		o_finished_w = 1'b0;
		case(state_r)
			S_CALC: if(counter_r == 255) o_finished_w = 1'b1;
		endcase
	end

	// sequential logic
	always_ff @(posedge i_clk or posedge i_rst) begin
		if(i_rst) begin
			state_r <= S_IDLE;
			counter_r <= 8'd0;
			o_result_r <= 256'd0;
			o_finished_r <= 1'b0;
		end
		else begin
			state_r <= state_w;
			counter_r <= counter_w;
			o_result_r <= o_result_w;
			o_finished_r <= o_finished_w;
		end
	end
endmodule

module RsaMont (
	input          i_clk,
	input          i_rst,
	input          i_start,
	input  [255:0] i_n,
	input  [255:0] i_a,
	input  [255:0] i_b,
	output [255:0] o_result,
	output         o_finished
	);

	// do a * b * 2^(-256) mod n

	parameter S_IDLE = 2'd0;
	parameter S_CALC = 2'd1;
	parameter S_DONE = 2'd3;

	logic [1:0] state_r, state_w;
	logic [7:0] counter_r, counter_w;

	logic [255:0] a_r, a_w; // in order to get the i-th bit in the i-th cycle, shift right every cycle

	logic [256:0] o_result_r, o_result_w; // namely m in the algorithm, set 257 bits to prevent overflow when caculating, but just output 256 bits
	logic o_finished_r, o_finished_w;

	assign o_result = o_result_r[255:0];
	assign o_finished = o_finished_r;

	// state transition
	always_comb begin
		state_w = state_r;
		case(state_r)
			// S_IDLE:  state_w = (i_start)? 			S_CALC : S_IDLE;
			S_IDLE: begin
				if(i_start) state_w = S_CALC;
				else		state_w = S_IDLE;
			end
			// S_CALC:  state_w = (counter_r == 255)? 	S_DONE : S_CALC;
			S_CALC: begin
				if(counter_r == 255) state_w = S_DONE;
				else				 state_w = S_CALC;
			end
			S_DONE:  state_w = S_IDLE;
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

	// output logic
	logic [257:0] temp1; // the first result of m after the first if
	logic [257:0] temp2; // the second result of m after the second if
	logic [256:0] temp3; // do the right shift
	always_comb begin
		o_result_w = o_result_r;
		if(counter_r == 0) o_result_w = 257'd0;
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

	// output signal logic
	always_comb begin
		o_finished_w = 1'b0;
		case(state_r)
			S_CALC: if(counter_r == 255) o_finished_w = 1'b1;
		endcase
	end

	// sequential logic
	always_ff @(posedge i_clk or posedge i_rst) begin
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
