`define DEFAULT_H_SIZE 1600
`define DEFAULT_V_SIZE 900
`define DEFAULT_FRAME_RATE 60

module VGA #(
    parameter H_SIZE = `DEFAULT_H_SIZE, // 默认宽度
    parameter V_SIZE = `DEFAULT_V_SIZE, // 默认高度
    parameter FRAME_RATE = `DEFAULT_FRAME_RATE // 默认帧率
)(
    input i_clk,
    input i_rst_n,

    input [23:0] i_color,

    output o_H_sync, 
    output o_V_sync,

    output [23:0] o_RGB,
    output o_RGB_valid,

    output [31:0] o_frame_counter,

    output [11:0] o_H_to_be_rendered,
    output [10:0] o_V_to_be_rendered,
    output o_to_be_rendered_valid
);

    // Timing parameters for different resolutions and frame rates
    localparam VGA_640x480_H_A = 96, VGA_640x480_H_B = 48, VGA_640x480_H_D = 16;
    localparam VGA_640x480_V_A = 2, VGA_640x480_V_B = 33, VGA_640x480_V_D = 10;

    localparam VGA_1600x900_H_A = 24, VGA_1600x900_H_B = 80, VGA_1600x900_H_D = 96;
    localparam VGA_1600x900_V_A = 1, VGA_1600x900_V_B = 3, VGA_1600x900_V_D = 96;

    // Dynamically select timing parameters at elaboration
    localparam H_A = (H_SIZE == 640 && V_SIZE == 480 && FRAME_RATE == 60) ? VGA_640x480_H_A :
                     (H_SIZE == 1600 && V_SIZE == 900 && FRAME_RATE == 60) ? VGA_1600x900_H_A :
                     VGA_1600x900_H_A; // Default value

    localparam H_B = (H_SIZE == 640 && V_SIZE == 480 && FRAME_RATE == 60) ? VGA_640x480_H_B :
                     (H_SIZE == 1600 && V_SIZE == 900 && FRAME_RATE == 60) ? VGA_1600x900_H_B :
                     VGA_1600x900_H_B; // Default value

    localparam H_D = (H_SIZE == 640 && V_SIZE == 480 && FRAME_RATE == 60) ? VGA_640x480_H_D :
                     (H_SIZE == 1600 && V_SIZE == 900 && FRAME_RATE == 60) ? VGA_1600x900_H_D :
                     VGA_1600x900_H_D; // Default value

    localparam V_A = (H_SIZE == 640 && V_SIZE == 480 && FRAME_RATE == 60) ? VGA_640x480_V_A :
                     (H_SIZE == 1600 && V_SIZE == 900 && FRAME_RATE == 60) ? VGA_1600x900_V_A :
                     VGA_1600x900_V_A; // Default value

    localparam V_B = (H_SIZE == 640 && V_SIZE == 480 && FRAME_RATE == 60) ? VGA_640x480_V_B :
                     (H_SIZE == 1600 && V_SIZE == 900 && FRAME_RATE == 60) ? VGA_1600x900_V_B :
                     VGA_1600x900_V_B; // Default value

    localparam V_D = (H_SIZE == 640 && V_SIZE == 480 && FRAME_RATE == 60) ? VGA_640x480_V_D :
                     (H_SIZE == 1600 && V_SIZE == 900 && FRAME_RATE == 60) ? VGA_1600x900_V_D :
                     VGA_1600x900_V_D; // Default value

    parameter S_B = 0; // back porch
    parameter S_C = 1; // active
    parameter S_D = 2; // front porch
    parameter S_A = 3; // sync

    parameter ASK_RENDER_CYLCES = 2;


    reg [23:0] RGB, RGB_nxt;
    assign o_RGB = RGB;

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

    // three cycles before setting RGB output
    reg [10:0] H_to_be_rendered, H_to_be_rendered_nxt;
    reg to_be_rendered_valid, to_be_rendered_valid_nxt;
    assign o_H_to_be_rendered = H_to_be_rendered;
    assign o_V_to_be_rendered = V_counter;
    assign o_to_be_rendered_valid = to_be_rendered_valid;

    // RGB logic
    always @(*) begin
        RGB_nxt = 0;
        RGB_valid_nxt = 0;
        if (H_STATE == S_C && V_STATE == S_C) begin
            RGB_valid_nxt = 1;
            // RGB_nxt = i_color;
            if (H_counter <= H_SIZE/8)  RGB_nxt = 24'hff0000;
            else if (H_counter <= H_SIZE/8*2) RGB_nxt = 24'hffff00;
            else if (H_counter <= H_SIZE/8*3) RGB_nxt = 24'h00ff00;
            else if (H_counter <= H_SIZE/8*4) RGB_nxt = 24'h00ffff;
            else if (H_counter <= H_SIZE/8*5) RGB_nxt = 24'h0000ff;
            else if (H_counter <= H_SIZE/8*6) RGB_nxt = 24'hff00ff;
            else if (H_counter <= H_SIZE/8*7) RGB_nxt = 24'h000000;
            else if (H_counter <= H_SIZE) RGB_nxt = 24'hffffff;
        end
    end

    // to be rendered logic
    // ASK_RENDER_CYLCES cylces before setting RGB output
    // set (H,V)=(1,1) when (H_STATE, V_STATE) = (S_B, S_C), (H_counter, V_counter) = (H_B-ASK_RENDER_CYLCES, V_B)
    always @(*) begin
        H_to_be_rendered_nxt = 0;

        if (H_to_be_rendered == H_SIZE) begin
            H_to_be_rendered_nxt = 0;
        end
        else begin
            H_to_be_rendered_nxt = H_to_be_rendered + 1;
        end

        if (H_STATE == S_B) begin
            if (H_counter == H_B-ASK_RENDER_CYLCES) begin
                H_to_be_rendered_nxt = 1;
            end
        end
    end

    always @(*) begin
        to_be_rendered_valid_nxt = to_be_rendered_valid;
        if (H_STATE == S_B && V_STATE == S_C) begin
            if (H_counter == H_B-ASK_RENDER_CYLCES && V_counter == 1) begin
                to_be_rendered_valid_nxt = 1;
            end
        end
        if (H_to_be_rendered == H_SIZE && V_counter == V_SIZE) begin
            to_be_rendered_valid_nxt = 0;
        end
    end


    always @(*) begin
        H_STATE_nxt = H_STATE;
        H_counter_nxt = H_counter + 1;
        H_sync_nxt = !(H_STATE == S_A);

        case (H_STATE)
            S_B: begin 
                if (H_counter == H_B) begin
                    H_STATE_nxt = S_C;
                    H_counter_nxt = 1;
                end
            end
            S_C: begin 
                if (H_counter == H_SIZE) begin
                    H_STATE_nxt = S_D;
                    H_counter_nxt = 1;
                end
            end
            S_D: begin 
                if (H_counter == H_D) begin
                    H_STATE_nxt = S_A;
                    H_counter_nxt = 1;
                end
            end
            S_A: begin 
                if (H_counter == H_A) begin
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

        if (H_STATE == S_A && H_counter == H_A) begin
            V_counter_nxt = V_counter + 1;
            case (V_STATE)
                S_B: begin 
                    if (V_counter == V_B) begin
                        V_STATE_nxt = S_C;
                        V_counter_nxt = 1;
                    end
                end
                S_C: begin 
                    if (V_counter == V_SIZE) begin
                        V_STATE_nxt = S_D;
                        V_counter_nxt = 1;
                    end
                end
                S_D: begin 
                    if (V_counter == V_D) begin
                        V_STATE_nxt = S_A;
                        V_counter_nxt = 1;
                    end
                end
                S_A: begin 
                    if (V_counter == V_A) begin
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
            if((H_counter == H_A) && (V_counter == V_A)) frame_counter_nxt = frame_counter + 1;
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
            RGB_valid <= 0;

            frame_counter <= 0;

            H_to_be_rendered <= 0;
            to_be_rendered_valid <= 0;
        end
        else begin
            H_STATE <= H_STATE_nxt;
            H_counter <= H_counter_nxt;
            H_sync <= H_sync_nxt;
            V_STATE <= V_STATE_nxt;
            V_counter <= V_counter_nxt;
            V_sync <= V_sync_nxt;

            RGB <= RGB_nxt;
            RGB_valid <= RGB_valid_nxt;

            frame_counter <= frame_counter_nxt;

            H_to_be_rendered <= H_to_be_rendered_nxt;
            to_be_rendered_valid <= to_be_rendered_valid_nxt;
        end
    end

endmodule