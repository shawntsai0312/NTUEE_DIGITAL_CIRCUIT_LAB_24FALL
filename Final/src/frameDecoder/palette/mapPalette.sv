module map_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hadd8e6; // (173,216,230)
        color_map[1] = 24'he6c8a0; // (230,200,160)
        color_map[2] = 24'hdcbe96; // (220,190,150)
        color_map[3] = 24'hd2b48c; // (210,180,140)
        color_map[4] = 24'h787878; // (120,120,120)
        color_map[5] = 24'h6e6e6e; // (110,110,110)
        color_map[6] = 24'h646464; // (100,100,100)
        color_map[7] = 24'h515151; // (81,81,81)
        color_map[8] = 24'h010101; // (1,1,1)
        color_map[9] = 24'h000000; // prevent quartus compile error
        color_map[10] = 24'h000000; // prevent quartus compile error
        color_map[11] = 24'h000000; // prevent quartus compile error
        color_map[12] = 24'h000000; // prevent quartus compile error
        color_map[13] = 24'h000000; // prevent quartus compile error
        color_map[14] = 24'h000000; // prevent quartus compile error
        color_map[15] = 24'h000000; // prevent quartus compile error
    end
endmodule
