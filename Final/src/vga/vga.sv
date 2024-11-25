// // clock 25.2M
// `define H_SIZE 640
// `define V_SIZE 480
// `define FRAME_RATE 60
// `define H_A 96
// `define H_B 48
// `define H_D 16
// `define V_A 2
// `define V_B 33
// `define V_D 10

// clock 108M
`define H_SIZE 1600
`define V_SIZE 900
`define FRAME_RATE 60
`define H_A 24
`define H_B 80
`define H_D 96
`define V_A 1
`define V_B 3
`define V_D 96

module VGA (
    input i_clk,
    input i_rst_n,

    input [23:0] i_color,
    output [10:0] o_H_pos, // next pixel horizontal position (0 to 1599)
    output [9:0] o_V_pos, // next pixe veritcal position (0 to 899)
    output o_pos_valid,

    output o_H_sync, 
    output o_V_sync,
    output [7:0] o_R, 
    output [7:0] o_G, 
    output [7:0] o_B,
    output o_RGB_valid,
    output [31:0] o_frame_counter
);

    parameter S_B = 0; // back porch
    parameter S_C = 1; // active
    parameter S_D = 2; // front porch
    parameter S_A = 3; // sync


    reg [23:0] RGB, RGB_nxt;
    assign o_R = RGB[23:16];
    assign o_G = RGB[15: 8];
    assign o_B = RGB[ 7: 0];

    reg [1:0] H_STATE, H_STATE_nxt;
    reg [10:0] H_counter, H_counter_nxt;

    reg [1:0] V_STATE, V_STATE_nxt;
    reg [9:0] V_counter, V_counter_nxt;

    reg V_sync, V_sync_nxt, H_sync, H_sync_nxt;
    assign o_H_sync = H_sync;
    assign o_V_sync = V_sync;

    reg RGB_valid, RGB_valid_nxt;
    assign o_RGB_valid = RGB_valid;

    reg [31:0] frame_counter, frame_counter_nxt;
    assign o_frame_counter = frame_counter;

    reg [10:0] H_pos, H_pos_nxt;
    reg [9:0] V_pos, V_pos_nxt;
    reg pos_valid, pos_valid_nxt;
    assign o_H_pos = H_pos;
    assign o_V_pos = V_pos;
    assign o_pos_valid = pos_valid;

    // RGB logic
    always @(*) begin
        RGB_nxt = 0;
        RGB_valid_nxt = 0;
        if (H_STATE == S_C && V_STATE == S_C) begin
            RGB_valid_nxt = 1;
            RGB_nxt = i_color;
        end
    end

    // position logic
    // set two cylces before setting RGB output
    always @(*) begin
        H_pos_nxt = H_pos;
        V_pos_nxt = V_pos;
        pos_valid_nxt = pos_valid;

    end


    always @(*) begin
        H_STATE_nxt = H_STATE;
        H_counter_nxt = H_counter + 1;
        H_sync_nxt = !(H_STATE == S_A);

        case (H_STATE)
            S_B: begin 
                if (H_counter == `H_B) begin
                    H_STATE_nxt = S_C;
                    H_counter_nxt = 1;
                end
            end
            S_C: begin 
                if (H_counter == `H_SIZE) begin
                    H_STATE_nxt = S_D;
                    H_counter_nxt = 1;
                end
            end
            S_D: begin 
                if (H_counter == `H_D) begin
                    H_STATE_nxt = S_A;
                    H_counter_nxt = 1;
                end
            end
            S_A: begin 
                if (H_counter == `H_A) begin
                    H_STATE_nxt = S_B;
                    H_counter_nxt = 1;
                end
            end
        endcase
    end


    always @(*) begin
        V_STATE_nxt = V_STATE;
        V_counter_nxt = V_counter;
        V_sync_nxt = !(V_STATE == S_A);

        if (H_STATE == S_A && H_counter == `H_A) begin
            V_counter_nxt = V_counter + 1;
            case (V_STATE)
                S_B: begin 
                    if (V_counter == `V_B) begin
                        V_STATE_nxt = S_C;
                        V_counter_nxt = 1;
                    end
                end
                S_C: begin 
                    if (V_counter == `V_SIZE) begin
                        V_STATE_nxt = S_D;
                        V_counter_nxt = 1;
                    end
                end
                S_D: begin 
                    if (V_counter == `V_D) begin
                        V_STATE_nxt = S_A;
                        V_counter_nxt = 1;
                    end
                end
                S_A: begin 
                    if (V_counter == `V_A) begin
                        V_STATE_nxt = S_B;
                        V_counter_nxt = 1;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        frame_counter_nxt = frame_counter;
        if((H_STATE == S_A) && (V_STATE == S_A)) begin
            if((H_counter == `H_A) && (V_counter == `V_A)) frame_counter_nxt = frame_counter + 1;
        end
    end
        
    always_ff @(posedge i_clk or negedge i_rst_n) begin 
        if (!i_rst_n) begin
            H_STATE <= S_B;
            H_counter <= 1;
            H_sync <= 1;
            V_STATE <= S_B;
            V_counter <= 1;
            V_sync <= 1;
            RGB <= 0;
            frame_counter <= 0;
            RGB_valid <= 0;
            H_pos <= 0;
            V_pos <= 0;
            pos_valid <= 0;
        end
        else begin
            H_STATE <= H_STATE_nxt;
            H_counter <= H_counter_nxt;
            H_sync <= H_sync_nxt;
            V_STATE <= V_STATE_nxt;
            V_counter <= V_counter_nxt;
            V_sync <= V_sync_nxt;
            RGB <= RGB_nxt;
            frame_counter <= frame_counter_nxt;
            RGB_valid <= RGB_valid_nxt;
            H_pos <= H_pos_nxt;
            V_pos <= V_pos_nxt;
            pos_valid <= pos_valid_nxt;
        end
    end

endmodule