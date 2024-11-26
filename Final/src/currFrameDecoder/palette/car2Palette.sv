module car2_palette(output reg [23:0] color_map [0:15]);
    initial begin
        // use pure black(0,0,0) as the transparent color
        color_map[0] = 24'h000000; // Transparent color
        color_map[1] = 24'ha9a8a8;
        color_map[2] = 24'h353537;
        color_map[3] = 24'hc4c4c4;
        color_map[4] = 24'h434344;
        color_map[5] = 24'hf6f6f6;
        color_map[6] = 24'h656566;
        color_map[7] = 24'h898888;
        color_map[8] = 24'hdfdddc;
        color_map[9] = 24'h4f4f51;
        color_map[10] = 24'h2c2c2d;
        color_map[11] = 24'h59595b;
        color_map[12] = 24'hd0cfce;
        color_map[13] = 24'he8e7e7;
        color_map[14] = 24'h747475;
        color_map[15] = 24'hb9b5b1;
    end
endmodule
