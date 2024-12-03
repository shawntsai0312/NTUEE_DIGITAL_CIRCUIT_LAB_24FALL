import object_pkg;
import sram_pkg;

module FrameEncoder (
    input i_clk,
    input i_rst_n,
    input i_start,
    input signed [sram_pkg::ANG_WIDTH-1:0] i_car1_angle,
    input signed [sram_pkg::ANG_WIDTH-1:0] i_car2_angle,
    output [sram_pkg::SRAM_ADDR_COUNT-1:0] o_sram_addr,
    output [sram_pkg::SRAM_DATA_WIDTH-1:0] o_sram_data,
    output [sram_pkg::OBJECT_OPACITY_NUM_WIDTH-1:0] o_proc_counter,
    output [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] o_pixel_counter,
    output o_opacity,
    output o_opacity_valid,
    // output o_opacity_map [0:object_pkg::OBJECT_OPACITY_NUM-1][0:sram_pkg::MAP_V-1][0:sram_pkg::MAP_H-1],
    output o_done
);

    localparam S_IDLE = 0;
    localparam S_PROC = 1;
    localparam S_DONE = 2;
    
    reg [3:0] state_r, state_w;
    assign o_done = (state_r == S_DONE);
    assign o_opacity_valid = (state_r == S_PROC);

    reg [sram_pkg::OBJECT_OPACITY_NUM_WIDTH-1:0] proc_counter_r, proc_counter_w;
    assign o_proc_counter = proc_counter_r;

    reg [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] pixel_counter_r, pixel_counter_w;
    assign o_pixel_counter = pixel_counter_r;
    
    reg signed [sram_pkg::ANG_WIDTH-1:0] angle_r, angle_w;

    // reg opacity_map_r [0:object_pkg::OBJECT_OPACITY_NUM-1][0:sram_pkg::MAP_V-1][0:sram_pkg::MAP_H-1];
    // reg opacity_map_w [0:object_pkg::OBJECT_OPACITY_NUM-1][0:sram_pkg::MAP_V-1][0:sram_pkg::MAP_H-1];
    // assign o_opacity_map = opacity_map_r;

    reg lut_data_r [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    reg lut_data_w [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];

    wire [sram_pkg::COLOR_WIDTH-1:0] car1_lut_data [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    car1_lut u_car1_lut (
        .pixel_data    (car1_lut_data)
    );

    wire [sram_pkg::COLOR_WIDTH-1:0] car2_lut_data [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    car2_lut u_car2_lut (
        .pixel_data    (car2_lut_data)
    );

    wire [sram_pkg::COLOR_WIDTH-1:0] encoded_pixel;
    // wire opacity_transformed;
    wire [sram_pkg::IMAGE_COOR_WIDTH-1:0] H_transformed;
    wire [sram_pkg::IMAGE_COOR_WIDTH-1:0] V_transformed;
    wire pixel_rotate_done;

    ImageRotator #(
        .ANG_WIDTH          (sram_pkg::ANG_WIDTH);
    ) u_ImageRotator (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_start            (o_opacity_valid),
        .i_angle            (angle_r),
        .i_lut_data         (lut_data_r),
        .o_encoded_pixel    (encoded_pixel),
        .o_opacity          (o_opacity),
        .o_H_transformed    (H_transformed),
        .o_V_transformed    (V_transformed),
        .o_valid            (pixel_rotate_done)
    );

    SramEncoder u_SramEncoder (
        .i_clk                     (i_clk),
        .i_rst_n                   (i_rst_n),
        .i_encoded_color           (encoded_pixel),
        .i_object_id               (),
        .i_object_pixel_counter    (pixel_counter_r),
        .o_sram_addr               (o_sram_addr),
        .o_sram_data               (o_sram_data)
    );

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if(i_start) state_w = S_PROC;
                else        state_w = S_IDLE;
            end
            S_PROC: begin
                if(proc_counter_r == sram::OBJECT_OPACITY_NUM)  state_w = S_DONE;
                else                                            state_w = S_PROC;
            end
            S_DONE: state_w = S_IDLE;
        endcase
    end

    // proc counter logic
    always @(*) begin
        proc_counter_w = proc_counter_r;
        case (state_r)
            S_IDLE: begin
                proc_counter_w = 0;
            end
            S_PROC: begin
                if (pixel_counter_r == sram_pkg::IMAGE_SIZE*sram_pkg::IMAGE_SIZE) begin
                    if (proc_counter_r == object_pkg::OBJECT_OPACITY_NUM) begin
                        proc_counter_w = 0;
                    end
                    else begin
                        proc_counter_w = proc_counter_r + 1;
                    end
                end
            end
            S_DONE: begin
                proc_counter_w = 0;
            end
        endcase
    end

    // pixel counter logic
    always @(*) begin
        pixel_counter_w = pixel_counter_r;
        case (state_r)
            S_IDLE: begin
                pixel_counter_w = 0;
            end
            S_PROC: begin
                if (pixel_rotate_done) begin
                    if (pixel_counter_r == sram_pkg::IMAGE_SIZE*sram_pkg::IMAGE_SIZE) begin
                        pixel_counter_w = 0;
                    end
                    else begin
                        pixel_counter_w = pixel_counter_r + 1;
                    end
                end
            end
            S_DONE: begin
                pixel_counter_w = 0;
            end
        endcase
    end

    // input angle / lut_data logic
    always @(*) begin
        angle_w = angle_r;
        lut_data_w = lut_data_r;
        case (state_r)
            S_IDLE: begin
                angle_w = 0;
                lut_data_w = lut_data_r;
            end
            S_PROC: begin
                case (proc_counter_r)
                    0: begin
                        angle_w = i_car1_angle;
                        lut_data_w = car1_lut_data;
                    end
                    1: begin
                        angle_w = i_car2_angle;
                        lut_data_w = car2_lut_data;
                    end
                endcase
            end
            S_DONE: begin
                angle_w = 0;
                lut_data_w = lut_data_r;
            end
        endcase
    end

    // sequential logic
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            proc_counter_r <= 0;
            pixel_counter_r <= 0;
            angle_r <= 0;
            for (integer i = 0; i < object_pkg::OBJECT_OPACITY_NUM; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::MAP_V; j = j + 1) begin
                    lut_data_r[i][j] <= 0;
                end
            end
            // for (integer i = 0; i < object_pkg::OBJECT_OPACITY_NUM; i = i + 1) begin
            //     for (integer j = 0; j < sram_pkg::MAP_V; j = j + 1) begin
            //         for (integer k = 0; k < sram_pkg::MAP_H; k = k + 1) begin
            //             opacity_map_r[i][j][k] <= 0;
            //         end
            //     end
            // end
        end
        else begin
            state_r <= state_w;
            proc_counter_r <= proc_counter_w;
            pixel_counter_r <= pixel_counter_w;
            angle_r <= angle_w;
            for (integer i = 0; i < object_pkg::OBJECT_OPACITY_NUM; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::MAP_V; j = j + 1) begin
                    lut_data_r[i][j] <= lut_data_w[i][j];
                end
            end
            // for (integer i = 0; i < object_pkg::OBJECT_OPACITY_NUM; i = i + 1) begin
            //     for (integer j = 0; j < sram_pkg::MAP_V; j = j + 1) begin
            //         for (integer k = 0; k < sram_pkg::MAP_H; k = k + 1) begin
            //             opacity_map_r[i][j][k] <= opacity_map_w[i][j][k];
            //         end
            //     end
            // end
        end
    end

endmodule