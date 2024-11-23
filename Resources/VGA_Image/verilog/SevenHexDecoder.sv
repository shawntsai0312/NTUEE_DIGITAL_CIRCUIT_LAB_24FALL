module SevenHexDecoder (
	input        [7:0] i_hex,
	output logic [6:0] o_hex_0,
	output logic [6:0] o_hex_1,
	output logic [6:0] o_hex_2,
	output logic [6:0] o_hex_3,
	output logic [6:0] o_hex_4,
	output logic [6:0] o_hex_5,
	output logic [6:0] o_hex_6,
	output logic [6:0] o_hex_7
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

always_comb begin
	case(i_hex[0])
		0: o_hex_0 = D0;
		1: o_hex_0 = D1;
	endcase
	case(i_hex[1])
		0: o_hex_1 = D0;
		1: o_hex_1 = D1;
	endcase
	case(i_hex[2])
		0: o_hex_2 = D0;
		1: o_hex_2 = D1;
	endcase
	case(i_hex[3])
		0: o_hex_3 = D0;
		1: o_hex_3 = D1;
	endcase
	case(i_hex[4])
		0: o_hex_4 = D0;
		1: o_hex_4 = D1;
	endcase
	case(i_hex[5])
		0: o_hex_5 = D0;
		1: o_hex_5 = D1;
	endcase
	case(i_hex[6])
		0: o_hex_6 = D0;
		1: o_hex_6 = D1;
	endcase
	case(i_hex[7])
		0: o_hex_7 = D0;
		1: o_hex_7 = D1;
	endcase
end

endmodule
