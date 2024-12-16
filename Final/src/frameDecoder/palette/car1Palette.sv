// module car1_palette(output reg [23:0] color_map [0:15]);
//     initial begin
//         // use pure black(0,0,0) as the transparent color
//         color_map[0] = 24'h000000; // Transparent color
//         color_map[1] = 24'h484b4d;
//         color_map[2] = 24'hbabab8;
//         color_map[3] = 24'h313131;
//         color_map[4] = 24'h7f7f7e;
//         color_map[5] = 24'hd2d2d0;
//         color_map[6] = 24'ha3a3a1;
//         color_map[7] = 24'h252525;
//         color_map[8] = 24'h3a3a3b;
//         color_map[9] = 24'h555656;
//         color_map[10] = 24'hc9c9c7;
//         color_map[11] = 24'h616263;
//         color_map[12] = 24'hb0b0ae;
//         color_map[13] = 24'h1d1d1d;
//         color_map[14] = 24'h939494;
//         color_map[15] = 24'h707171;
//     end
// endmodule

// yellow
module car1_palette(output reg [23:0] color_map [0:15]);
    initial begin
        // use pure black(0,0,0) as the transparent color
        color_map[0] = 24'h000000; // Transparent color
        color_map[1] = 24'h827a1d;
        color_map[2] = 24'h353231;
        color_map[3] = 24'hebcd13;
        color_map[4] = 24'hf4eb9d;
        color_map[5] = 24'hc3b720;
        color_map[6] = 24'hf9ee08;
        color_map[7] = 24'hf7e234;
        color_map[8] = 24'ha8971a;
        color_map[9] = 24'h4d4721;
        color_map[10] = 24'h484646;
        color_map[11] = 24'hf8e65c;
        color_map[12] = 24'hefb509;
        color_map[13] = 24'h282322;
        color_map[14] = 24'hd7a20c;
        color_map[15] = 24'h665e21;
    end
endmodule