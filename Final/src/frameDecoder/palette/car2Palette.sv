// module car2_palette(output reg [23:0] color_map [0:15]);
//     initial begin
//         // use pure black(0,0,0) as the transparent color
//         color_map[0] = 24'h000000; // Transparent color
//         color_map[1] = 24'hb6b3b1;
//         color_map[2] = 24'h444446;
//         color_map[3] = 24'hcdcdcd;
//         color_map[4] = 24'h7f7f80;
//         color_map[5] = 24'h2c2c2e;
//         color_map[6] = 24'h5b5b5d;
//         color_map[7] = 24'hd9d9d9;
//         color_map[8] = 24'hc4c4c3;
//         color_map[9] = 24'ha9a8a8;
//         color_map[10] = 24'h353537;
//         color_map[11] = 24'h9e9c9b;
//         color_map[12] = 24'h4e4e50;
//         color_map[13] = 24'he1e1e1;
//         color_map[14] = 24'h6b6a6a;
//         color_map[15] = 24'h8e8d8e;
//     end
// endmodule


// red
module car2_palette(output reg [23:0] color_map [0:15]);
    initial begin
        // use pure black(0,0,0) as the transparent color
        color_map[0] = 24'h000000; // Transparent color
        color_map[1] = 24'hc40203;
        color_map[2] = 24'h2b2521;
        color_map[3] = 24'h9a3b3a;
        color_map[4] = 24'h840b0a;
        color_map[5] = 24'hdc9494;
        color_map[6] = 24'hd35152;
        color_map[7] = 24'h58100e;
        color_map[8] = 24'h181511;
        color_map[9] = 24'hc92829;
        color_map[10] = 24'h9f0809;
        color_map[11] = 24'h4a1f1c;
        color_map[12] = 24'ha72626;
        color_map[13] = 24'hcc6a6c;
        color_map[14] = 24'ha75253;
        color_map[15] = 24'h852726;
    end
endmodule
