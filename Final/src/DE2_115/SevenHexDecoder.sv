module SevenHexDecoder (
	input        [5:0] i_hex,
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
		6'h0: begin o_seven_ten = D0; o_seven_one = D0; end
		6'h1: begin o_seven_ten = D0; o_seven_one = D1; end
		6'h2: begin o_seven_ten = D0; o_seven_one = D2; end
		6'h3: begin o_seven_ten = D0; o_seven_one = D3; end
		6'h4: begin o_seven_ten = D0; o_seven_one = D4; end
		6'h5: begin o_seven_ten = D0; o_seven_one = D5; end
		6'h6: begin o_seven_ten = D0; o_seven_one = D6; end
		6'h7: begin o_seven_ten = D0; o_seven_one = D7; end
		6'h8: begin o_seven_ten = D0; o_seven_one = D8; end
		6'h9: begin o_seven_ten = D0; o_seven_one = D9; end
		6'ha: begin o_seven_ten = D1; o_seven_one = D0; end
		6'hb: begin o_seven_ten = D1; o_seven_one = D1; end
		6'hc: begin o_seven_ten = D1; o_seven_one = D2; end
		6'hd: begin o_seven_ten = D1; o_seven_one = D3; end
		6'he: begin o_seven_ten = D1; o_seven_one = D4; end
		6'hf: begin o_seven_ten = D1; o_seven_one = D5; end
		6'h10: begin o_seven_ten = D1; o_seven_one = D6; end
		6'h11: begin o_seven_ten = D1; o_seven_one = D7; end
		6'h12: begin o_seven_ten = D1; o_seven_one = D8; end
		6'h13: begin o_seven_ten = D1; o_seven_one = D9; end
		6'h14: begin o_seven_ten = D2; o_seven_one = D0; end
		6'h15: begin o_seven_ten = D2; o_seven_one = D1; end
		6'h16: begin o_seven_ten = D2; o_seven_one = D2; end
		6'h17: begin o_seven_ten = D2; o_seven_one = D3; end
		6'h18: begin o_seven_ten = D2; o_seven_one = D4; end
		6'h19: begin o_seven_ten = D2; o_seven_one = D5; end
		6'h1a: begin o_seven_ten = D2; o_seven_one = D6; end
		6'h1b: begin o_seven_ten = D2; o_seven_one = D7; end
		6'h1c: begin o_seven_ten = D2; o_seven_one = D8; end
		6'h1d: begin o_seven_ten = D2; o_seven_one = D9; end
		6'h1e: begin o_seven_ten = D3; o_seven_one = D0; end
		6'h1f: begin o_seven_ten = D3; o_seven_one = D1; end
		6'h20: begin o_seven_ten = D3; o_seven_one = D2; end
		6'h21: begin o_seven_ten = D3; o_seven_one = D3; end
		6'h22: begin o_seven_ten = D3; o_seven_one = D4; end
		6'h23: begin o_seven_ten = D3; o_seven_one = D5; end
		6'h24: begin o_seven_ten = D3; o_seven_one = D6; end
		6'h25: begin o_seven_ten = D3; o_seven_one = D7; end
		6'h26: begin o_seven_ten = D3; o_seven_one = D8; end
		6'h27: begin o_seven_ten = D3; o_seven_one = D9; end
		6'h28: begin o_seven_ten = D4; o_seven_one = D0; end
		6'h29: begin o_seven_ten = D4; o_seven_one = D1; end
		6'h2a: begin o_seven_ten = D4; o_seven_one = D2; end
		6'h2b: begin o_seven_ten = D4; o_seven_one = D3; end
		6'h2c: begin o_seven_ten = D4; o_seven_one = D4; end
		6'h2d: begin o_seven_ten = D4; o_seven_one = D5; end
		6'h2e: begin o_seven_ten = D4; o_seven_one = D6; end
		6'h2f: begin o_seven_ten = D4; o_seven_one = D7; end
	endcase
end

endmodule
