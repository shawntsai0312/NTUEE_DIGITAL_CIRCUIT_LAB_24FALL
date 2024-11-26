module Main(
    input i_clk,
    input i_rst_n,
    input signed [10:0] i_x,
    input signed [9:0] i_y,
    input signed [8:0] i_angle,
    output o_H_sync,
    output o_V_sync,
    output [23:0] o_RGB,
    output o_RGB_valid
);

    wire sram_we;
    wire [19:0] sram_addr;
    reg [15:0] sram_data;
    wire [10:0] H_to_be_rendered;
    wire [9:0] V_to_be_rendered;
    wire [23:0] color_map [0:15];

    VGA u_VGA (
        .i_clk                     (i_clk),
        .i_rst_n                   (i_rst_n),
        .i_color                   (color_map[encoded_color]),
        .o_H_sync                  (o_H_sync),
        .o_V_sync                  (o_V_sync),
        .o_RGB                     (o_RGB),
        .o_RGB_valid               (o_RGB_valid),
        .o_H_to_be_rendered        (H_to_be_rendered),
        .o_V_to_be_rendered        (V_to_be_rendered),
        .o_to_be_rendered_valid    (!sram_we)
    );

    Sram u_Sram (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .i_we       (sram_we),
        .i_addr     (sram_addr),
        .io_data    (sram_data)
    );

    CoorDecoder u_CoorDecoder (
        .i_clk                 (i_clk),
        .i_rst_n               (i_rst_n),
        .i_H_to_be_rendered    (H_to_be_rendered),
        .i_V_to_be_rendered    (V_to_be_rendered),
        .i_x                   (i_x),
        .i_y                   (i_y),
        .o_addr                (sram_addr)
    );

    SramDecoder u_SramDecoder (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_sram_data        (sram_data),
        .o_encoded_color    (encoded_color)
    );

    car_palette u_car_palette (
        .color_map    (color_map)
    );

endmodule