module car_palette(output reg [23:0] color_map [0:15]);
    initial begin
        // use pure black(0,0,0) as the transparent color
        color_map[0] = 24'h000000; // Transparent color
        color_map[1] = 24'h555656;
        color_map[2] = 24'hc9c9c7;
        color_map[3] = 24'h3a3a3a;
        color_map[4] = 24'hbbbbba;
        color_map[5] = 24'h080808;
        color_map[6] = 24'h999998;
        color_map[7] = 24'h757676;
        color_map[8] = 24'h1f2122;
        color_map[9] = 24'hafafad;
        color_map[10] = 24'hd2d2d1;
        color_map[11] = 24'ha5a5a3;
        color_map[12] = 24'h2e2f30;
        color_map[13] = 24'h161717;
        color_map[14] = 24'h8a8a89;
        color_map[15] = 24'h45494d;
    end
endmodule
