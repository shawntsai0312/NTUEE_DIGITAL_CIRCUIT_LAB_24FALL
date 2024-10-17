module AudRecorder (
    input i_rst_n,
    input i_clk,
    input i_lrc,
    input i_start,
    input i_pause,
    input i_stop,
    input i_data,
    output [19:0] o_address,
    output [15:0] o_data,
    output [19:0] o_stop_address
);
    // TODO: Record audio data from WM8731 and save it to SRAM
    reg [19:0] addr_r, addr_w;
    reg [15:0] data_r, data_w;
    
    assign o_address = addr_r;
    assign o_data = data_r;
    assign o_stop_address = addr_r;

    reg [2:0] state_r, state_w;
    localparam S_IDLE = 0;
    localparam S_WAIT = 1;
    localparam S_DATA = 2;
    localparam S_PAUSE = 3;
    localparam ADD_BASE = 20'b11111111111111111111; //-1
    reg [4:0] count_r, count_w;
    //counters
    always @(*)begin
        count_w = count_r;
        S_IDLE:begin
            count_w = 5'd0;
        end
        S_WAIT:begin
            count_w = 5'd0;
        end
        S_DATA:begin
            if(i_stop)begin
                count_w = 5'd0;
            end
            else if(i_pause)begin
                count_w = 5'd0;
            end
            else if (count_r < 5'd16)begin
                count_w = count_r + 1;
            end
            else if (!i_lrc)begin
                count_w = count_r;
            end
            else count_w = count_r;
        end
        S_PAUSE:begin
            count_w = 5'd0;
        end
    end
    //data
    always @(*) begin
        data_w = data_r;
        case(state_r)
            S_IDLE:begin
                data_w = 16'd0;
            end
            S_WAIT:begin
                data_w = 16'd0;
            end
            S_DATA:begin
                if(i_stop)begin
                    data_w = 16'd0;
                end
                else if (i_pause)begin
                    data_w = 16'd0;
                end 
                else if (count_r < 5'd16)begin
                    data_w = {data_r[15:0],i_data};///可以這樣寫嗎
                end
                else if (!i_lrc)begin
                    data_w = data_r;
                end
            end
            S_PAUSE:begin
                data_w = 16'd0;
            end
        endcase
    end
    //address
    always @(*)begin
        addr_w = addr_r;
        case(state_r)
            S_IDLE:begin
                if(i_start)begin
                    addr_w = ADD_BASE;
                end
                else begin
                    addr_w = addr_r;
                end
            end
            S_WAIT:begin
                addr_w = addr_r;
            end
            S_DATA:begin
                if(i_stop)begin
                    addr_w = addr_r;
                end
                else if (i_pause)begin
                    addr_w = addr_r;
                end 
                else if (count_r < 5'd16)begin
                    addr_w = addr_r;
                end
                else if (!i_lrc)begin
                    addr_w = addr_r + 20'd1;
                end
            end
            S_PAUSE:begin
                addr_w = addr_r;
            end
        endcase
    end
    //state machine
    always @(*) begin
        state_w = state_r;
        case(state_r) 
            S_IDLE:begin
                if(i_start) state_w = S_WAIT;
                else state_w = S_IDLE;
            end
            S_WAIT:begin
                if(i_lrc) state_w = S_DATA;
                else if(i_stop) state_w = S_IDLE;
                else if (i_pause) state_w = S_PAUSE;
                else state_w = S_WAIT;
            end
            S_DATA:begin
                if(!i_lrc) state_w = S_WAIT;
                else if(i_stop) state_w = S_IDLE;
                else if (i_pause) state_w = S_PAUSE;
                else state_w = S_DATA;
            end
            S_PAUSE:begin
                if(i_start) state_w = S_WAIT;
                else if(i_stop) state_w = S_IDLE;
                else state_w = S_PAUSE;
            end
        endcase
    end
//sequential
    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            addr_r <= ADD_BASE;
            data_r <= 16'd0;
            count_r <= 5'd0;
        end
        else begin
            state_r <= state_w;
            addr_r <= addr_w;
            data_r <= data_w;
            count_r <= count_w;
        end
    end
endmodule