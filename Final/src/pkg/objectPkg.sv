package object_pkg;
    localparam int OBJECT_OPACITY_NUM = 2; // no map and bar and ?blocks
    localparam int OBJECT_OPACITY_NUM_WIDTH = 2;
    typedef enum logic [1:0] {
        OBJECT_MAP  = 0,
        OBJECT_CAR1 = 1, 
        OBJECT_CAR2 = 2
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
