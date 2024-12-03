module Main(
    input i_clk,
    input i_rst_n
);

    FrameEncoder u_FrameEncoder (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_start            (),
        .i_car1_angle       (),
        .i_car2_angle       (),
        .o_sram_addr        (),
        .o_sram_data        (),
        .o_proc_counter     (),
        .o_pixel_counter    (),
        .o_opacity          (),
        .o_opacity_valid    (),
        // output o_opacity_map [0:object_pkg::OBJECT_OPACITY_NUM-1][0:sram_pkg::MAP_V-1][0:sram_pkg::MAP_H-1],
        .o_done             ()
    );

endmodule