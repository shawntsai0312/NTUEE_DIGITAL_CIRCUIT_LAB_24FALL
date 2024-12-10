package trackPkg;
    import sram_pkg::*;

    typedef struct {
        logic signed [sram_pkg::MAP_H_WIDTH-1:0] x_left;
        logic signed [sram_pkg::MAP_H_WIDTH-1:0] x_right;

        logic signed [sram_pkg::MAP_V_WIDTH-1:0] y_top_border;
        logic signed [sram_pkg::MAP_V_WIDTH-1:0] y_bottom_border;
    } HorizontalTrack;

    typedef struct {
        logic signed [sram_pkg::MAP_V_WIDTH-1:0] y_top;
        logic signed [sram_pkg::MAP_V_WIDTH-1:0] y_bottom;

        logic signed [sram_pkg::MAP_H_WIDTH-1:0] x_left_border;
        logic signed [sram_pkg::MAP_H_WIDTH-1:0] x_right_border;
    } VerticalTrack;

    typedef struct {
        logic signed [sram_pkg::MAP_H_WIDTH-1:0] x_left;
        logic signed [sram_pkg::MAP_H_WIDTH-1:0] x_right;
        logic signed [sram_pkg::MAP_V_WIDTH-1:0] y_top;
        logic signed [sram_pkg::MAP_V_WIDTH-1:0] y_bottom;

        logic signed [sram_pkg::MAP_H_WIDTH-1:0] center_x;
        logic signed [sram_pkg::MAP_V_WIDTH-1:0] center_y;
        logic [sram_pkg::MAP_H_WIDTH-1:0] radius_inner;
        logic [sram_pkg::MAP_H_WIDTH-1:0] radius_outer;
    } CircleTrack;

    // HorizontalTrack track0;
    // initial begin
    //     track0.x_left = -550;
    //     track0.x_right = 530;
    //     track0.y_top_border = -250; 
    //     track0.y_bottom_border = -365;
    // end
    
    // CircleTrack track1;
    // initial begin
    //     track1.x_left = 530;
    //     track1.x_right = 750;
    //     track1.y_top = -150; 
    //     track1.y_bottom = -370;
    //     track1.center_x = 530;
    //     track1.center_y = -150;
    //     track1.radius_inner = 100;
    //     track1.radius_outer = 215;
    // end
    
    // VerticalTrack track2;
    // initial begin
    //     track2.y_top = 150; 
    //     track2.y_bottom = -150;
    //     track2.x_left_border = 630;
    //     track2.x_right_border = 745;
    // end
    
    // CircleTrack track3;
    // initial begin
    //     track3.x_left = 530;
    //     track3.x_right = 750;
    //     track3.y_top = 370; 
    //     track3.y_bottom = 150;
    //     track3.center_x = 530;
    //     track3.center_y = 150;
    //     track3.radius_inner = 100;
    //     track3.radius_outer = 215;
    // end
    
    // HorizontalTrack track4;
    // initial begin
    //     track4.x_left = 80;
    //     track4.x_right = 530;
    //     track4.y_top_border = 365; 
    //     track4.y_bottom_border = 250;
    // end
    
    // CircleTrack track5;
    // initial begin
    //     track5.x_left = -140;
    //     track5.x_right = 80;
    //     track5.y_top = 370; 
    //     track5.y_bottom = 150;
    //     track5.center_x = 80;
    //     track5.center_y = 150;
    //     track5.radius_inner = 100;
    //     track5.radius_outer = 215;
    // end
    
    // VerticalTrack track6;
    // initial begin
    //     track6.y_top = 150; 
    //     track6.y_bottom = 0;
    //     track6.x_left_border = -135;
    //     track6.x_right_border = -20;
    // end
    
    // CircleTrack track7;
    // initial begin
    //     track7.x_left = -445;
    //     track7.x_right = -15;
    //     track7.y_top = 0; 
    //     track7.y_bottom = -220;
    //     track7.center_x = -235;
    //     track7.center_y = 0;
    //     track7.radius_inner = 100;
    //     track7.radius_outer = 215;
    end

endpackage