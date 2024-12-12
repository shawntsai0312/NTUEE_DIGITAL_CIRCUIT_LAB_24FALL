// REF: https://projectf.io/posts/square-root-in-verilog/

module Sqrt #(
    parameter TOTAL_WIDTH=8,  // TOTAL_WIDTH of radicand
    parameter FRACTION_WIDTH=0   // fractional bits (for fixed point)
)(
    input wire logic i_clk,
    input wire logic i_rst_n,
    input wire logic i_start,             // start calculation
    input wire logic [TOTAL_WIDTH-1:0] i_rad,   // radicand
    output     logic [TOTAL_WIDTH-1:0] o_root,  // o_root
    output     logic [TOTAL_WIDTH-1:0] o_rem,    // remainder
    output     logic o_valid             // o_root and o_rem are o_valid
);

    logic [TOTAL_WIDTH-1:0] x, x_next;    // radicand copy
    logic [TOTAL_WIDTH-1:0] q, q_next;    // intermediate o_root (quotient)
    logic [TOTAL_WIDTH+1:0] ac, ac_next;  // accumulator (2 bits wider)
    assign o_root = q;
    // assign o_rem = ac[TOTAL_WIDTH-1:0];
    assign o_rem = ac[TOTAL_WIDTH+1:1];
    
    localparam ITER = (TOTAL_WIDTH+FRACTION_WIDTH) >> 1;  // iterations are half radicand+FRACTION_WIDTH bits
    // wire [5:0] iterations;
    // assign iterations = ITER;
    logic [$clog2(ITER)-1:0] counter, counter_next;            // iteration counter

    localparam S_IDLE = 0;
    localparam S_CALC = 1;
    localparam S_DONE = 2;
    logic [1:0] state, state_next;
    assign o_valid = (state == S_DONE);

    logic [TOTAL_WIDTH+1:0] test_res;     // sign test result (2 bits wider)
    always @(*) begin
        case (state)
            S_IDLE: begin
                if (i_start) begin
                    {ac_next, x_next} = {{TOTAL_WIDTH{1'b0}}, i_rad, 2'b0};
                    q_next = 0;
                end
            end
            S_CALC: begin
                test_res = ac - {q, 2'b01};
                if (test_res[TOTAL_WIDTH+1] == 0) begin  // test_res ≥0? (check MSB)
                    {ac_next, x_next} = {test_res[TOTAL_WIDTH-1:0], x, 2'b0};
                    q_next = {q[TOTAL_WIDTH-2:0], 1'b1};
                end 
                else begin
                    {ac_next, x_next} = {ac[TOTAL_WIDTH-1:0], x, 2'b0};
                    q_next = q << 1;
                end
            end
            S_DONE: begin
                test_res = 0;
            end
        endcase
    end

    always @(*) begin
        state_next = state;
        case (state)
            S_IDLE: if (i_start) state_next = S_CALC;
            S_CALC: if (counter == ITER-1) state_next = S_DONE;
            S_DONE: state_next = S_IDLE;
        endcase
    end

    always @(*) begin
        counter_next = counter;
        case (state)
            S_IDLE: if (i_start) counter_next = 0;
            S_CALC: if (counter < ITER-1) counter_next = counter + 1;
            S_DONE: counter_next = 0;
        endcase
    end

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state <= S_IDLE;
            counter <= 0;
            q <= 0;
            ac <= 0;
            x <= 0;
        end
        else begin
            state <= state_next;
            counter <= counter_next;
            x <= x_next;
            ac <= ac_next;
            q <= q_next;
        end
    end
endmodule