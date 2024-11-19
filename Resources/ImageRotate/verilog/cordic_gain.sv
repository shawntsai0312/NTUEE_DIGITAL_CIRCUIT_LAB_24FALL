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
