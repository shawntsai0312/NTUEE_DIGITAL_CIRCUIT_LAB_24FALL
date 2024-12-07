module carCircle_palette(output reg [23:0] color_map [0:15]);
    initial begin
        color_map[0] = 24'hff0000;  // red
        color_map[1] = 24'h00ff00;  // green
        color_map[2] = 24'h0000ff;  // blue
        color_map[3] = 24'hffff00;  // yellow
        color_map[4] = 24'hff00ff;  // pink
        color_map[5] = 24'h00ffff;  // cyan
        color_map[6] = 24'hff8f00;  // orange
        color_map[7] = 24'h8f00ff;  // purple
        color_map[8] = 24'h00ff8f;  // light green
        color_map[9] = 24'h8fff00;  // light yellow
        color_map[10] = 24'hff008f; // light pink
        color_map[11] = 24'h008fff; // light blue
        color_map[12] = 24'h000000; // black
        color_map[13] = 24'hffffff; // white
        color_map[14] = 24'h888888; // gray
        color_map[15] = 24'h444444; // dark gray
    end
endmodule
