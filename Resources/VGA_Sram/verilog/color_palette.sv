module color_palette(output reg [23:0] color_map [0:15]);
    initial begin
        // use pure black(0,0,0) as the transparent color
        color_map[0] = 24'h000000; // Transparent color
        color_map[1] = 24'hcacac8;
        color_map[2] = 24'h3a3a3a;
        color_map[3] = 24'h555556;
        color_map[4] = 24'h90908f;
        color_map[5] = 24'h181817;
        color_map[6] = 24'hb3b3b1;
        color_map[7] = 24'h7c7d7e;
        color_map[8] = 24'h22262a;
        color_map[9] = 24'ha6a6a4;
        color_map[10] = 24'h303131;
        color_map[11] = 24'h0b0b0b;
        color_map[12] = 24'hf1f1f1;
        color_map[13] = 24'h48494b;
        color_map[14] = 24'hbebebc;
        color_map[15] = 24'h676868;
    end
endmodule
