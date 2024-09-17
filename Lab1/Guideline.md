# Lab1 Guideline
## Synthesizable Verilog
In Verilog, only a subset of syntax can be compiled to hardware,
and we call them the *synthesizable* code.
Here is some guidelines about the recommended synthesizable code.

## Register and the Sequential Block
The ONLY way you should use to generate registers is:

    always_ff @(posedge clk or negedge rst_n) begin
      if (!rst_n) begin
        a_r <= 1'b0;
        b_r <= '0;
      end
      else begin
        a_r <= a_w;
        b_r <= b_w;
      end
    end

## Register (Sequential Blocks) and Combinational Blocks
If you follow the X\_r and X\_w naming conventions,
always keep in mind that X\_r is a register.
And NEVER use X\_r in the left hand side of combinational blocks.

    always_comb begin
      a_r = XXX ? ZZZ : YYY; // very possibly wrong
    end
    assign a_r = AAA ? BBB : CCC; // very possibly wrong

Simliarly, also always keep in mind that X\_w is usually not a register.
NEVER use X\_w in the left hand side of sequential blocks.
And be careful when X\_w appears in right hand side of combinational blocks.

    always_comb begin
      a_w = b_w + 1; // possibly wrong
    end
    always_ff @(posedge clk or negedge rst_n) if (!rst_n)
      a_w <= 0; // definitely wrong
    else if (cond) begin
      a_w <= ...; // definitely wrong
    end

## A Working Example
Compile (Ctrl+L) the Top module below and program it to DE2-115.
Guess and observe what will happen?

    module Top (
        input        i_clk,
        input        i_rst_n,
        input        i_start,
        output [3:0] o_random_out
    );

    // ===== States =====
    parameter S_IDLE = 1'b0;
    parameter S_PROC = 1'b1;

    // ===== Output Buffers =====
    logic [3:0] o_random_out_r, o_random_out_w;

    // ===== Registers & Wires =====
    logic state_r, state_w;

    // ===== Output Assignments =====
    assign o_random_out = o_random_out_r;

    // ===== Combinational Circuits =====
    always_comb begin
       // Default Values
       o_random_out_w = o_random_out_r;
       state_w        = state_r;

       // FSM
       case(state_r)
       S_IDLE: begin
          if (i_start) begin
             state_w = S_PROC;
             o_random_out_w = 4'd15;
          end
       end

       S_PROC: begin
          if (i_start) begin
             state_w = (o_random_out_r == 4'd10) ? S_IDLE : state_w;
             o_random_out_w = (o_random_out_r == 4'd10) ? 4'd1 : (o_random_out_r - 4'd1);
          end
       end

       endcase
    end

    // ===== Sequential Circuits =====
    always_ff @(posedge i_clk or negedge i_rst_n) begin
       // reset
       if (!i_rst_n) begin
          o_random_out_r <= 4'd0;
          state_r        <= S_IDLE;
       end
       else begin
          o_random_out_r <= o_random_out_w;
          state_r        <= state_w;
       end
    end

    endmodule

First, press *Key1* to reset and the dispay would show red "00". 
If you press *Key0* when display shows "00", it will become "15".
Every subsequent *Key0* press will decrease the number by 1 until "10" is reached.
Press *Key0* then the number would become "01".
Another press will start the countdown again from "15".

# FAQ
## My Verilog Pass the Simulation, but It Doesn't Work.
Again, in Verilog, only a subset of syntax can be compiled to hardware.
If you see any WARNING about *Combinational Loop* or *Infered Latch*,
then you should modify your source code.

Or you can use nLint to check your Verilog (see also appendix).
If you pass the simulation but encounter these warnings/errors,
please double check your code.

* 22011 Combinational Loop
* 22013 Asynchronous Loop
* 22014 Synchronous Loop
* 22051 (Verilog) Generated Reset
* 22052 (Verilog) Generated Clock
* 22082 Port Not Connected
* 23003 Inferred Latch
* 23006 (Verilog) Incomplete Case Expression with Default Clause
* 23007 (Verilog) Case Statement Not Fully Specified
* 25001 Signal with No Driver

## Compile Fails at Fitter/Generate Program File Stage
If synthesis passes but you encounter a weird error,
please follow these steps:

* (in the left panel) Hierarchy
* (right click) Device
* (button) Device and pin options
* Dual-Purpose pins
* nCEO: Choose *Use as regular I/O*

# Appendix
## File Structure

* src/DE2\_115
	* All files related to the FPGA
* include/
	* Verilog files which only contain include lines
	* Not necessary for Quartus
* sim/ and lint/
	* Working directories

## Spyglass
Verilog coding style checking

    spyglass &

## Simulation
Simulate the core file(s)

    cd Lab1/sim/
    vcs tb_Top.sv ./../src/Top.sv -full64 -R -debug_access+all -sverilog +access+rw

And you can use nWave to check the signals of your Verilog code.

    nWave &
