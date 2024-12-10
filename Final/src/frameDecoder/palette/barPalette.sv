module bar_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hffffff; // (255,255,255)
        color_map[1] = 24'hf7f7f7; // (247,247,247)
        color_map[2] = 24'he3e3e3; // (227,227,227)
        color_map[3] = 24'hcfcfcf; // (207,207,207)
        color_map[4] = 24'hbababa; // (186,186,186)
        color_map[5] = 24'h979797; // (151,151,151)
        color_map[6] = 24'h797979; // (121,121,121)
        color_map[7] = 24'h5b5b5b; // (91,91,91)
        color_map[8] = 24'h2e2e2e; // (46,46,46)
        color_map[9] = 24'h111111; // (17,17,17)
        color_map[10] = 24'h0e0e0e; // (14,14,14)
        color_map[11] = 24'h0c0c0c; // (12,12,12)
        color_map[12] = 24'h090909; // (9,9,9)
        color_map[13] = 24'h060606; // (6,6,6)
        color_map[14] = 24'h020202; // (2,2,2)
        color_map[15] = 24'h000000; // (0,0,0)
    end
endmodule
