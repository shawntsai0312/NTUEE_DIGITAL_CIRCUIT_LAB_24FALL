module color_palette(output reg [23:0] color_map [0:7]);
    initial begin
        color_map[0] = 24'hf8f8f7;
        color_map[1] = 24'hf5f5f6;
        color_map[2] = 24'hf5f5f5;
        color_map[3] = 24'hf4f4f4;
        color_map[4] = 24'he0e0df;
        color_map[5] = 24'hb3b3b1;
        color_map[6] = 24'h4c4d4d;
        color_map[7] = 24'h2e2f2f;
    end
endmodule
