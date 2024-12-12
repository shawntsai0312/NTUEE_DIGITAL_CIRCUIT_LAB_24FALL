// REF: https://projectf.io/posts/square-root-in-verilog/

module Sqrt #(
    parameter TOTAL_WIDTH=8,  // TOTAL_WIDTH of radicand
    parameter FRACTION_WIDTH=0   // fractional bits (for fixed point)
    ) (
    input wire logic clk,
    input wire logic start,             // start signal
    output     logic busy,              // calculation in progress
    output     logic valid,             // root and rem are valid
    input wire logic [TOTAL_WIDTH-1:0] rad,   // radicand
    output     logic [TOTAL_WIDTH-1:0] root,  // root
    output     logic [TOTAL_WIDTH-1:0] rem    // remainder
    );

    logic [TOTAL_WIDTH-1:0] x, x_next;    // radicand copy
    logic [TOTAL_WIDTH-1:0] q, q_next;    // intermediate root (quotient)
    logic [TOTAL_WIDTH+1:0] ac, ac_next;  // accumulator (2 bits wider)
    logic [TOTAL_WIDTH+1:0] test_res;     // sign test result (2 bits wider)

    localparam ITER = (TOTAL_WIDTH+FRACTION_WIDTH) >> 1;  // iterations are half radicand+FRACTION_WIDTH bits
    logic [$clog2(ITER)-1:0] i;            // iteration counter

    always @(*) begin
        test_res = ac - {q, 2'b01};
        if (test_res[TOTAL_WIDTH+1] == 0) begin  // test_res ≥0? (check MSB)
            {ac_next, x_next} = {test_res[TOTAL_WIDTH-1:0], x, 2'b0};
            q_next = {q[TOTAL_WIDTH-2:0], 1'b1};
        end else begin
            {ac_next, x_next} = {ac[TOTAL_WIDTH-1:0], x, 2'b0};
            q_next = q << 1;
        end
    end

    always_ff @(posedge clk) begin
        if (start) begin
            busy <= 1;
            valid <= 0;
            i <= 0;
            q <= 0;
            {ac, x} <= {{TOTAL_WIDTH{1'b0}}, rad, 2'b0};
        end else if (busy) begin
            if (i == ITER-1) begin  // we're done
                busy <= 0;
                valid <= 1;
                root <= q_next;
                rem <= ac_next[TOTAL_WIDTH+1:2];  // undo final shift
            end else begin  // next iteration
                i <= i + 1;
                x <= x_next;
                ac <= ac_next;
                q <= q_next;
            end
        end
    end
endmodule