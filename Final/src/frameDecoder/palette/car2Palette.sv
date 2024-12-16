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


// white
module car2_palette(output reg [23:0] color_map [0:15]);
    initial begin
        // use pure black(0,0,0) as the transparent color
        color_map[0] = 24'h000000; // Transparent color
        color_map[1] = 24'h3b2d44;
        color_map[2] = 24'ha296ac;
        color_map[3] = 24'h695e72;
        color_map[4] = 24'hcdc4d2;
        color_map[5] = 24'h83798e;
        color_map[6] = 24'h493d51;
        color_map[7] = 24'hc0b8c9;
        color_map[8] = 24'h978da2;
        color_map[9] = 24'hb3acbd;
        color_map[10] = 24'h574b60;
        color_map[11] = 24'h736a7e;
        color_map[12] = 24'haaa1b5;
        color_map[13] = 24'h8d8397;
        color_map[14] = 24'hdddadf;
        color_map[15] = 24'h9d93a6;
    end
endmodule
