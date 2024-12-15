module start_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hffffff; // (255,255,255)
        color_map[1] = 24'hcccccd; // (204,204,205)
        color_map[2] = 24'h6e6e72; // (110,110,114)
        color_map[3] = 24'h20232d; // (32,35,45)
        color_map[4] = 24'h0f1019; // (15,16,25)
        color_map[5] = 24'h0f0c13; // (15,12,19)
        color_map[6] = 24'h0c0d12; // (12,13,18)
        color_map[7] = 24'h0b0e14; // (11,14,20)
        color_map[8] = 24'h0b0c13; // (11,12,19)
        color_map[9] = 24'h0b0c11; // (11,12,17)
        color_map[10] = 24'h0b0c10; // (11,12,16)
        color_map[11] = 24'h090c11; // (9,12,17)
        color_map[12] = 24'h0f0b12; // (15,11,18)
        color_map[13] = 24'h0a0b10; // (10,11,16)
        color_map[14] = 24'h080b10; // (8,11,16)
        color_map[15] = 24'h07090e; // (7,9,14)
    end
endmodule
