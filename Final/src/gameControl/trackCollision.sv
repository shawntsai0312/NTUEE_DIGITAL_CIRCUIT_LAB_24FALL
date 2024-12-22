import sram_pkg::*;
import game_pkg::*;
import track_pkg::*;

module TrackCollision (
    input signed [sram_pkg::MAP_H_WIDTH-1:0] i_x,
    input signed [sram_pkg::MAP_V_WIDTH-1:0] i_y,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_v_x,
    input signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] i_v_y,
    input signed [sram_pkg::CAR_COOR_WIDTH-1:0] i_radius,
    // output [track_pkg::TRACK_COUNT-1:0] o_collision_all,
    // output [track_pkg::TRACK_COUNT-1:0] o_in_region_all,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x,
    output signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_y,
    output o_in_track0,
    output o_in_track1,
    output o_in_sand,
    output o_in_rock,
    output o_collision
);
    // ordinary
    HorizontalTrack track0 = '{
        x_left: -550,
        x_right: 530,
        y_top_border: -250,
        y_bottom_border: -365
    };

    // ordinary
    CircleTrack track1 = '{
        x_left: -770,
        x_right: -550,
        y_top: -150,
        y_bottom: -370,
        center_x: -550,
        center_y: -150,
        radius_inner: 100,
        radius_outer: 215
    };

    // ordinary
    VerticalTrack track2 = '{
        y_top: 150,
        y_bottom: -150,
        x_left_border: -765,
        x_right_border: -650
    };

    // ordinary
    CircleTrack track3 = '{
        x_left: -770,
        x_right: -330,
        y_top: 370,
        y_bottom: 150,
        center_x: -550,
        center_y: 150,
        radius_inner: 100,
        radius_outer: 215
    };

    // ordinary
    VerticalTrack track4 = '{
        y_top: 150,
        y_bottom: 0,
        x_left_border: -450,
        x_right_border: -335
    };

    // sand
    CircleTrack track5 = '{
        x_left: -455,
        x_right: -15,
        y_top: 0,
        y_bottom: -220,
        center_x: -235,
        center_y: 0,
        radius_inner: 100,
        radius_outer: 215
    };

    // sand
    VerticalTrack track6 = '{
        y_top: 150,
        y_bottom: 0,
        x_left_border: -135,
        x_right_border: -20
    };

    // sand
    CircleTrack track7 = '{
        x_left: -140,
        x_right: 80,
        y_top: 370,
        y_bottom: 150,
        center_x: 80,
        center_y: 150,
        radius_inner: 100,
        radius_outer: 215
    };

    // ordinary
    HorizontalTrack track8 = '{
        x_left: 80,
        x_right: 530,
        y_top_border: 365,
        y_bottom_border: 250
    };

    // rock
    CircleTrack track9 = '{
        x_left: 530,
        x_right: 750,
        y_top: 370,
        y_bottom: 150,
        center_x: 530,
        center_y: 150,
        radius_inner: 100,
        radius_outer: 215
    };

    // rock
    VerticalTrack track10 = '{
        y_top: 150,
        y_bottom: -150,
        x_left_border: 630,
        x_right_border: 745
    };

    // rock
    CircleTrack track11 = '{
        x_left: 530,
        x_right: 750,
        y_top: -150,
        y_bottom: -370,
        center_x: 530,
        center_y: -150,
        radius_inner: 100,
        radius_outer: 215
    };

    wire [track_pkg::TRACK_COUNT-1:0] collision;
    assign o_collision = |{collision};
    // assign o_collision_all = collision;

    wire [track_pkg::TRACK_COUNT-1:0] in_region;
    assign o_in_track0 = in_region[0];
    assign o_in_track1 = in_region[1];
    assign o_in_sand = in_region[5] | in_region[6] | in_region[7];
    assign o_in_rock = in_region[9] | in_region[10] | in_region[11];
    // assign o_in_region_all = in_region;

    HorizontalTrackCollision u_HorizontalTrackCollision_track0 (
        .i_track        (track0),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_in_region    (in_region[0]),
        .o_collision    (collision[0])
        
    );

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x_track1, o_v_y_track1;
    CircleTrackCollision u_CircleTrackCollision_track1 (
        .i_track        (track1),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_v_x          (o_v_x_track1),
        .o_v_y          (o_v_y_track1),
        .o_in_region    (in_region[1]),
        .o_collision    (collision[1])
    );

    VerticalTrackCollision u_VerticalTrackCollision_track2 (
        .i_track        (track2),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_radius       (i_radius),
        .o_in_region    (in_region[2]),
        .o_collision    (collision[2])   
    );

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x_track3, o_v_y_track3;
    CircleTrackCollision u_CircleTrackCollision_track3 (
        .i_track        (track3),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_v_x          (o_v_x_track3),
        .o_v_y          (o_v_y_track3),
        .o_in_region    (in_region[3]),
        .o_collision    (collision[3])
    );

    VerticalTrackCollision u_VerticalTrackCollision_track4 (
        .i_track        (track4),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_radius       (i_radius),
        .o_in_region    (in_region[4]),
        .o_collision    (collision[4])
    );

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x_track5, o_v_y_track5;
    CircleTrackCollision u_CircleTrackCollision_track5 (
        .i_track        (track5),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_v_x          (o_v_x_track5),
        .o_v_y          (o_v_y_track5),
        .o_in_region    (in_region[5]),
        .o_collision    (collision[5])
    );

    VerticalTrackCollision u_VerticalTrackCollision_track6 (
        .i_track        (track6),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_radius       (i_radius),
        .o_in_region    (in_region[6]),
        .o_collision    (collision[6])
    );

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x_track7, o_v_y_track7;
    CircleTrackCollision u_CircleTrackCollision_track7 (
        .i_track        (track7),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_v_x          (o_v_x_track7),
        .o_v_y          (o_v_y_track7),
        .o_in_region    (in_region[7]),
        .o_collision    (collision[7])
    );

    HorizontalTrackCollision u_HorizontalTrackCollision_track8 (
        .i_track        (track8),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_in_region    (in_region[8]),
        .o_collision    (collision[8])
    );

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x_track9, o_v_y_track9;
    CircleTrackCollision u_CircleTrackCollision_track9 (
        .i_track        (track9),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_v_x          (o_v_x_track9),
        .o_v_y          (o_v_y_track9),
        .o_in_region    (in_region[9]),
        .o_collision    (collision[9])
    );

    VerticalTrackCollision u_VerticalTrackCollision_track10 (
        .i_track        (track10),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_radius       (i_radius),
        .o_in_region    (in_region[10]),
        .o_collision    (collision[10])
    );

    wire signed [game_pkg::VELOCITY_INTEGER_WIDTH+game_pkg::VELOCITY_FRACTION_WIDTH-1:0] o_v_x_track11, o_v_y_track11;
    CircleTrackCollision u_CircleTrackCollision_track11 (
        .i_track        (track11),
        .i_x            (i_x),
        .i_y            (i_y),
        .i_v_x          (i_v_x),
        .i_v_y          (i_v_y),
        .i_radius       (i_radius),
        .o_v_x          (o_v_x_track11),
        .o_v_y          (o_v_y_track11),
        .o_in_region    (in_region[11]),
        .o_collision    (collision[11])
    );

    always @(*) begin
        o_v_x = i_v_x;
        o_v_y = i_v_y;

        if (collision[0]) begin
            // horizontal track 0
            o_v_x = i_v_x;
            o_v_y = 0;
        end
        else if (collision[1]) begin
            // circle track 1
            o_v_x = o_v_x_track1;
            o_v_y = o_v_y_track1;
        end
        else if (collision[2]) begin
            // vertical track 2
            o_v_x = 0;
            o_v_y = i_v_y;
        end
        else if (collision[3]) begin
            // circle track 3
            o_v_x = o_v_x_track3;
            o_v_y = o_v_y_track3;
        end
        else if (collision[4]) begin
            // vertical track 4
            o_v_x = 0;
            o_v_y = i_v_y;
        end
        else if (collision[5]) begin
            // circle track 5
            o_v_x = o_v_x_track5;
            o_v_y = o_v_y_track5;
        end
        else if (collision[6]) begin
            // vertical track 6
            o_v_x = 0;
            o_v_y = i_v_y;
        end
        else if (collision[7]) begin
            // circle track 7
            o_v_x = o_v_x_track7;
            o_v_y = o_v_y_track7;
        end
        else if (collision[8]) begin
            // horizontal track 8
            o_v_x = i_v_x;
            o_v_y = 0;
        end
        else if (collision[9]) begin
            // circle track 9
            o_v_x = o_v_x_track9;
            o_v_y = o_v_y_track9;
        end
        else if (collision[10]) begin
            // vertical track 10
            o_v_x = 0;
            o_v_y = i_v_y;
        end
        else if (collision[11]) begin
            // circle track 11
            o_v_x = o_v_x_track11;
            o_v_y = o_v_y_track11;
        end
        else begin
            o_v_x = i_v_x;
            o_v_y = i_v_y;
        end
    end

endmodule