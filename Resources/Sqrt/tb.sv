module sqrt_tb();

    parameter CLK_PERIOD = 10;
//     parameter WIDTH = 16;
//     parameter FBITS = 8;
    parameter WIDTH = 20;
    parameter FBITS = 12;
    parameter SF = 2.0**-8.0;  // Q8.8 scaling factor is 2^-8

    logic i_clk;
    logic i_start;             // i_start signal
    logic i_rst_n;             // i_rst_n signal
    logic o_valid;             // o_root and o_rem are o_valid
    logic [WIDTH-1:0] i_rad;   // radicand
    logic [WIDTH-1:0] o_root;  // o_root
    logic [WIDTH-1:0] o_rem;   // remainder

    Sqrt #(.TOTAL_WIDTH(WIDTH), .FRACTION_WIDTH(FBITS)) sqrt_inst (.*);

    always #(CLK_PERIOD / 2) i_clk = ~i_clk;

    always @(posedge o_valid) begin
            $display("%d:\tsqrt(%f) = %b (%f) (o_rem = %b) (V=%b)",
                        $time, $itor(i_rad*SF), o_root, $itor(o_root*SF), o_rem, o_valid);
    end

    initial begin
        i_clk = 1;
        i_rst_n = 0;
        i_start = 0;

        #3
        i_rst_n = 1;
        i_start = 1;
        i_rad = 0;  // 0.0
        @(negedge o_valid)  i_rad = 11449;

        // @(negedge o_valid)      i_rad = 16'b1110_1000_1001_0000;  // 232.56250000

        // @(negedge o_valid)      i_rad = 16'b0000_0000_0100_0000;  // 0.25

        // @(negedge o_valid)      i_rad = 16'b0000_0010_0000_0000;  // 2.0

        @(negedge o_valid)      $finish;
    end

    // Simulation termination
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars;
    end
endmodule