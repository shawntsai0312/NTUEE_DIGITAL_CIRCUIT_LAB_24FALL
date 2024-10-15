module I2cInitializer (
    input i_rst_n,
    input i_clk,
    input i_start,
    output o_finished,
    output o_sclk,
    output o_sdat,
    output o_oen
);
    // TODO: I2C initialization logic

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            
        end
        else begin
            
        end
    end
endmodule