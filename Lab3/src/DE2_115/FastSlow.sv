module FastSlow (
    input i_is_slow,
    output logic [6:0] o_seven
);
/* The layout of seven segment display, 1: dark
 *    00
 *   5  1
 *    66
 *   4  2
 *    33
 */

parameter F = 7'b0001110;
parameter S = 7'b0010010;

always @(*) begin
    o_seven = i_is_slow ? S : F;
end

endmodule