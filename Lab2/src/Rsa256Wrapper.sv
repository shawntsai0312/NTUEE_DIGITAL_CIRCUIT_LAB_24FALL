module Rsa256Wrapper (
    input         avm_rst,
    input         avm_clk,
    output  [4:0] avm_address,
    output        avm_read,
    input  [31:0] avm_readdata,
    output        avm_write,
    output [31:0] avm_writedata,
    input         avm_waitrequest
);

localparam RX_BASE     = 0*4;
localparam TX_BASE     = 1*4;
localparam STATUS_BASE = 2*4;
localparam TX_OK_BIT   = 6;
localparam RX_OK_BIT   = 7;

// Feel free to design your own FSM!
localparam S_QUERY_RX = 0;
localparam S_READ = 1;
localparam S_CALCULATE = 2;
localparam S_QUERY_TX = 3;
localparam S_WRITE = 4;

// state
logic [2:0] state_r, state_w;

// counter used to count the bytes of the message
// 1 byte each read / write
logic [6:0] bytes_counter_r, bytes_counter_w;

// core inputs
logic [255:0] n_r, n_w;
logic [255:0] d_r, d_w;
logic [255:0] enc_r, enc_w;

// core control
logic rsa_start_r, rsa_start_w;

// core outputs
logic [255:0] dec_r, dec_w;

// AVM interface
logic [4:0] avm_address_r, avm_address_w;
logic avm_read_r, avm_read_w;
logic avm_write_r, avm_write_w;

// core output wires
wire rsa_finished;
wire [255:0] rsa_dec;

assign avm_address = avm_address_r;
assign avm_read = avm_read_r;
assign avm_write = avm_write_r;
assign avm_writedata = dec_r[247-:8]; // dec_r[247:240]

Rsa256Core rsa256_core(
    .i_clk(avm_clk),
    .i_rst(avm_rst),
    .i_start(rsa_start_r),
    .i_a(enc_r),
    .i_d(d_r),
    .i_n(n_r),
    .o_a_pow_d(rsa_dec),
    .o_finished(rsa_finished)
);

task StartRead;
    input [4:0] addr;
    begin
        avm_read_w = 1;
        avm_write_w = 0;
        avm_address_w = addr;
    end
endtask
task StartWrite;
    input [4:0] addr;
    begin
        avm_read_w = 0;
        avm_write_w = 1;
        avm_address_w = addr;
    end
endtask

// state transition
always @(*) begin
    state_w = state_r;
    case(state_r)
        S_QUERY_RX: begin
            if (!avm_waitrequest && avm_readdata[RX_OK_BIT])    state_w = S_READ;
            else                                                state_w = S_QUERY_RX;
        end
        S_READ: begin
            if (avm_waitrequest)                state_w = S_READ;
            else if (bytes_counter_r == 95)     state_w = S_CALCULATE;
            else                                state_w = S_QUERY_RX;
        end
        S_CALCULATE: begin
            if (rsa_finished)   state_w = S_QUERY_TX;
            else                state_w = S_CALCULATE;
        end
        S_QUERY_TX: begin
            if (!avm_waitrequest && avm_readdata[TX_OK_BIT])    state_w = S_WRITE;
            else                                                state_w = S_QUERY_TX;
        end
        S_WRITE: begin
            if (avm_waitrequest)                state_w = S_WRITE;
            else if (bytes_counter_r == 30)     state_w = S_QUERY_RX; // only 248 bits to output, not 256
            else                                state_w = S_QUERY_TX;
        end
    endcase
end

// bytes counter logic
always @(*) begin
    bytes_counter_w = bytes_counter_r;
    case(state_r)
        S_READ: begin
            if (avm_waitrequest)            bytes_counter_w = bytes_counter_r;      // S_READ
            else if(bytes_counter_r == 95)  bytes_counter_w = 0;                    // S_CALCULATE
            else                            bytes_counter_w = bytes_counter_r + 1;  // READ IN
        end
        S_WRITE: begin
            if (avm_waitrequest)            bytes_counter_w = bytes_counter_r;      // S_WRITE
            else if(bytes_counter_r == 30)  bytes_counter_w = 64;                   // S_QUERY_RX, no need to read n and d again !!!
            else                            bytes_counter_w = bytes_counter_r + 1;  // WRITE OUT
        end
    endcase
end

// core inputs logic
always @(*) begin
    n_w = n_r;
    d_w = d_r;
    enc_w = enc_r;
    case(state_r)
        S_READ: begin
            if (avm_waitrequest) begin
                // S_READ
                n_w = n_r;
                d_w = d_r;
                enc_w = enc_r;
            end
            else if (bytes_counter_r < 32)  n_w[255:0] = {n_r[247:0], avm_readdata[7:0]};
            else if (bytes_counter_r < 64)  d_w[255:0] = {d_r[247:0], avm_readdata[7:0]};
            else                            enc_w[255:0] = {enc_r[247:0], avm_readdata[7:0]};
        end
    endcase
end

// core control logic
always @(*) begin
    rsa_start_w = 0;
    case(state_r)
        S_READ: begin
            if (avm_waitrequest)            rsa_start_w = 0; // S_READ
            else if (bytes_counter_r == 95) rsa_start_w = 1; // S_CALCULATE
            else                            rsa_start_w = 0;
        end
    endcase
end

// core outputs logic
always @(*) begin
    dec_w = dec_r;
    case(state_r)
        S_CALCULATE: dec_w = rsa_dec;
        S_WRITE: if (!avm_waitrequest)  dec_w[255:0] = {dec_r[247:0], 8'b0}; // NOT S_WRITE
    endcase
end

// AVM interface logic
always @(*) begin
    StartRead(STATUS_BASE);
    case(state_r)
        S_QUERY_RX: begin
            if (!avm_waitrequest && avm_readdata[RX_OK_BIT])    StartRead(RX_BASE);     // S_READ
            else                                                StartRead(STATUS_BASE);
        end
        S_READ: begin
            if (avm_waitrequest)    StartRead(RX_BASE);     // S_READ
            else                    StartRead(STATUS_BASE);
        end
        S_CALCULATE:    StartRead(STATUS_BASE);
        S_QUERY_TX: begin
            if (!avm_waitrequest && avm_readdata[TX_OK_BIT])    StartWrite(TX_BASE);    // S_WRITE
            else                                                StartRead(STATUS_BASE);
        end
        S_WRITE: begin
            if (avm_waitrequest)    StartWrite(TX_BASE);    // S_WRITE
            else                    StartRead(STATUS_BASE);
        end
    endcase
end

// sequential logic
always_ff @(posedge avm_clk or posedge avm_rst) begin
    if (avm_rst) begin
        n_r <= 0;
        d_r <= 0;
        enc_r <= 0;
        dec_r <= 0;
        avm_address_r <= STATUS_BASE;
        avm_read_r <= 1;
        avm_write_r <= 0;
        state_r <= S_QUERY_RX;
        bytes_counter_r <= 0;
        rsa_start_r <= 0;
    end else begin
        n_r <= n_w;
        d_r <= d_w;
        enc_r <= enc_w;
        dec_r <= dec_w;
        avm_address_r <= avm_address_w;
        avm_read_r <= avm_read_w;
        avm_write_r <= avm_write_w;
        state_r <= state_w;
        bytes_counter_r <= bytes_counter_w;
        rsa_start_r <= rsa_start_w;
    end
end

endmodule