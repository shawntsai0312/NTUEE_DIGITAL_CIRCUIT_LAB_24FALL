package object_pkg;
    localparam int OBJECT_OPACITY_NUM = 2; // no map and bar and ?blocks
    localparam int OBJECT_OPACITY_NUM_WIDTH = 2;
    typedef enum logic [3:0] {
        OBJECT_MAP  = 4'd0,
        OBJECT_BAR  = 4'd1,
        OBJECT_CAR1 = 4'd2, 
        OBJECT_CAR2 = 4'd3
    } ObjectID;
endpackage

// usage:
// import object_pkg::*;

// module example_module (
//     input ObjectID id
// );
//     always @(*) begin
//         case (id)
//             OBJECT_MAP:  $display("Map selected");
//             OBJECT_CAR1: $display("Car1 selected");
//             OBJECT_CAR2: $display("Car2 selected");
//         endcase
//     end
// endmodule
