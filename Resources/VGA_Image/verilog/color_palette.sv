module color_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hfbfbfb;
        color_map[1] = 24'hf9f9f9;
        color_map[2] = 24'hf8f8f8;
        color_map[3] = 24'hf5f5f5;
        color_map[4] = 24'hf1f1f1;
        color_map[5] = 24'hf0f0f0;
        color_map[6] = 24'hf0f0ef;
        color_map[7] = 24'hefefef;
        color_map[8] = 24'hdadad9;
        color_map[9] = 24'hc7c7c5;
        color_map[10] = 24'hacacaa;
        color_map[11] = 24'h757676;
        color_map[12] = 24'h555555;
        color_map[13] = 24'h404142;
        color_map[14] = 24'h383839;
        color_map[15] = 24'h1d1e1f;
    end
endmodule
