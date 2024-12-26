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


// module SignedValueDecoder (
// 	input signed [31:0] i_value,
// 	output logic [6:0] o_seven_sign,
// 	output logic [6:0] o_seven_hundred,
// 	output logic [6:0] o_seven_ten,
// 	output logic [6:0] o_seven_one
// );

// /* The layout of seven segment display, 1: dark
//  *    00
//  *   5  1
//  *    66
//  *   4  2
//  *    33
//  */
// parameter D0 = 7'b1000000;
// parameter D1 = 7'b1111001;
// parameter D2 = 7'b0100100;
// parameter D3 = 7'b0110000;
// parameter D4 = 7'b0011001;
// parameter D5 = 7'b0010010;
// parameter D6 = 7'b0000010;
// parameter D7 = 7'b1011000;
// parameter D8 = 7'b0000000;
// parameter D9 = 7'b0010000;

// parameter D_pos = 7'b1111111;
// parameter D_neg = 7'b0111111;

// logic signed [31:0] abs_value;
// assign abs_value = (i_value < 0)? -i_value : i_value;

// logic [31:0] hundred, ten, one;
// assign hundred = abs_value / 100;
// assign ten = (abs_value % 100) / 10;
// assign one = (abs_value % 10);

// always @(*) begin
// 	if (i_value < 0)	o_seven_sign = D_neg;
// 	else				o_seven_sign = D_pos;

// 	case(hundred)
// 		8'h0: begin o_seven_hundred = D0; end
// 		8'h1: begin o_seven_hundred = D1; end
// 		8'h2: begin o_seven_hundred = D2; end
// 		8'h3: begin o_seven_hundred = D3; end
// 		8'h4: begin o_seven_hundred = D4; end
// 		8'h5: begin o_seven_hundred = D5; end
// 		8'h6: begin o_seven_hundred = D6; end
// 		8'h7: begin o_seven_hundred = D7; end
// 		8'h8: begin o_seven_hundred = D8; end
// 		8'h9: begin o_seven_hundred = D9; end
// 	endcase

// 	case(ten)
// 		8'h0: begin o_seven_ten = D0; end
// 		8'h1: begin o_seven_ten = D1; end
// 		8'h2: begin o_seven_ten = D2; end
// 		8'h3: begin o_seven_ten = D3; end
// 		8'h4: begin o_seven_ten = D4; end
// 		8'h5: begin o_seven_ten = D5; end
// 		8'h6: begin o_seven_ten = D6; end
// 		8'h7: begin o_seven_ten = D7; end
// 		8'h8: begin o_seven_ten = D8; end
// 		8'h9: begin o_seven_ten = D9; end
// 	endcase

// 	case(one)
// 		8'h0: begin o_seven_one = D0; end
// 		8'h1: begin o_seven_one = D1; end
// 		8'h2: begin o_seven_one = D2; end
// 		8'h3: begin o_seven_one = D3; end
// 		8'h4: begin o_seven_one = D4; end
// 		8'h5: begin o_seven_one = D5; end
// 		8'h6: begin o_seven_one = D6; end
// 		8'h7: begin o_seven_one = D7; end
// 		8'h8: begin o_seven_one = D8; end
// 		8'h9: begin o_seven_one = D9; end
// 	endcase
// end

// endmodule

module SignedValueDecoder (
	input signed [15:0] i_data,          // 輸入的 2's Complement 整數
   output logic [6:0] o_hex_0,     // 個位數顯示
   output logic [6:0] o_hex_1,     // 十位數顯示
   output logic [6:0] o_hex_2,     // 百位數顯示
   output logic [6:0] o_hex_3,     // 千位數顯示
   output logic [6:0] o_hex_sign,   // 正負號顯示
   output logic [2:0] o_level 
);

/* 七段顯示器的段配置, 1 表示滅燈
*    000
*   5   1
*    666
*   4   2
*    333
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
parameter DASH = 7'b0111111;  // 負號顯示
parameter BLANK = 7'b1111111; // 空白顯示

logic signed [15:0] abs_value; // 絕對值
logic [3:0] unit_digit;        // 個位數
logic [3:0] tens_digit;        // 十位數
logic [3:0] hundreds_digit;    // 百位數
logic [3:0] thousands_digit;   // 千位數

always@(*) begin
   // 計算絕對值
   if (i_data < 0) 
       abs_value = -i_data;
   else 
       abs_value = i_data;

   // 分解數字為千位數、百位數、十位數和個位數
   thousands_digit = abs_value / 1000;
   hundreds_digit = (abs_value % 1000) / 100;
   tens_digit = (abs_value % 100) / 10;
   unit_digit = abs_value % 10;

   // 設定正負號顯示
   if (i_data < 0)
       o_hex_sign = DASH;  // 負號
   else
       o_hex_sign = BLANK; // 空白表示正號

   // 設定七段顯示器輸出
   case(unit_digit)
       4'd0: o_hex_0 = D0;
       4'd1: o_hex_0 = D1;
       4'd2: o_hex_0 = D2;
       4'd3: o_hex_0 = D3;
       4'd4: o_hex_0 = D4;
       4'd5: o_hex_0 = D5;
       4'd6: o_hex_0 = D6;
       4'd7: o_hex_0 = D7;
       4'd8: o_hex_0 = D8;
       4'd9: o_hex_0 = D9;
       default: o_hex_0 = BLANK;
   endcase

   case(tens_digit)
       4'd0: o_hex_1 = D0;
       4'd1: o_hex_1 = D1;
       4'd2: o_hex_1 = D2;
       4'd3: o_hex_1 = D3;
       4'd4: o_hex_1 = D4;
       4'd5: o_hex_1 = D5;
       4'd6: o_hex_1 = D6;
       4'd7: o_hex_1 = D7;
       4'd8: o_hex_1 = D8;
       4'd9: o_hex_1 = D9;
       default: o_hex_1 = BLANK;
   endcase

   case(hundreds_digit)
       4'd0: o_hex_2 = D0;
       4'd1: o_hex_2 = D1;
       4'd2: o_hex_2 = D2;
       4'd3: o_hex_2 = D3;
       4'd4: o_hex_2 = D4;
       4'd5: o_hex_2 = D5;
       4'd6: o_hex_2 = D6;
       4'd7: o_hex_2 = D7;
       4'd8: o_hex_2 = D8;
       4'd9: o_hex_2 = D9;
       default: o_hex_2 = BLANK;
   endcase

   case(thousands_digit)
       4'd0: o_hex_3 = D0;
       4'd1: o_hex_3 = D1;
       4'd2: o_hex_3 = D2;
       4'd3: o_hex_3 = D3;
       4'd4: o_hex_3 = D4;
       4'd5: o_hex_3 = D5;
       4'd6: o_hex_3 = D6;
       4'd7: o_hex_3 = D7;
       4'd8: o_hex_3 = D8;
       4'd9: o_hex_3 = D9;
       default: o_hex_3 = BLANK;
   endcase
    
    if(abs_value > 210) o_level = 3'b000;
    else if(abs_value > 180) o_level = 3'b001;
    else if(abs_value > 150) o_level = 3'b010;
    else if(abs_value > 120) o_level = 3'b011;
    else if(abs_value > 90) o_level = 3'b100;
    else if(abs_value > 60) o_level = 3'b101;
    else if(abs_value > 30) o_level = 3'b110;
    else o_level = 3'b111;
    
end
endmodule

module StatusDecoder (
	input logic signed [3:0] i_omega,
	input logic signed [7:0] i_acc_value,
	output logic [6:0] o_omega_sign,
	output logic [6:0] o_omega_abs,
	output logic [6:0] o_acc_ten,
	output logic [6:0] o_acc_one
);

	/* 七段顯示器的段配置, 1 表示滅燈
	*    000
	*   5   1
	*    666
	*   4   2
	*    333
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
	parameter DASH = 7'b0111111;  // 負號顯示
	parameter BLANK = 7'b1111111; // 空白顯示

	wire [7:0] omega_abs_value, acc_ten_value, acc_one_value;
	assign o_omega_sign = (i_omega < 0)? DASH : BLANK;
	assign omega_abs_value = (i_omega < 0)? -i_omega : i_omega;
	assign acc_ten_value = i_acc_value / 10;
	assign acc_one_value = i_acc_value % 10;

	always @(*) begin
		o_omega_abs = D0;
		case (omega_abs_value)
			8'h0: o_omega_abs = D0;
			8'h1: o_omega_abs = D1;
			8'h2: o_omega_abs = D2;
			8'h3: o_omega_abs = D3;
			8'h4: o_omega_abs = D4;
			8'h5: o_omega_abs = D5;
			8'h6: o_omega_abs = D6;
			8'h7: o_omega_abs = D7;
			8'h8: o_omega_abs = D8;
			8'h9: o_omega_abs = D9;
		endcase
	end

	always @(*) begin
		o_acc_ten = D0;
		case (acc_ten_value)
			8'h0: o_acc_ten = D0;
			8'h1: o_acc_ten = D1;
			8'h2: o_acc_ten = D2;
			8'h3: o_acc_ten = D3;
			8'h4: o_acc_ten = D4;
			8'h5: o_acc_ten = D5;
			8'h6: o_acc_ten = D6;
			8'h7: o_acc_ten = D7;
			8'h8: o_acc_ten = D8;
			8'h9: o_acc_ten = D9;
		endcase
	end

	always @(*) begin
		o_acc_one = D0;
		case (acc_one_value)
			8'h0: o_acc_one = D0;
			8'h1: o_acc_one = D1;
			8'h2: o_acc_one = D2;
			8'h3: o_acc_one = D3;
			8'h4: o_acc_one = D4;
			8'h5: o_acc_one = D5;
			8'h6: o_acc_one = D6;
			8'h7: o_acc_one = D7;
			8'h8: o_acc_one = D8;
			8'h9: o_acc_one = D9;
		endcase
	end

endmodule