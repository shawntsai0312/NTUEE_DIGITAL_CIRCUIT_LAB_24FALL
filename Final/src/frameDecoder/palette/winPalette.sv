module win_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hffffff; // (255,255,255)
        color_map[1] = 24'hfafafa; // (250,250,250)
        color_map[2] = 24'hf1f1f1; // (241,241,241)
        color_map[3] = 24'he8e8e8; // (232,232,232)
        color_map[4] = 24'hcbcbcb; // (203,203,203)
        color_map[5] = 24'hc1c1c1; // (193,193,193)
        color_map[6] = 24'hbbbbbb; // (187,187,187)
        color_map[7] = 24'hababab; // (171,171,171)
        color_map[8] = 24'h8a8a8a; // (138,138,138)
        color_map[9] = 24'h717171; // (113,113,113)
        color_map[10] = 24'h404040; // (64,64,64)
        color_map[11] = 24'h242424; // (36,36,36)
        color_map[12] = 24'h171717; // (23,23,23)
        color_map[13] = 24'h0a0a0a; // (10,10,10)
        color_map[14] = 24'h030303; // (3,3,3)
        color_map[15] = 24'h000000; // (0,0,0)
    end
endmodule
