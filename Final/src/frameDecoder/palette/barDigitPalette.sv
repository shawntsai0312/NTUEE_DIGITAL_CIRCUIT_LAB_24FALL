module barDigit_palette(output reg [23:0] color_bar [0:15]);
    initial begin
        color_bar[0] = 24'hffffff; // (255,255,255)
        color_bar[1] = 24'hefefef; // (239,239,239)
        color_bar[2] = 24'hcfcfcf; // (207,207,207)
        color_bar[3] = 24'hb7b7b7; // (183,183,183)
        color_bar[4] = 24'ha0a0a0; // (160,160,160)
        color_bar[5] = 24'h888888; // (136,136,136)
        color_bar[6] = 24'h757575; // (117,117,117)
        color_bar[7] = 24'h4c4c4c; // (76,76,76)
        color_bar[8] = 24'h202020; // (32,32,32)
        color_bar[9] = 24'h101010; // (16,16,16)
        color_bar[10] = 24'h0c0c0c; // (12,12,12)
        color_bar[11] = 24'h0a0a0a; // (10,10,10)
        color_bar[12] = 24'h070707; // (7,7,7)
        color_bar[13] = 24'h040404; // (4,4,4)
        color_bar[14] = 24'h020202; // (2,2,2)
        color_bar[15] = 24'h000000; // (0,0,0)
    end
endmodule
