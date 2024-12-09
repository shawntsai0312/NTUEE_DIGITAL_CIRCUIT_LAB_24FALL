import game_pkg::*;
import sram_pkg::*;

module ColorDecoder (
    input game_pkg::ObjectID i_object_id,
    input [sram_pkg::COLOR_WIDTH-1:0] i_encoded_color,
    input [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] i_car1_mass_level,
    input [game_pkg::CAR_MASS_LEVEL_NUM_WIDTH-1:0] i_car2_mass_level,
    output [23:0] o_decoded_color
);
    wire [23:0] map_color [0:15];
    map_palette u_map_palette (
        .color_map    (map_color)
    );

    wire [23:0] bar_color [0:15];
    bar_palette u_bar_palette (
        .color_bar    (bar_color)
    );

    wire [23:0] bar_digit_color [0:15];
    bar_digit_palette u_bar_digit_palette (
        .color_map    (bar_digit_color)
    );

    wire [23:0] car1_color [0:15];
    car1_palette u_car1_palette (
        .color_map    (car1_color)
    );

    wire [23:0] car2_color [0:15];
    car2_palette u_car2_palette (
        .color_map    (car2_color)
    );

    wire [23:0] carCircle_color [0:15];
    carCircle_palette u_carCircle_palette (
        .color_map    (carCircle_color)
    );

    reg [23:0] decoded_color;
    assign o_decoded_color = decoded_color;
    always @(*) begin
        decoded_color = 24'hffffff;
        case(i_object_id)
            game_pkg::OBJECT_MAP            : decoded_color = map_color[i_encoded_color];
            game_pkg::OBJECT_BAR            : decoded_color = bar_color[i_encoded_color];
            game_pkg::OBJECT_BAR_DIGIT      : decoded_color = bar_digit_color[i_encoded_color];
            game_pkg::OBJECT_CAR1           : decoded_color = car1_color[i_encoded_color];
            game_pkg::OBJECT_CAR2           : decoded_color = car2_color[i_encoded_color];
            game_pkg::OBJECT_CAR1_CIRCLE    : decoded_color = carCircle_color[i_encoded_color];
            game_pkg::OBJECT_CAR2_CIRCLE    : decoded_color = carCircle_color[i_encoded_color];
        endcase
    end
endmodule
