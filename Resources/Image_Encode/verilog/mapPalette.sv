module map_palette(output reg [23:0] color_map [0:16]);
    initial begin
        color_map[0] = 24'hf8dab2;
        color_map[1] = 24'ha8f55c;
        color_map[2] = 24'ha3f057;
        color_map[3] = 24'h9eeb52;
        color_map[4] = 24'h99e64d;
        color_map[5] = 24'h94e148;
        color_map[6] = 24'h8fdc43;
        color_map[7] = 24'h8ad73e;
        color_map[8] = 24'h85d239;
        color_map[9] = 24'he9cba3;
        color_map[10] = 24'h80cd34;
        color_map[11] = 24'h7bc82f;
        color_map[12] = 24'hcbb393;
        color_map[13] = 24'h858585;
        color_map[14] = 24'ha34646;
        color_map[15] = 24'h010101;
    end
endmodule
