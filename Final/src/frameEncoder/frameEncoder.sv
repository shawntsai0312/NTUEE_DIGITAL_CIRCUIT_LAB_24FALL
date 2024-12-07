import game_pkg::*;
import sram_pkg::*;

module FrameEncoder (
    input i_clk,
    input i_rst_n,
    input i_start,
    input signed [game_pkg::ANG_WIDTH-1:0] i_car1_angle,
    input signed [game_pkg::ANG_WIDTH-1:0] i_car2_angle,
    output [sram_pkg::SRAM_ADDR_COUNT-1:0] o_sram_addr,
    output [sram_pkg::SRAM_DATA_WIDTH-1:0] o_sram_data,
    output o_sram_writing,
    output game_pkg::ObjectID o_object_id,
    output [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] o_pixel_counter,
    output o_opacity,
    output o_opacity_valid,
    output o_done
);

    localparam S_IDLE = 0;
    localparam S_PROC = 1;
    localparam S_DONE = 2;
    
    reg [3:0] state_r, state_w;
    assign o_done = (state_r == S_DONE);

    wire pixel_rotate_done;
    assign o_opacity_valid = pixel_rotate_done;

    reg sram_writing_r, sram_writing_w;
    assign o_sram_writing = sram_writing_r;

    reg [game_pkg::OBJECT_OPACITY_NUM_WIDTH-1:0] proc_counter_r, proc_counter_w;

    reg start_rotator_r, start_rotator_w;

    reg [2*sram_pkg::IMAGE_COOR_WIDTH-1:0] pixel_counter_r, pixel_counter_w;
    assign o_pixel_counter = pixel_counter_r;
    
    reg signed [game_pkg::ANG_WIDTH-1:0] angle_r, angle_w;

    reg [sram_pkg::COLOR_WIDTH-1:0] lut_data_r [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    reg [sram_pkg::COLOR_WIDTH-1:0] lut_data_w [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];

    wire [sram_pkg::COLOR_WIDTH-1:0] car1_lut_data [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    car1_lut u_car1_lut (
        .pixel_data    (car1_lut_data)
    );

    wire [sram_pkg::COLOR_WIDTH-1:0] car2_lut_data [0:sram_pkg::IMAGE_SIZE-1][0:sram_pkg::IMAGE_SIZE-1];
    car2_lut u_car2_lut (
        .pixel_data    (car2_lut_data)
    );

    wire [sram_pkg::COLOR_WIDTH-1:0] encoded_pixel;
    
    wire [sram_pkg::IMAGE_COOR_WIDTH-1:0] H_to_be_processed;
    wire [sram_pkg::IMAGE_COOR_WIDTH-1:0] V_to_be_processed;
    
    game_pkg::ObjectID object_id;
    assign o_object_id = object_id;


    ImageRotator #(
        .ANG_WIDTH          (game_pkg::ANG_WIDTH)
    ) u_ImageRotator (
        .i_clk                  (i_clk),
        .i_rst_n                (i_rst_n),
        .i_start                (start_rotator_r),
        .i_angle                (angle_r),
        .i_lut_data             (lut_data_r),
        .o_encoded_pixel        (encoded_pixel),
        .o_opacity              (o_opacity),
        .o_H_to_be_processed    (H_to_be_processed),
        .o_V_to_be_processed    (V_to_be_processed),
        .o_valid                (pixel_rotate_done)
    );

    SramEncoder u_SramEncoder (
        .i_clk                     (i_clk),
        .i_rst_n                   (i_rst_n),
        .i_encoded_color           (encoded_pixel),
        .i_object_id               (object_id),
        .i_object_pixel_counter    (pixel_counter_r),
        .o_sram_addr               (o_sram_addr),
        .o_sram_data               (o_sram_data)
    );

    always @(*) begin
        object_id = game_pkg::OBJECT_MAP;
        case (proc_counter_r)
            0: object_id = game_pkg::OBJECT_CAR1;
            1: object_id = game_pkg::OBJECT_CAR2;
        endcase
    end

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if(i_start) state_w = S_PROC;
                else        state_w = S_IDLE;
            end
            S_PROC: begin
                if(proc_counter_r == game_pkg::OBJECT_OPACITY_NUM)    state_w = S_DONE;
                else                                                    state_w = S_PROC;
            end
            S_DONE: if(!i_start) state_w = S_IDLE;
        endcase
    end

    always @(*) begin
        sram_writing_w = pixel_rotate_done;
    end

    // proc counter logic
    always @(*) begin
        proc_counter_w = proc_counter_r;
        case (state_r)
            S_IDLE: begin
                proc_counter_w = 0;
            end
            S_PROC: begin
                if (pixel_counter_r == sram_pkg::IMAGE_SIZE*sram_pkg::IMAGE_SIZE - 1) begin
                    if (proc_counter_r == game_pkg::OBJECT_OPACITY_NUM) begin
                        proc_counter_w = proc_counter_r;
                    end
                    else begin
                        proc_counter_w = proc_counter_r + 1;
                    end
                end
                else begin
                    proc_counter_w = proc_counter_r;
                end
            end
            S_DONE: begin
                proc_counter_w = 0;
            end
        endcase
    end

    // start rotator logic
    always @(*) begin
        start_rotator_w = start_rotator_r;
        case (state_r)
            S_IDLE: begin
                start_rotator_w = 0;
            end
            S_PROC: begin
                if (proc_counter_r < game_pkg::OBJECT_OPACITY_NUM) begin
                    if (pixel_rotate_done) begin
                        if (H_to_be_processed == sram_pkg::IMAGE_SIZE-1 && V_to_be_processed == sram_pkg::IMAGE_SIZE-1) begin
                            start_rotator_w = 0;
                        end
                    end
                    else begin
                        if (H_to_be_processed == 0 && V_to_be_processed == 0) begin
                            start_rotator_w = 1;
                        end
                    end
                end
                else begin
                    start_rotator_w = 0;
                end
            end
            S_DONE: begin
                start_rotator_w = 0;
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
                    if (pixel_counter_r == sram_pkg::IMAGE_SIZE*sram_pkg::IMAGE_SIZE - 1) begin
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

    // input angle logic
    always @(*) begin
        angle_w = angle_r;
        case (state_r)
            S_IDLE: begin
                angle_w = 0;
            end
            S_PROC: begin
                case (proc_counter_r)
                    0: begin
                        angle_w = i_car1_angle;
                    end
                    1: begin
                        angle_w = i_car2_angle;
                    end
                endcase
            end
            S_DONE: begin
                angle_w = 0;
            end
        endcase
    end

    // lut_data logic
    genvar i, j;
    generate
        for (i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin : LUT_I
            for (j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin : LUT_J
                always @(state_r, proc_counter_r, lut_data_r[i][j], car1_lut_data[i][j], car2_lut_data[i][j]) begin
                    lut_data_w[i][j] = lut_data_r[i][j];
                    case (state_r)
                        S_IDLE: begin
                            lut_data_w[i][j] = lut_data_r[i][j];
                        end
                        S_PROC: begin
                            case (proc_counter_r)
                                0: begin
                                    lut_data_w[i][j] = car1_lut_data[i][j];
                                end
                                1: begin
                                    lut_data_w[i][j] = car2_lut_data[i][j];
                                end
                            endcase
                        end
                        S_DONE: begin
                            lut_data_w[i][j] = lut_data_r[i][j];
                        end
                    endcase
                end
            end
        end
    endgenerate

    // sequential logic
    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            proc_counter_r <= 0;
            pixel_counter_r <= 0;
            angle_r <= 0;
            start_rotator_r <= 0;
            sram_writing_r <= 0;
            for (integer i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin
                    lut_data_r[i][j] <= 0;
                end
            end
        end
        else begin
            state_r <= state_w;
            proc_counter_r <= proc_counter_w;
            pixel_counter_r <= pixel_counter_w;
            angle_r <= angle_w;
            start_rotator_r <= start_rotator_w;
            sram_writing_r <= sram_writing_w;
            for (integer i = 0; i < sram_pkg::IMAGE_SIZE; i = i + 1) begin
                for (integer j = 0; j < sram_pkg::IMAGE_SIZE; j = j + 1) begin
                    lut_data_r[i][j] <= lut_data_w[i][j];
                end
            end
        end
    end

endmodule