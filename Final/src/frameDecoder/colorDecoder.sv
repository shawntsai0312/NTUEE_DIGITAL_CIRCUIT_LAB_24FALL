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
        .color_map    (bar_color)
    );

    wire [23:0] barDigit_color [0:15];
    barDigit_palette u_barDigit_palette (
        .color_map    (barDigit_color)
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

    wire [23:0] idleBackground_color [0:15];
    idleBackground_palette u_idleBackground_palette (
        .color_map    (idleBackground_color)
    );

    wire [23:0] start_color [0:15];
    start_palette u_start_palette (
        .color_map    (start_color)
    );

    wire [23:0] win_color [0:15];
    win_palette u_win_palette (
        .color_map    (win_color)
    );

    wire [23:0] lose_color [0:15];
    lose_palette u_lose_palette (
        .color_map    (lose_color)
    );

    wire [23:0] qblock_color [0:15];
    qblock_palette u_qblock_palette (
        .color_map    (qblock_color)
    );

    reg [23:0] decoded_color;
    assign o_decoded_color = decoded_color;
    always @(*) begin
        decoded_color = 24'hffffff;
        case(i_object_id)
            game_pkg::OBJECT_MAP            : decoded_color = map_color[i_encoded_color];
            game_pkg::OBJECT_BAR            : decoded_color = bar_color[i_encoded_color];
            game_pkg::OBJECT_BAR_DIGIT      : decoded_color = barDigit_color[i_encoded_color];
            game_pkg::OBJECT_CAR1           : decoded_color = car1_color[i_encoded_color];
            game_pkg::OBJECT_CAR2           : decoded_color = car2_color[i_encoded_color];
            game_pkg::OBJECT_CAR1_CIRCLE    : decoded_color = carCircle_color[i_encoded_color];
            game_pkg::OBJECT_CAR2_CIRCLE    : decoded_color = carCircle_color[i_encoded_color];
            game_pkg::OBJECT_START_CAPTION  : decoded_color = start_color[i_encoded_color];
            game_pkg::OBJECT_WIN_CAPTION    : decoded_color = win_color[i_encoded_color];
            game_pkg::OBJECT_LOSE_CAPTION   : decoded_color = lose_color[i_encoded_color];
            game_pkg::OBJECT_IDLE_BG        : decoded_color = idleBackground_color[i_encoded_color];
            game_pkg::OBJECT_QBLOCK : decoded_color = qblock_color[i_encoded_color];
        endcase
    end
endmodule
