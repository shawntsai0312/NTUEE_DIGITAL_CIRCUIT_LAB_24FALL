module idleBackground_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hece0dd; // (236,224,221)
        color_map[1] = 24'haab8cd; // (170,184,205)
        color_map[2] = 24'hc17e78; // (193,126,120)
        color_map[3] = 24'h737994; // (115,121,148)
        color_map[4] = 24'hbf4d57; // (191,77,87)
        color_map[5] = 24'h744d4e; // (116,77,78)
        color_map[6] = 24'h3e4765; // (62,71,101)
        color_map[7] = 24'h272a45; // (39,42,69)
        color_map[8] = 24'h52121f; // (82,18,31)
        color_map[9] = 24'h27101b; // (39,16,27)
        color_map[10] = 24'h161a28; // (22,26,40)
        color_map[11] = 24'h150f17; // (21,15,23)
        color_map[12] = 24'h0d131f; // (13,19,31)
        color_map[13] = 24'h0c0f15; // (12,15,21)
        color_map[14] = 24'h0b0d12; // (11,13,18)
        color_map[15] = 24'h090a10; // (9,10,16)
    end
endmodule
