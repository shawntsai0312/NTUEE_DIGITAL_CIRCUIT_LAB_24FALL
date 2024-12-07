module SevenHexDecoder (
	input        [31:0] i_hex,
	output logic [6:0] o_seven_ten,
	output logic [6:0] o_seven_one
);

/* The layout of seven segment display, 1: dark
 *    00
 *   5  1
 *    66
 *   4  2
 *    33
 */
parameter D0 = 7'b1000000;
parameter D1 = 7'b1111001;
parameter D2 = 7'b0100100;
parameter D3 = 7'b0110000;
parameter D4 = 7'b0011001;
parameter D5 = 7'b0010010;
parameter D6 = 7'b0000010;
parameter D7 = 7'b1011000;
parameter D8 = 7'b0000000;
parameter D9 = 7'b0010000;
always @(*) begin
	case(i_hex)
		32'h0: begin o_seven_ten = D0; o_seven_one = D0; end
		32'h1: begin o_seven_ten = D0; o_seven_one = D1; end
		32'h2: begin o_seven_ten = D0; o_seven_one = D2; end
		32'h3: begin o_seven_ten = D0; o_seven_one = D3; end
		32'h4: begin o_seven_ten = D0; o_seven_one = D4; end
		32'h5: begin o_seven_ten = D0; o_seven_one = D5; end
		32'h6: begin o_seven_ten = D0; o_seven_one = D6; end
		32'h7: begin o_seven_ten = D0; o_seven_one = D7; end
		32'h8: begin o_seven_ten = D0; o_seven_one = D8; end
		32'h9: begin o_seven_ten = D0; o_seven_one = D9; end
		32'ha: begin o_seven_ten = D1; o_seven_one = D0; end
		32'hb: begin o_seven_ten = D1; o_seven_one = D1; end
		32'hc: begin o_seven_ten = D1; o_seven_one = D2; end
		32'hd: begin o_seven_ten = D1; o_seven_one = D3; end
		32'he: begin o_seven_ten = D1; o_seven_one = D4; end
		32'hf: begin o_seven_ten = D1; o_seven_one = D5; end
		32'h10: begin o_seven_ten = D1; o_seven_one = D6; end
		32'h11: begin o_seven_ten = D1; o_seven_one = D7; end
		32'h12: begin o_seven_ten = D1; o_seven_one = D8; end
		32'h13: begin o_seven_ten = D1; o_seven_one = D9; end
		32'h14: begin o_seven_ten = D2; o_seven_one = D0; end
		32'h15: begin o_seven_ten = D2; o_seven_one = D1; end
		32'h16: begin o_seven_ten = D2; o_seven_one = D2; end
		32'h17: begin o_seven_ten = D2; o_seven_one = D3; end
		32'h18: begin o_seven_ten = D2; o_seven_one = D4; end
		32'h19: begin o_seven_ten = D2; o_seven_one = D5; end
		32'h1a: begin o_seven_ten = D2; o_seven_one = D6; end
		32'h1b: begin o_seven_ten = D2; o_seven_one = D7; end
		32'h1c: begin o_seven_ten = D2; o_seven_one = D8; end
		32'h1d: begin o_seven_ten = D2; o_seven_one = D9; end
		32'h1e: begin o_seven_ten = D3; o_seven_one = D0; end
		32'h1f: begin o_seven_ten = D3; o_seven_one = D1; end
		32'h20: begin o_seven_ten = D3; o_seven_one = D2; end
		32'h21: begin o_seven_ten = D3; o_seven_one = D3; end
		32'h22: begin o_seven_ten = D3; o_seven_one = D4; end
		32'h23: begin o_seven_ten = D3; o_seven_one = D5; end
		32'h24: begin o_seven_ten = D3; o_seven_one = D6; end
		32'h25: begin o_seven_ten = D3; o_seven_one = D7; end
		32'h26: begin o_seven_ten = D3; o_seven_one = D8; end
		32'h27: begin o_seven_ten = D3; o_seven_one = D9; end
		32'h28: begin o_seven_ten = D4; o_seven_one = D0; end
		32'h29: begin o_seven_ten = D4; o_seven_one = D1; end
		32'h2a: begin o_seven_ten = D4; o_seven_one = D2; end
		32'h2b: begin o_seven_ten = D4; o_seven_one = D3; end
		32'h2c: begin o_seven_ten = D4; o_seven_one = D4; end
		32'h2d: begin o_seven_ten = D4; o_seven_one = D5; end
		32'h2e: begin o_seven_ten = D4; o_seven_one = D6; end
		32'h2f: begin o_seven_ten = D4; o_seven_one = D7; end
		32'h30: begin o_seven_ten = D4; o_seven_one = D8; end
		32'h31: begin o_seven_ten = D4; o_seven_one = D9; end
		32'h32: begin o_seven_ten = D5; o_seven_one = D0; end
		32'h33: begin o_seven_ten = D5; o_seven_one = D1; end
		32'h34: begin o_seven_ten = D5; o_seven_one = D2; end
		32'h35: begin o_seven_ten = D5; o_seven_one = D3; end
		32'h36: begin o_seven_ten = D5; o_seven_one = D4; end
		32'h37: begin o_seven_ten = D5; o_seven_one = D5; end
		32'h38: begin o_seven_ten = D5; o_seven_one = D6; end
		32'h39: begin o_seven_ten = D5; o_seven_one = D7; end
		32'h3a: begin o_seven_ten = D5; o_seven_one = D8; end
		32'h3b: begin o_seven_ten = D5; o_seven_one = D9; end
		32'h3c: begin o_seven_ten = D6; o_seven_one = D0; end
		32'h3d: begin o_seven_ten = D6; o_seven_one = D1; end
		32'h3e: begin o_seven_ten = D6; o_seven_one = D2; end
		32'h3f: begin o_seven_ten = D6; o_seven_one = D3; end
		32'h40: begin o_seven_ten = D6; o_seven_one = D4; end
		32'h41: begin o_seven_ten = D6; o_seven_one = D5; end
		32'h42: begin o_seven_ten = D6; o_seven_one = D6; end
		32'h43: begin o_seven_ten = D6; o_seven_one = D7; end	
		32'h44: begin o_seven_ten = D6; o_seven_one = D8; end
		32'h45: begin o_seven_ten = D6; o_seven_one = D9; end
		32'h46: begin o_seven_ten = D7; o_seven_one = D0; end
		32'h47: begin o_seven_ten = D7; o_seven_one = D1; end
		32'h48: begin o_seven_ten = D7; o_seven_one = D2; end
		32'h49: begin o_seven_ten = D7; o_seven_one = D3; end
		32'h4a: begin o_seven_ten = D7; o_seven_one = D4; end
		32'h4b: begin o_seven_ten = D7; o_seven_one = D5; end
		32'h4c: begin o_seven_ten = D7; o_seven_one = D6; end
		32'h4d: begin o_seven_ten = D7; o_seven_one = D7; end
		32'h4e: begin o_seven_ten = D7; o_seven_one = D8; end
		32'h4f: begin o_seven_ten = D7; o_seven_one = D9; end
		32'h50: begin o_seven_ten = D8; o_seven_one = D0; end
		32'h51: begin o_seven_ten = D8; o_seven_one = D1; end
		32'h52: begin o_seven_ten = D8; o_seven_one = D2; end
		32'h53: begin o_seven_ten = D8; o_seven_one = D3; end
		32'h54: begin o_seven_ten = D8; o_seven_one = D4; end
		32'h55: begin o_seven_ten = D8; o_seven_one = D5; end
		32'h56: begin o_seven_ten = D8; o_seven_one = D6; end
		32'h57: begin o_seven_ten = D8; o_seven_one = D7; end
		32'h58: begin o_seven_ten = D8; o_seven_one = D8; end
		32'h59: begin o_seven_ten = D8; o_seven_one = D9; end
		32'h5a: begin o_seven_ten = D9; o_seven_one = D0; end
		32'h5b: begin o_seven_ten = D9; o_seven_one = D1; end
		32'h5c: begin o_seven_ten = D9; o_seven_one = D2; end
		32'h5d: begin o_seven_ten = D9; o_seven_one = D3; end
		32'h5e: begin o_seven_ten = D9; o_seven_one = D4; end
		32'h5f: begin o_seven_ten = D9; o_seven_one = D5; end
		32'h60: begin o_seven_ten = D9; o_seven_one = D6; end
		32'h61: begin o_seven_ten = D9; o_seven_one = D7; end
		32'h62: begin o_seven_ten = D9; o_seven_one = D8; end
		32'h63: begin o_seven_ten = D9; o_seven_one = D9; end
	endcase
end

endmodule


module SignedValueDecoder (
	input signed [31:0] i_value,
	output logic [6:0] o_seven_sign,
	output logic [6:0] o_seven_hundred,
	output logic [6:0] o_seven_ten,
	output logic [6:0] o_seven_one
);

/* The layout of seven segment display, 1: dark
 *    00
 *   5  1
 *    66
 *   4  2
 *    33
 */
parameter D0 = 7'b1000000;
parameter D1 = 7'b1111001;
parameter D2 = 7'b0100100;
parameter D3 = 7'b0110000;
parameter D4 = 7'b0011001;
parameter D5 = 7'b0010010;
parameter D6 = 7'b0000010;
parameter D7 = 7'b1011000;
parameter D8 = 7'b0000000;
parameter D9 = 7'b0010000;

parameter D_pos = 7'b1111111;
parameter D_neg = 7'b0111111;

logic signed [31:0] abs_value;
assign abs_value = (i_value < 0)? -i_value : i_value;

logic [31:0] hundred, ten, one;
assign hundred = abs_value / 100;
assign ten = (abs_value % 100) / 10;
assign one = (abs_value % 10);

always @(*) begin
	if (i_value < 0)	o_seven_sign = D_neg;
	else				o_seven_sign = D_pos;

	case(hundred)
		8'h0: begin o_seven_hundred = D0; end
		8'h1: begin o_seven_hundred = D1; end
		8'h2: begin o_seven_hundred = D2; end
		8'h3: begin o_seven_hundred = D3; end
		8'h4: begin o_seven_hundred = D4; end
		8'h5: begin o_seven_hundred = D5; end
		8'h6: begin o_seven_hundred = D6; end
		8'h7: begin o_seven_hundred = D7; end
		8'h8: begin o_seven_hundred = D8; end
		8'h9: begin o_seven_hundred = D9; end
	endcase

	case(ten)
		8'h0: begin o_seven_ten = D0; end
		8'h1: begin o_seven_ten = D1; end
		8'h2: begin o_seven_ten = D2; end
		8'h3: begin o_seven_ten = D3; end
		8'h4: begin o_seven_ten = D4; end
		8'h5: begin o_seven_ten = D5; end
		8'h6: begin o_seven_ten = D6; end
		8'h7: begin o_seven_ten = D7; end
		8'h8: begin o_seven_ten = D8; end
		8'h9: begin o_seven_ten = D9; end
	endcase

	case(one)
		8'h0: begin o_seven_one = D0; end
		8'h1: begin o_seven_one = D1; end
		8'h2: begin o_seven_one = D2; end
		8'h3: begin o_seven_one = D3; end
		8'h4: begin o_seven_one = D4; end
		8'h5: begin o_seven_one = D5; end
		8'h6: begin o_seven_one = D6; end
		8'h7: begin o_seven_one = D7; end
		8'h8: begin o_seven_one = D8; end
		8'h9: begin o_seven_one = D9; end
	endcase
end

endmodule
