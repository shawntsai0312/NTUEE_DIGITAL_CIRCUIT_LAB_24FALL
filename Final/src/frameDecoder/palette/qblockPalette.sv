module qblock_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hf2f1e6; // (242,241,230)
        color_map[1] = 24'hf1eee7; // (241,238,231)
        color_map[2] = 24'hf7e579; // (247,229,121)
        color_map[3] = 24'heacc2f; // (234,204,47)
        color_map[4] = 24'he8c421; // (232,196,33)
        color_map[5] = 24'hedc40f; // (237,196,15)
        color_map[6] = 24'heec40b; // (238,196,11)
        color_map[7] = 24'heac40a; // (234,196,10)
        color_map[8] = 24'he4c130; // (228,193,48)
        color_map[9] = 24'hebc118; // (235,193,24)
        color_map[10] = 24'hefc10d; // (239,193,13)
        color_map[11] = 24'hebc10d; // (235,193,13)
        color_map[12] = 24'hdbbb3c; // (219,187,60)
        color_map[13] = 24'hc8ab33; // (200,171,51)
        color_map[14] = 24'h9e7f13; // (158,127,19)
        color_map[15] = 24'h876405; // (135,100,5)
    end
endmodule
