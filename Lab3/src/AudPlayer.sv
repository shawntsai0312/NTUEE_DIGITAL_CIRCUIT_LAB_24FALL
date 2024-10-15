module AudPlayer (
    input i_rst_n,
    input i_bclk,
    input i_daclrck,
    input i_en,
    input [15:0] i_dac_data,
    output o_aud_dacdat
);
    // TODO: Fetch and send audio data to WM8731 using I2S protocol

endmodule