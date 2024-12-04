import object_pkg::*;
import sram_pkg::*;

module ColorDecoder (
    input object_pkg::ObjectID i_object_id,
    input [sram_pkg::COLOR_WIDTH-1:0] i_encoded_color,
    output [23:0] o_decoded_color
);
    wire [23:0] map_color [0:15];
    map_palette u_map_palette (
        .color_map    (map_color)
    );

    wire [23:0] car1_color [0:15];
    car1_palette u_car1_palette (
        .color_map    (color_map)
    );

    wire [23:0] car2_color [0:15];
    car2_palette u_car2_palette (
        .color_map    (color_map)
    );

    reg [23:0] decoded_color;
    assign o_decoded_color = decoded_color;
    always @(*) begin
        decoded_color = 24'b0;
        case(i_object_id)
            object_pkg::OBJECT_MAP  : decoded_color = map_color[i_encoded_color];
            object_pkg::OBJECT_CAR1 : decoded_color = car1_color[i_encoded_color];
            object_pkg::OBJECT_CAR2 : decoded_color = car2_color[i_encoded_color];
        endcase
        if(decoded_color == 24'b0) begin
            // $display("ColorDecoder: object_id %d, encoded_color %d", i_object_id, i_encoded_color);
            decoded_color = 24'hffffff; // default background color
        end
    end
endmodule
