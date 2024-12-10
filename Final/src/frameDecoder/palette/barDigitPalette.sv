module barDigit_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hffffff; // (255,255,255)
        color_map[1] = 24'hefefef; // (239,239,239)
        color_map[2] = 24'hcfcfcf; // (207,207,207)
        color_map[3] = 24'hb7b7b7; // (183,183,183)
        color_map[4] = 24'ha0a0a0; // (160,160,160)
        color_map[5] = 24'h888888; // (136,136,136)
        color_map[6] = 24'h757575; // (117,117,117)
        color_map[7] = 24'h4c4c4c; // (76,76,76)
        color_map[8] = 24'h202020; // (32,32,32)
        color_map[9] = 24'h101010; // (16,16,16)
        color_map[10] = 24'h0c0c0c; // (12,12,12)
        color_map[11] = 24'h0a0a0a; // (10,10,10)
        color_map[12] = 24'h070707; // (7,7,7)
        color_map[13] = 24'h040404; // (4,4,4)
        color_map[14] = 24'h020202; // (2,2,2)
        color_map[15] = 24'h000000; // (0,0,0)
    end
endmodule
