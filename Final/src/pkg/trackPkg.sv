package track_pkg;
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

    // typedef union packed {
    //     HorizontalTrack h_track;
    //     VerticalTrack v_track;
    //     CircleTrack c_track;
    // } TrackType;

    localparam int TRACK_COUNT = 12;

endpackage