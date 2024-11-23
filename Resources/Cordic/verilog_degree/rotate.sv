`define DEFAULT_VEC_WIDTH 7
`define DEFAULT_ANG_WIDTH 9
`define DEFAULT_VEC_PROCESS_WIDTH 16
`define DEFAULT_ANG_PROCESS_WIDTH 16
`define DEFAULT_ITERATIONS 12
`define DEFAULT_ANG_TABLE_WIDTH (`DEFAULT_ANG_PROCESS_WIDTH - 1)

// Overflow problem doing cordic
// Input vector valid range: -2^(VEC_WIDTH-1)*CordicGain*2 to (2^(VEC_WIDTH-1)-1)*CordicGain*2
// 

module Rotate #(
    parameter VEC_WIDTH = `DEFAULT_VEC_WIDTH,
    parameter ANG_WIDTH = `DEFAULT_ANG_WIDTH,
    parameter VEC_PROCESS_WIDTH = `DEFAULT_VEC_PROCESS_WIDTH,
    parameter ANG_PROCESS_WIDTH = `DEFAULT_ANG_PROCESS_WIDTH,
    parameter ITERATIONS = `DEFAULT_ITERATIONS,
    parameter ANG_TABLE_WIDTH = `DEFAULT_ANG_TABLE_WIDTH
)(
    input i_clk,
    input i_rst_n,
    input i_start,

    // vector, Integer
    // note that the magnitude of the vector should also be able to be expressed in VEC_WIDTH bits 
    input signed [VEC_WIDTH-1:0] i_x,  
    input signed [VEC_WIDTH-1:0] i_y,

    // angle, Integer, from -180 to 180 degrees
    input signed [ANG_WIDTH-1:0] i_angle,

    output signed [VEC_WIDTH-1:0] o_x, // Integer, no floating point
    output signed [VEC_WIDTH-1:0] o_y, // Integer, no floating point
    output o_done
);

    // need 16 cycles to do a full rotation

    localparam S_IDLE = 2'd0,
            S_ROTATE = 2'd1,
            S_DONE = 2'd2;
    reg [1:0] state_r, state_w;

    reg [4:0] counter_r, counter_w;

    reg signed [VEC_PROCESS_WIDTH-1:0] x_r, x_w, y_r, y_w;
    reg signed [ANG_PROCESS_WIDTH-1:0] angle_error_r, angle_error_w;

    wire [ANG_TABLE_WIDTH-1:0] atan_table [0:ITERATIONS-1];
    atan_lut atan_lut_inst (
        .atan_table(atan_table)
    );

    // input scaling
    wire [VEC_PROCESS_WIDTH-1:0] i_x_extend, i_y_extend;
    DataScaleUp #(
        .INPUT_WIDTH(VEC_WIDTH),
        .OUTPUT_WIDTH(VEC_PROCESS_WIDTH)
    ) data_scale_up_inst_x (
        .in_value(i_x),
        .out_value(i_x_extend)
    );
    DataScaleUp #(
        .INPUT_WIDTH(VEC_WIDTH),
        .OUTPUT_WIDTH(VEC_PROCESS_WIDTH)
    ) data_scale_up_inst_y (
        .in_value(i_y),
        .out_value(i_y_extend)
    );

    // gain scaling
    wire [VEC_PROCESS_WIDTH-1:0] i_x_gain, i_y_gain;
    Cordic_gain #(
        .DATA_WIDTH(VEC_PROCESS_WIDTH)
    ) cordic_gain_inst_x (
        .input_value(i_x_extend),
        .output_value(i_x_gain)
    );
    Cordic_gain #(
        .DATA_WIDTH(VEC_PROCESS_WIDTH)
    ) cordic_gain_inst_y (
        .input_value(i_y_extend),
        .output_value(i_y_gain)
    );

    // angle preprocess
    wire [ANG_PROCESS_WIDTH-1:0] i_angle_preprocess;
    wire need_flip;
    AnglePreprocess #(
        .INPUT_WIDTH(ANG_WIDTH),
        .OUTPUT_WIDTH(ANG_PROCESS_WIDTH)
    ) angle_preprocess_inst (
        .i_angle(i_angle),
        .o_angle(i_angle_preprocess),
        .o_need_flip(need_flip)
    );

    // output scaling
    wire [VEC_WIDTH-1:0] o_x_process, o_y_process;
    DataScaleDown #(
        .INPUT_WIDTH(VEC_PROCESS_WIDTH),
        .OUTPUT_WIDTH(VEC_WIDTH)
    ) data_scale_down_inst_x (
        .in_value(x_r),
        .out_value(o_x_process)
    );
    DataScaleDown #(
        .INPUT_WIDTH(VEC_PROCESS_WIDTH),
        .OUTPUT_WIDTH(VEC_WIDTH)
    ) data_scale_down_inst_y (
        .in_value(y_r),
        .out_value(o_y_process)
    );

    // output flip and assignments
    OutputFlip #(
        .DATA_WIDTH(VEC_WIDTH)
    ) output_flip_inst_x (
        .i_data(o_x_process),
        .need_flip(need_flip),
        .o_data(o_x)
    );
    OutputFlip #(
        .DATA_WIDTH(VEC_WIDTH)
    ) output_flip_inst_y (
        .i_data(o_y_process),
        .need_flip(need_flip),
        .o_data(o_y)
    );
    assign o_done = (state_r == S_DONE);

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if (i_start)    state_w = S_ROTATE;
                else            state_w = S_IDLE;
            end
            S_ROTATE: begin
                if (counter_r == ITERATIONS-1)      state_w = S_DONE;
                else                                state_w = S_ROTATE;
            end
            S_DONE: begin
                state_w = S_IDLE;
            end
        endcase
    end

    // counter logic
    always @(*) begin
        counter_w = counter_r;
        case(state_r)
            S_ROTATE: begin
                if (counter_r == ITERATIONS-1)      counter_w = 0;
                else                                counter_w = counter_r + 1;
            end
        endcase
    end

    // rotate logic
    always @(*) begin
        x_w = x_r;
        y_w = y_r;
        angle_error_w = angle_error_r;
        case(state_r)
            S_IDLE: begin
                x_w = i_x_gain;
                y_w = i_y_gain;
                angle_error_w = i_angle_preprocess;
            end
            S_ROTATE: begin
                if(angle_error_r[ANG_PROCESS_WIDTH-1]) begin
                    // angle_error_r < 0
                    x_w = x_r + (y_r >>> counter_r);
                    y_w = y_r - (x_r >>> counter_r);
                    angle_error_w = angle_error_r + $signed({1'b0,atan_table[counter_r]});
                end else begin
                    // angle_error_r >= 0
                    x_w = x_r - (y_r >>> counter_r);
                    y_w = y_r + (x_r >>> counter_r);
                    angle_error_w = angle_error_r - $signed({1'b0,atan_table[counter_r]});
                end
            end
        endcase
    end

    always_ff @(posedge i_clk or negedge i_rst_n) begin 
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            counter_r <= 0;
            x_r <= 0;
            y_r <= 0;
            angle_error_r <= 0;
        end else begin
            state_r <= state_w;
            counter_r <= counter_w;
            x_r <= x_w;
            y_r <= y_w;
            angle_error_r <= angle_error_w;
        end
    end

endmodule

module Cordic_gain #(
    parameter DATA_WIDTH = `DEFAULT_VEC_PROCESS_WIDTH
)(
    input signed [DATA_WIDTH-1:0] input_value,
    output signed [DATA_WIDTH-1:0] output_value
);
    // 0.10011011011101001111

    assign output_value = (input_value >>> 1)
                        + (input_value >>> 4)
                        + (input_value >>> 5)
                        + (input_value >>> 7)
                        + (input_value >>> 8)
                        + (input_value >>> 10)
                        + (input_value >>> 11)
                        + (input_value >>> 12)
                        + (input_value >>> 14);
endmodule

module DataScaleUp #(
    parameter INPUT_WIDTH = `DEFAULT_VEC_WIDTH,
    parameter OUTPUT_WIDTH = `DEFAULT_VEC_PROCESS_WIDTH
)(
    input signed [INPUT_WIDTH-1:0] in_value,
    output reg signed [OUTPUT_WIDTH-1:0] out_value
);
    localparam SCALE_FACTOR = OUTPUT_WIDTH - INPUT_WIDTH;
    always @(*) begin
        // Sign extend the 7-bit input to 16 bits
        if (in_value[INPUT_WIDTH-1]) begin
            // Negative number, extend with 1s
            out_value = {{(SCALE_FACTOR){1'b1}}, in_value};
        end else begin
            // Positive number, extend with 0s
            out_value = {{(SCALE_FACTOR){1'b0}}, in_value};
        end
        
        // Scale up but prevent overflow
        out_value = out_value <<< (SCALE_FACTOR - 1); 
    end
endmodule

module DataScaleDown #(
    parameter INPUT_WIDTH = `DEFAULT_VEC_PROCESS_WIDTH,
    parameter OUTPUT_WIDTH = `DEFAULT_VEC_WIDTH
)(
    input signed [INPUT_WIDTH-1:0] in_value,
    output reg signed [OUTPUT_WIDTH-1:0] out_value
);
    localparam SCALE_FACTOR = INPUT_WIDTH - OUTPUT_WIDTH;
    integer scaled_value;
    always @(*) begin
        // Scale down by dividing by 2^9 and rounding
        scaled_value = (in_value + (1 << (SCALE_FACTOR-1))) >>> (SCALE_FACTOR - 1); // Rounding by adding 2^(SCALE_FACTOR-1)

        // Clamp the value to fit into 7 bits
        if (scaled_value > ((1 << (OUTPUT_WIDTH-1)) - 1)) begin
            out_value = (1 << (OUTPUT_WIDTH-1)) - 1; // Maximum positive value
        end else if (scaled_value < -(1 << (OUTPUT_WIDTH-1))) begin
            out_value = -(1 << (OUTPUT_WIDTH-1)); // Minimum negative value
        end else begin
            out_value = scaled_value[OUTPUT_WIDTH-1:0]; // Fit result into 7 bits
        end
    end
endmodule

module AnglePreprocess #(
    parameter INPUT_WIDTH = `DEFAULT_ANG_WIDTH,
    parameter OUTPUT_WIDTH = `DEFAULT_ANG_PROCESS_WIDTH
)(
    input signed [INPUT_WIDTH-1:0] i_angle, // input from -180 to 180 degrees
    output reg signed [OUTPUT_WIDTH-1:0] o_angle, // output from -90 to 90 degrees
    output reg o_need_flip // flip when i_angle < -90 or i_angle > 90
);
    localparam SCALE_FACTOR = OUTPUT_WIDTH - INPUT_WIDTH;
    always @(*) begin
        if (i_angle > 90) begin
            o_angle = (i_angle - 180) <<< SCALE_FACTOR;
            o_need_flip = 1'b1;
        end else if (i_angle < -90) begin
            o_angle = (i_angle + 180) <<< SCALE_FACTOR;
            o_need_flip = 1'b1;
        end else begin
            o_angle = (i_angle) <<< SCALE_FACTOR;
            o_need_flip = 1'b0;
        end
    end
endmodule

module OutputFlip #(
    parameter DATA_WIDTH = `DEFAULT_VEC_WIDTH
)(
    input signed [DATA_WIDTH-1:0] i_data,
    input need_flip,
    output reg signed [DATA_WIDTH-1:0] o_data
);
    always @(*) begin
        if (need_flip) begin
            o_data = -i_data;
        end else begin
            o_data = i_data;
        end
    end
endmodule