`timescale 1ns/10ps
`define CYCLE 9.26 // 108MHz clock period
`define HCYCLE 4.63 // Half of the clock period
`define SIM_TIME 4 
// 1 second of video needs 259.2MB .bin and 8.04GB .vcd and 11 minutes to render
// 4 second of video needs 1.04GB .bin and 32.11GB .vcd and 67 minutes to render

module tb;

    reg i_clk, i_rst_n;
    wire o_H_sync, o_V_sync;
    wire [7:0] o_R, o_G, o_B;
    wire o_RGB_valid;
    reg [31:0] o_frame_counter;

     u_vga (
        .i_clk       (i_clk),
        .i_rst_n     (i_rst_n),
        .o_H_sync    (o_H_sync),
        .o_V_sync    (o_V_sync),
        .o_R         (o_R),
        .o_G         (o_G),
        .o_B         (o_B),
        .o_RGB_valid (o_RGB_valid),
        .o_frame_counter (o_frame_counter)
    );

    // i_clk generation
    initial begin
        i_clk = 1'b1;
    end

    always begin
        #(`HCYCLE) i_clk = ~i_clk;
    end

    initial begin
        i_rst_n = 1'b0;
        #(`CYCLE*3) i_rst_n = 1'b1;
    end

    integer file;
    initial begin
        file = $fopen("output.bin", "wb");
    end

    always @(posedge i_clk) begin
        if (o_RGB_valid) begin
            // if(o_R!=0 || o_G!=0 || o_B!=0) $display("RGB(%d, %d, %d)", o_R, o_G, o_B);
            $fwrite(file, "%c%c%c", o_R, o_G, o_B);
        end
    end

    always @(o_frame_counter) begin
        $display("Now Rendering Frame: %d", o_frame_counter+1);
    end
    
    // initial begin
    //     $dumpfile("tb_vga.vcd");
    //     $dumpvars;
    // end

    initial begin
        #(`CYCLE * `SIM_TIME * 108000000)
        // #(`CYCLE * 108000000 / 30) // 2 frames
        $fclose(file);
        $finish;
    end
endmodule