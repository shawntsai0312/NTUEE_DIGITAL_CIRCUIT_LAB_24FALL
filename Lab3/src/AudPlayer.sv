module AudPlayer (
    input i_rst_n,
    input i_bclk,
    input i_daclrck, // 0 for left channel, 1 for right channel
    input i_en,
    input [15:0] i_dac_data,
    output o_aud_dacdat
);
    // state
    localparam S_IDLE = 0;
    localparam S_TRAN = 1;
    localparam S_WAIT = 2;

    // TODO: Fetch and send audio data to WM8731 using I2S protocol
    reg [1:0] state_r, state_w;
   
    // output
    reg [15:0] o_aud_dacdat_r, o_aud_dacdat_w;
    assign o_aud_dacdat = o_aud_dacdat_r[15];

    // counter
    reg [4:0] count_r, count_w;

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if(i_en && !i_daclrck)  state_w = S_TRAN;
                else                    state_w = S_IDLE;
            end
            S_TRAN: begin
                if(count_r == 15)   state_w = S_WAIT;
                else                state_w = S_TRAN;
            end
            S_WAIT: begin
                if(i_daclrck)   state_w = S_IDLE;
                else            state_w = S_WAIT;
            end
        endcase
    end

    // counter logic
    always @(*) begin
        count_w = count_r;
        case(state_r)
            S_IDLE: count_w = 5'd0;
            S_TRAN: count_w = count_r + 1;
        endcase
    end

    // o_aud_dacdat logic
    always @(*)begin
        o_aud_dacdat_w = o_aud_dacdat_r;
        case(state_r)
            S_IDLE: if(i_en && !i_daclrck) o_aud_dacdat_w = i_dac_data;
            S_TRAN: o_aud_dacdat_w = o_aud_dacdat_r << 1;
        endcase
    end

    // sequential logic
    always_ff @(negedge i_bclk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            count_r <= 0;
            o_aud_dacdat_r <= 0;
        end
        else begin
            state_r <= state_w;
            count_r <= count_w;
            o_aud_dacdat_r <= o_aud_dacdat_w;
        end
    end
endmodule
