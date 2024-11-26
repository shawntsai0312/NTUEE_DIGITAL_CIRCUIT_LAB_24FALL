module CurrFrameDecoder(
    input i_clk,
    input i_rst_n,

    input signed [10:0] i_car_x,
    input signed [9:0] i_car_y,

    input [10:0] i_H_to_be_rendered,
    input [9:0] i_V_to_be_rendered,

    output [19:0] o_address,
    input [15:0] i_data
);

endmodule