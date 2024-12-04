`define DEFAULT_FRAME_H 1600
`define DEFAULT_FRAME_V 900
`define DEFAULT_FRAME_RATE 60

import sram_pkg::*;

module VGA #(
    parameter H_SIZE = `DEFAULT_FRAME_H, // 默认宽度
    parameter V_SIZE = `DEFAULT_FRAME_V, // 默认高度
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

    output [sram_pkg::MAP_H_WIDTH-1:0] o_H_to_be_rendered,
    output [sram_pkg::MAP_V_WIDTH-1:0] o_V_to_be_rendered,
    output o_render_clk
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

    reg [1:0] H_state, H_state_nxt;
    reg [sram_pkg::MAP_H_WIDTH-1:0] H_counter, H_counter_nxt;

    reg [1:0] V_state, V_state_nxt;
    reg [sram_pkg::MAP_V_WIDTH-1:0] V_counter, V_counter_nxt;

    reg V_sync, V_sync_nxt, H_sync, H_sync_nxt;
    assign o_H_sync = H_sync;
    assign o_V_sync = V_sync;

    reg RGB_valid, RGB_valid_nxt;
    assign o_RGB_valid = RGB_valid;

    reg [31:0] frame_counter, frame_counter_nxt;
    assign o_frame_counter = frame_counter;

    // three cycles before setting RGB output
    reg [sram_pkg::MAP_H_WIDTH-1:0] H_to_be_rendered, H_to_be_rendered_nxt;
    reg render_clk, render_clk_nxt;
    assign o_H_to_be_rendered = H_to_be_rendered;
    assign o_V_to_be_rendered = V_counter;
    assign o_render_clk = render_clk;

    // RGB logic
    always @(*) begin
        RGB_nxt = 0;
        RGB_valid_nxt = 0;
        if (H_state == S_C && V_state == S_C) begin
            RGB_valid_nxt = 1;
            RGB_nxt = i_color;
            // if (H_counter <= H_SIZE/8)  RGB_nxt = 24'hff0000;
            // else if (H_counter <= H_SIZE/8*2) RGB_nxt = 24'hffff00;
            // else if (H_counter <= H_SIZE/8*3) RGB_nxt = 24'h00ff00;
            // else if (H_counter <= H_SIZE/8*4) RGB_nxt = 24'h00ffff;
            // else if (H_counter <= H_SIZE/8*5) RGB_nxt = 24'h0000ff;
            // else if (H_counter <= H_SIZE/8*6) RGB_nxt = 24'hff00ff;
            // else if (H_counter <= H_SIZE/8*7) RGB_nxt = 24'h000000;
            // else if (H_counter <= H_SIZE) RGB_nxt = 24'hffffff;
        end
    end

    // to be rendered logic
    // ASK_RENDER_CYLCES cylces before setting RGB output
    // set (H,V)=(1,1) when (H_state, V_state) = (S_B, S_C), (H_counter, V_counter) = (H_B-ASK_RENDER_CYLCES, V_B)
    always @(*) begin
        H_to_be_rendered_nxt = 0;

        if (H_to_be_rendered == H_SIZE) begin
            H_to_be_rendered_nxt = 0;
        end
        else begin
            H_to_be_rendered_nxt = H_to_be_rendered + 1;
        end

        if (H_state == S_B) begin
            if (H_counter == H_B-ASK_RENDER_CYLCES) begin
                H_to_be_rendered_nxt = 1;
            end
        end
    end

    always @(*) begin
        render_clk_nxt = render_clk;
        if (H_state == S_B && V_state == S_C) begin
            if (H_counter == H_B-ASK_RENDER_CYLCES && V_counter == 1) begin
                render_clk_nxt = 1;
            end
        end
        if (H_to_be_rendered == H_SIZE && V_counter == V_SIZE) begin
            render_clk_nxt = 0;
        end
    end


    always @(*) begin
        H_state_nxt = H_state;
        H_counter_nxt = H_counter + 1;
        H_sync_nxt = !(H_state == S_A);

        case (H_state)
            S_B: begin 
                if (H_counter == H_B) begin
                    H_state_nxt = S_C;
                    H_counter_nxt = 1;
                end
            end
            S_C: begin 
                if (H_counter == H_SIZE) begin
                    H_state_nxt = S_D;
                    H_counter_nxt = 1;
                end
            end
            S_D: begin 
                if (H_counter == H_D) begin
                    H_state_nxt = S_A;
                    H_counter_nxt = 1;
                end
            end
            S_A: begin 
                if (H_counter == H_A) begin
                    H_state_nxt = S_B;
                    H_counter_nxt = 1;
                end
            end
        endcase
    end


    always @(*) begin
        V_state_nxt = V_state;
        V_counter_nxt = V_counter;
        V_sync_nxt = !(V_state == S_A);

        if (H_state == S_A && H_counter == H_A) begin
            V_counter_nxt = V_counter + 1;
            case (V_state)
                S_B: begin 
                    if (V_counter == V_B) begin
                        V_state_nxt = S_C;
                        V_counter_nxt = 1;
                    end
                end
                S_C: begin 
                    if (V_counter == V_SIZE) begin
                        V_state_nxt = S_D;
                        V_counter_nxt = 1;
                    end
                end
                S_D: begin 
                    if (V_counter == V_D) begin
                        V_state_nxt = S_A;
                        V_counter_nxt = 1;
                    end
                end
                S_A: begin 
                    if (V_counter == V_A) begin
                        V_state_nxt = S_B;
                        V_counter_nxt = 1;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        frame_counter_nxt = frame_counter;
        if((H_state == S_A) && (V_state == S_A)) begin
            if((H_counter == H_A) && (V_counter == V_A)) frame_counter_nxt = frame_counter + 1;
        end
    end
        
    always_ff @(posedge i_clk or negedge i_rst_n) begin 
        if (!i_rst_n) begin
            H_state <= S_B;
            H_counter <= 1;
            H_sync <= 1;
            V_state <= S_B;
            V_counter <= 1;
            V_sync <= 1;

            RGB <= 0;
            RGB_valid <= 0;

            frame_counter <= 0;

            H_to_be_rendered <= 0;
            render_clk <= 0;
        end
        else begin
            H_state <= H_state_nxt;
            H_counter <= H_counter_nxt;
            H_sync <= H_sync_nxt;
            V_state <= V_state_nxt;
            V_counter <= V_counter_nxt;
            V_sync <= V_sync_nxt;

            RGB <= RGB_nxt;
            RGB_valid <= RGB_valid_nxt;

            frame_counter <= frame_counter_nxt;

            H_to_be_rendered <= H_to_be_rendered_nxt;
            render_clk <= render_clk_nxt;
        end
    end

endmodule