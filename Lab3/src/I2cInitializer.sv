module I2cInitializer (
    input i_rst_n,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,
    output o_sdat,
    output o_oen
);
    // I2C bus signals
    // [23:17]: slave address, 0011010
    // [16]: read/write bit, 0 for write, 1 for read
    // [15:9]: register address
    // [8:0]: register data
    // checkout doc/Lab3_sup1_audiocodec.pdf for more details
    parameter [23:0] RESET =                            24'b0011_0100_000_1111_0_0000_0000;
    parameter [23:0] LEFT_LINE_IN =                     24'b0011_0100_000_0000_0_1001_0111;
    parameter [23:0] RIGHT_LINE_IN =                    24'b0011_0100_000_0001_0_1001_0111;
    parameter [23:0] LEFT_HEADPHONE_OUT =               24'b0011_0100_000_0010_0_0111_1001;
    parameter [23:0] RIGHT_HEADPHONE_OUT =              24'b0011_0100_000_0011_0_0111_1001;
    parameter [23:0] ANALOGUE_AUDIO_PATH_CONTROL =      24'b0011_0100_000_0100_0_0001_0101;
    parameter [23:0] DIGITAL_AUDIO_PATH_CONTROL =       24'b0011_0100_000_0101_0_0000_0000;
    parameter [23:0] POWER_DOWN_CONTROL =               24'b0011_0100_000_0110_0_0000_0000;
    parameter [23:0] DIGITAL_AUDIO_INTERFACE_FORMAT =   24'b0011_0100_000_0111_0_0100_0010;
    parameter [23:0] SAMPLING_CONTROL =                 24'b0011_0100_000_1000_0_0001_1001;
    parameter [23:0] ACTIVE_CONTROL =                   24'b0011_0100_000_1001_0_0000_0001;


    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            
        end
        else begin
            
        end
    end
endmodule