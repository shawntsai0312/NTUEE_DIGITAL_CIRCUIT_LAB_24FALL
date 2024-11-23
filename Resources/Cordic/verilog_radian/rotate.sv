module Rotate #(
    parameter DATA_WIDTH = 7,
    parameter PROCESS_WIDTH = 16,
    parameter ITERATIONS = 16
)(
    input i_clk,
    input i_rst_n,
    input i_start,
    input signed [DATA_WIDTH-1:0] i_x,  // Integer, no floating point
    input signed [DATA_WIDTH-1:0] i_y,  // Integer, no floating point
    input signed [21:0] i_angle,        // Input from -90 to 90 degrees, which is -1.5708 to 1.5708 radians
                                        // actual angle = i_angle * 2^(-20)
                                        // under this setting, for 1 degree rotation, relative error for = 0.006030551013317683%

    output signed [DATA_WIDTH-1:0] o_x, // Integer, no floating point
    output signed [DATA_WIDTH-1:0] o_y, // Integer, no floating point
    output o_done
);

// need 16 cycles to do a full rotation

localparam S_IDLE = 2'd0,
           S_ROTATE = 2'd1,
           S_DONE = 2'd2;
reg [1:0] state_r, state_w;

reg [4:0] counter_r, counter_w;

reg signed [PROCESS_WIDTH-1:0] x_r, x_w, y_r, y_w;
reg signed [21:0] angle_error_r, angle_error_w;

wire [19:0] atan_table [0:15];
atan_lut atan_lut_inst (
    .atan_table(atan_table)
);

// input scaling
wire [PROCESS_WIDTH-1:0] i_x_extend, i_y_extend;
DataScaleUp #(
    .INPUT_WIDTH(DATA_WIDTH),
    .OUTPUT_WIDTH(PROCESS_WIDTH)
) data_scale_up_inst_x (
    .in_value(i_x),
    .out_value(i_x_extend)
);
DataScaleUp #(
    .INPUT_WIDTH(DATA_WIDTH),
    .OUTPUT_WIDTH(PROCESS_WIDTH)
) data_scale_up_inst_y (
    .in_value(i_y),
    .out_value(i_y_extend)
);

// gain scaling
wire [PROCESS_WIDTH-1:0] i_x_gain, i_y_gain;
Cordic_gain #(
    .DATA_WIDTH(PROCESS_WIDTH)
) cordic_gain_inst_x (
    .input_value(i_x_extend),
    .output_value(i_x_gain)
);
Cordic_gain #(
    .DATA_WIDTH(PROCESS_WIDTH)
) cordic_gain_inst_y (
    .input_value(i_y_extend),
    .output_value(i_y_gain)
);

// output scaling
DataScaleDown #(
    .INPUT_WIDTH(PROCESS_WIDTH),
    .OUTPUT_WIDTH(DATA_WIDTH)
) data_scale_down_inst_x (
    .in_value(x_r),
    .out_value(o_x)
);
DataScaleDown #(
    .INPUT_WIDTH(PROCESS_WIDTH),
    .OUTPUT_WIDTH(DATA_WIDTH)
) data_scale_down_inst_y (
    .in_value(y_r),
    .out_value(o_y)
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
            angle_error_w = i_angle;
        end
        S_ROTATE: begin
            if(angle_error_r[21]) begin
                // angle_error_r < 0
                x_w = x_r + (y_r >>> counter_r);
                y_w = y_r - (x_r >>> counter_r);
                angle_error_w = angle_error_r + $signed({2'b00,atan_table[counter_r]});
            end else begin
                // angle_error_r >= 0
                x_w = x_r - (y_r >>> counter_r);
                y_w = y_r + (x_r >>> counter_r);
                angle_error_w = angle_error_r - $signed({2'b00,atan_table[counter_r]});
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
    parameter DATA_WIDTH = 16
)(
    input signed [DATA_WIDTH-1:0] input_value,
    output signed [DATA_WIDTH-1:0] output_value
);
    // CORDIC gain approximation 0.6072529350088813~0.6073 can be expressed as:
    // input * 0.6073 ≈ (input >> 1) + (input >> 3) + (input >> 4) + (input >> 6)
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
    parameter INPUT_WIDTH = 7,
    parameter OUTPUT_WIDTH = 16
)(
    input signed [INPUT_WIDTH-1:0] in_value,
    output reg signed [OUTPUT_WIDTH-1:0] out_value
);
    localparam SCALE_FACTOR = OUTPUT_WIDTH - INPUT_WIDTH;
    always @(*) begin
        // Sign extend the 7-bit input to 16 bits
        if (in_value[INPUT_WIDTH-1]) begin
            // Negative number, extend with 1s
            out_value = {{(OUTPUT_WIDTH-INPUT_WIDTH){1'b1}}, in_value};
        end else begin
            // Positive number, extend with 0s
            out_value = {{(OUTPUT_WIDTH-INPUT_WIDTH){1'b0}}, in_value};
        end
        
        // Scale the extended value by 2^9
        out_value = out_value << SCALE_FACTOR;
    end
endmodule

module DataScaleDown #(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = 7
)(
    input signed [INPUT_WIDTH-1:0] in_value,
    output reg signed [OUTPUT_WIDTH-1:0] out_value
);
    localparam SCALE_FACTOR = INPUT_WIDTH - OUTPUT_WIDTH;
    integer scaled_value;
    always @(*) begin
        // Scale down by dividing by 2^9 and rounding
        scaled_value = (in_value + (1 << (SCALE_FACTOR-1))) >>> SCALE_FACTOR; // Rounding by adding 2^(SCALE_FACTOR-1)

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
