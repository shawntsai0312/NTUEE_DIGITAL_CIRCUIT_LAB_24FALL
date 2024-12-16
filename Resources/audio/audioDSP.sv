module AudioDSP (
    input i_rst_n,
    input i_clk,
    input i_start, // start signal, sent by the controller, not a button press
    input i_daclrck,               // prepare data when low
    // input signed [15:0] i_sram_data,
    // input [19:0] i_sram_stop_addr, // the last address to read from SRAM
    output signed [15:0] o_dac_data,
    output o_en,                   // enable signal for AudPlayer, !i_daclrck
    output o_is_pause,
    output [19:0] o_sram_addr
);
    // TODO: DSP operations including speed adjustments

    localparam S_IDLE       = 0;
    localparam S_GETDATA    = 2;
    localparam S_SENDDATA   = 3;
    

    reg [2:0] state_r, state_w;
    reg [1:0] get_data_counter_r, get_data_counter_w; // counter for getting data from SRAM, when 0 set addr_w, when 1 set addr_r, when 2 get data

    reg [19:0] addr_r, addr_w;
    reg signed [15:0] i_data_curr_r, i_data_curr_w;

    reg [15:0] o_data_r, o_data_w;

    assign o_dac_data = o_data_r;
    assign o_en = !i_daclrck;
    assign o_sram_addr = addr_r;

    // state machine
    always @(*) begin
        state_w = state_r;
        case(state_r)
            S_IDLE: begin
                if (i_start)    state_w = S_GETDATA;
                else            state_w = S_IDLE;
            end
            S_GETDATA: begin
                if (!i_daclrck) state_w = S_SENDDATA;   // o_en = 1
                else            state_w = S_GETDATA;    // o_en = 0
            end
            S_SENDDATA: begin
                if (!i_daclrck) state_w = S_SENDDATA;   // o_en = 1
                else            state_w = S_GETDATA;    // o_en = 0
            end
        endcase
    end

    // get data counter logic
    always @(*) begin
        get_data_counter_w = get_data_counter_r;
        case(state_r)
            S_IDLE:     get_data_counter_w = 0;
            S_GETDATA:  if(get_data_counter_r < 3)  get_data_counter_w = get_data_counter_r + 1;
            S_SENDDATA: get_data_counter_w = 0;
        endcase
    end

    // address logic
    // ask for i_data_next
    // add one more bit to prevent overflow
    // if it is larger than i_sram_stop_addr, reset to 0
    reg [20:0] temp_addr;
    always @(*) begin
        addr_w = addr_r;
        temp_addr = addr_r;
        case(state_r)
            S_IDLE: temp_addr = 0;
            S_GETDATA: begin
                if(get_data_counter_r == 0) begin
                    temp_addr = addr_r + 1;
                end
            end
        endcase
        if(temp_addr > i_sram_stop_addr)    addr_w = 0;
        else                                addr_w = temp_addr;
    end

    // i_data logic
    always @(*) begin
        i_data_curr_w = i_data_curr_r;
        i_data_next_w = i_data_next_r;
        case(state_r)
            S_IDLE: i_data_next_w = 0;
            S_GETDATA: begin
                if(get_data_counter_r == 2) begin
                    i_data_curr_w = i_sram_data;
                end
            end
        endcase
    end

    // o_data logic
    always @(*) begin
        o_data_w = o_data_r;
        case(state_r)
            S_IDLE: o_data_w = 0;
            S_GETDATA: begin
                if(get_data_counter_r == 3) begin
                    o_data_w = i_data_curr_r;
                end
            end
        endcase
    end

    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            state_r <= S_IDLE;
            slow_counter_r <= 0;
            get_data_counter_r <= 0;
            addr_r <= 0;
            i_data_curr_r <= 0;
            o_data_r <= 0;
        end
        else begin
            state_r <= state_w;
            slow_counter_r <= slow_counter_w;
            get_data_counter_r <= get_data_counter_w;
            addr_r <= addr_w;
            i_data_curr_r <= i_data_curr_w;
            o_data_r <= o_data_w;
        end
    end
endmodule