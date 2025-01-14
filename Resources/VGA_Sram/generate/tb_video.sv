`timescale 1ns/10ps
`define CYCLE 10 // 108MHz clock period
`define HCYCLE 5 // Half of the clock period
`define SIM_TIME 4 
// 1 second of video needs 259.2MB .bin and 8.04GB .vcd and 11 minutes to render
// 4 second of video needs 1.04GB .bin and 32.11GB .vcd and 67 minutes to render

module tb;

    reg i_clk, i_rst_n;
    wire o_H_sync, o_V_sync;
    wire [23:0] o_RGB;
    wire o_RGB_valid;
    reg [31:0] o_frame_counter;

    // VGA #(
    //     .H_SIZE(1600),
    //     .V_SIZE(900),
    //     .FRAME_RATE(60)
    // ) u_vga (
    //     .i_clk       (i_clk),
    //     .i_rst_n     (i_rst_n),
    //     .o_H_sync    (o_H_sync),
    //     .o_V_sync    (o_V_sync),
    //     .o_RGB       (o_RGB),
    //     .o_RGB_valid (o_RGB_valid),
    //     .o_frame_counter (o_frame_counter)
    // );

    VGA u_vga (
        .i_clk       (i_clk),
        .i_rst_n     (i_rst_n),
        .o_H_sync    (o_H_sync),
        .o_V_sync    (o_V_sync),
        .o_RGB       (o_RGB),
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
            // $display("%c%c%c", o_RGB[23:16], o_RGB[15:8], o_RGB[7:0]);
            $fwrite(file, "%c%c%c", o_RGB[23:16], o_RGB[15:8], o_RGB[7:0]);
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
        // #(`CYCLE * `SIM_TIME * 108000000)
        #(`CYCLE * 108000000 / 60) // 1600*900@60 1 frames
        // #(`CYCLE * 25200000 / 60) // 640*480@60 1 frames
        $fclose(file);
        $finish;
    end
endmodule