module AudPlayer (
    input i_rst_n,
    input i_bclk,
    input i_daclrck,
    input i_en,
    input [15:0] i_dac_data,
    output o_aud_dacdat
);
    // TODO: Fetch and send audio data to WM8731 using I2S protocol
    reg [1:0] state_r,state_w;
    localparam S_IDLE = 0;
    localparam S_TRANSMIT = 1;
    localparam S_WAIT = 2;
   
    //output
    reg o_aud_dacdat_r, o_aud_dacdat_w;
    assign o_aud_dacdat = o_aud_dacdat_r;
    //count
    reg [4:0] count_r,count_w;
    //count
    always@(*)begin
        count_w = count_r;
        case(state_r)
            S_IDLE:begin
                if(i_en&(~i_daclrck))begin
                    count_w = 5'd1;
                end
                else begin
                    count_w = 5'd0;
                end
            end
            S_TRANSMIT:begin 
                if(count_r == 15)begin
                    count_w = 5'd0;
                end
                else begin
                    count_w = count_r+1;
                end
            end
            S_WAIT:begin
                count_w = count_r;
            end
        endcase
    end

    //o_aud_dacdat
    always@(*)begin
        o_aud_dacdat_w = o_aud_dacdat_r;
        case(state_r)
            S_IDLE:begin
                if(i_en&(~i_daclrck)) o_aud_dacdat_w = i_dac_data[15-count_r];
                else o_aud_dacdat_w = o_aud_dacdat_r;
            end
            S_TRANSMIT:begin
                o_aud_dacdat_w = i_dac_data[15-count_r];
            end
            S_WAIT:begin
                o_aud_dacdat_w = o_aud_dacdat_r;
            end
        endcase
    end
    //state machine
    always@(*)begin
        state_w = state_r;
        case(state_r)
            S_IDLE:begin
                if(i_en&(~i_daclrck))begin
                    state_w = S_TRANSMIT;
                end
                else begin
                    state_w = S_IDLE;
                end
            end
            S_TRANSMIT:begin
                if(count_r == 15)begin
                    state_w = S_WAIT;
                end
                else begin
                    state_w = S_TRANSMIT;
                end
            end
            S_WAIT:begin
                if(i_daclrck)begin
                    state_w = S_IDLE;
                end
                else begin
                    state_w = S_WAIT;
                end
            end
        endcase
    end
    //sequential
    always_ff @(posedge i_bclk or negedge i_rst_n) begin
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
