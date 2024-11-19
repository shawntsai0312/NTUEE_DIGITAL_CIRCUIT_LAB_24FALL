module vga (
    input i_clk,
    input i_rst_n,
    output o_H_sync, 
    output o_V_sync,
    output [7:0] o_R, 
    output [7:0] o_G, 
    output [7:0] o_B
);

parameter A = 0;
parameter B = 1;
parameter C = 2;
parameter D = 3;

parameter W = 0;
parameter X = 1;
parameter Y = 2;
parameter Z = 3;

reg V_sync, V_sync_nxt, H_sync, H_sync_nxt;
assign o_H_sync = H_sync;
assign o_V_sync = V_sync;

reg [23:0] RGB, RGB_nxt;
assign o_R = RGB[23:16];
assign o_G = RGB[15: 8];
assign o_B = RGB[ 7: 0];

reg [1:0] H_STATE, H_STATE_nxt;
reg [9:0] H_counter, H_counter_nxt;

reg [1:0] V_STATE, V_STATE_nxt;
reg [9:0] V_counter, V_counter_nxt;

always @(*) begin

    RGB_nxt = 0;

    if (H_STATE == X && V_STATE == B) begin
        // coordinate (H_counter, V_counter)
        
    end

end


always @(*) begin
    H_STATE_nxt = H_STATE;
    H_counter_nxt = H_counter + 1;
    H_sync_nxt = !(H_STATE == Z);

    case (H_STATE)
        W: begin 
            if (H_counter == 48) begin
                H_STATE_nxt = X;
                H_counter_nxt = 1;
            end
        end
        X: begin 
            if (H_counter == 640) begin
                H_STATE_nxt = Y;
                H_counter_nxt = 1;
            end
        end
        Y: begin 
            if (H_counter == 16) begin
                H_STATE_nxt = Z;
                H_counter_nxt = 1;
            end
        end
        Z: begin 
            if (H_counter == 96) begin
                H_STATE_nxt = W;
                H_counter_nxt = 1;
            end
        end
    endcase
    
end


always @(*) begin
    V_STATE_nxt = V_STATE;
    V_counter_nxt = V_counter;
    V_sync_nxt = !(V_STATE == D);

    if (H_STATE == Z && H_counter == 96) begin
        V_counter_nxt = V_counter + 1;
        case (V_STATE)
            A: begin 
                if (V_counter == 33) begin
                    V_STATE_nxt = B;
                    V_counter_nxt = 1;
                end
            end
            B: begin 
                if (V_counter == 480) begin
                    V_STATE_nxt = C;
                    V_counter_nxt = 1;
                end
            end
            C: begin 
                if (V_counter == 10) begin
                    V_STATE_nxt = D;
                    V_counter_nxt = 1;
                end
            end
            D: begin 
                if (V_counter == 2) begin
                    V_STATE_nxt = A;
                    V_counter_nxt = 1;
                end
            end
        endcase
    end
end
    
always_ff @(posedge i_clk or negedge i_rst_n) begin 
    if (!i_rst_n) begin
        H_STATE <= W;
        H_counter <= 1;
        H_sync <= 1;
        V_STATE <= A;
        V_counter <= 1;
        V_sync <= 1;
        RGB <= 0;
    end
    else begin
        H_STATE <= H_STATE_nxt;
        H_counter <= H_counter_nxt;
        H_sync <= H_sync_nxt;
        V_STATE <= V_STATE_nxt;
        V_counter <= V_counter_nxt;
        V_sync <= V_sync_nxt;
        RGB <= RGB_nxt;
    end
end

endmodule