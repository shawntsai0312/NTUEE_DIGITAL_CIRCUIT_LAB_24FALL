module lose_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hffffff; // (255,255,255)
        color_map[1] = 24'hf4f4f4; // (244,244,244)
        color_map[2] = 24'hdfdfdf; // (223,223,223)
        color_map[3] = 24'hc2c2c2; // (194,194,194)
        color_map[4] = 24'hbebebe; // (190,190,190)
        color_map[5] = 24'hababab; // (171,171,171)
        color_map[6] = 24'h989898; // (152,152,152)
        color_map[7] = 24'h888888; // (136,136,136)
        color_map[8] = 24'h6d6d6d; // (109,109,109)
        color_map[9] = 24'h5f5f5f; // (95,95,95)
        color_map[10] = 24'h4f4f4f; // (79,79,79)
        color_map[11] = 24'h424242; // (66,66,66)
        color_map[12] = 24'h333333; // (51,51,51)
        color_map[13] = 24'h222222; // (34,34,34)
        color_map[14] = 24'h111111; // (17,17,17)
        color_map[15] = 24'h000000; // (0,0,0)
    end
endmodule
