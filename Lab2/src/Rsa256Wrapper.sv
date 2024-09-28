// module Rsa256Wrapper (
//     input         avm_rst,
//     input         avm_clk,
//     output  [4:0] avm_address,
//     output        avm_read,
//     input  [31:0] avm_readdata,
//     output        avm_write,
//     output [31:0] avm_writedata,
//     input         avm_waitrequest
// );

// localparam RX_BASE     = 0*4;
// localparam TX_BASE     = 1*4;
// localparam STATUS_BASE = 2*4;
// localparam TX_OK_BIT   = 6;
// localparam RX_OK_BIT   = 7;

// // Feel free to design your own FSM!
// localparam S_QUERY_RX = 0;
// localparam S_READ = 1;
// localparam S_CALCULATE = 2;
// localparam S_QUERY_TX = 3;
// localparam S_WRITE = 4;

// // state
// logic [2:0] state_r, state_w;

// // counter used to count the bytes of the message
// // 1 byte each read / write
// logic [6:0] bytes_counter_r, bytes_counter_w;

// // core inputs
// logic [255:0] n_r, n_w;
// logic [255:0] d_r, d_w;
// logic [255:0] enc_r, enc_w;

// // core control
// logic rsa_start_r, rsa_start_w;

// // core outputs
// logic [255:0] dec_r, dec_w;

// // AVM interface
// logic [4:0] avm_address_r, avm_address_w;
// logic avm_read_r, avm_read_w;
// logic avm_write_r, avm_write_w;

// // core output wires
// wire rsa_finished;
// wire [255:0] rsa_dec;

// assign avm_address = avm_address_r;
// assign avm_read = avm_read_r;
// assign avm_write = avm_write_r;
// assign avm_writedata = dec_r[247-:8]; // dec_r[247:240]

// Rsa256Core rsa256_core(
//     .i_clk(avm_clk),
//     .i_rst(avm_rst),
//     .i_start(rsa_start_r),
//     .i_a(enc_r),
//     .i_d(d_r),
//     .i_n(n_r),
//     .o_a_pow_d(rsa_dec),
//     .o_finished(rsa_finished)
// );

// task StartRead;
//     input [4:0] addr;
//     begin
//         avm_read_w = 1;
//         avm_write_w = 0;
//         avm_address_w = addr;
//     end
// endtask
// task StartWrite;
//     input [4:0] addr;
//     begin
//         avm_read_w = 0;
//         avm_write_w = 1;
//         avm_address_w = addr;
//     end
// endtask

// // state transition
// always_comb begin
//     state_w = state_r;
//     case(state_r)
//         S_QUERY_RX: begin
//             if (!avm_waitrequest && avm_readdata[RX_OK_BIT])    state_w = S_READ;
//             else                                                state_w = S_QUERY_RX;
//         end
//         S_READ: begin
//             // when already read 32*3-1 bytes (counter = 94), then the next state is calculation
//             if (bytes_counter_r == 94)  state_w = S_CALCULATE;
//             else                        state_w = S_QUERY_RX;
//         end
//         S_CALCULATE: begin
//             if (rsa_finished)   state_w = S_QUERY_TX;
//             else                state_w = S_CALCULATE;
//         end
//         S_QUERY_TX: begin
//             if (!avm_waitrequest && avm_readdata[TX_OK_BIT])    state_w = S_WRITE;
//             else                                                state_w = S_QUERY_TX;
//         end
//         S_WRITE: begin
//             // when already write 32-1 bytes (counter = 30), then the next state is query rx
//             if (bytes_counter_r == 30)  state_w = S_QUERY_RX;
//             else                        state_w = S_QUERY_TX;
//         end
//     endcase
// end

// // counter logic
// always_comb begin
//     bytes_counter_w = bytes_counter_r;
//     case(state_r)
//         S_READ: begin
//             if(bytes_counter_r == 94)   bytes_counter_w = 0;
//             else                        bytes_counter_w = bytes_counter_r + 1;
//         end
//         S_WRITE: begin
//             if(bytes_counter_r == 30)   bytes_counter_w = 0;
//             else                        bytes_counter_w = bytes_counter_r + 1;
//         end
//     endcase
// end

// // core inputs logic
// always_comb begin
//     n_w = n_r;
//     d_w = d_r;
//     enc_w = enc_r;
//     case(state_r)
//         S_READ: begin
//             if (bytes_counter_r < 31)       n_w = {n_r[255:8], avm_readdata};
//             else if (bytes_counter_r < 63)  d_w = {d_r[255:8], avm_readdata};
//             else                            enc_w = {enc_r[255:8], avm_readdata};
//         end
//     endcase
// end

// // core control logic
// always_comb begin
//     rsa_start_w = 0;
//     case(state_r)
//         S_READ: begin
//             // when already read 32*3-1 bytes (counter = 94), then the next state is calculation
//             if (bytes_counter_r == 94)  rsa_start_w = 1;
//         end
//     endcase
// end

// // core outputs logic
// always_comb begin
//     dec_w = dec_r;
//     case(state_r)
//         S_CALCULATE: dec_w = rsa_dec;
//         S_QUERY_TX:  dec_w = dec_r << 8;
//     endcase
// end

// // AVM interface logic
// always_comb begin
//     StartRead(STATUS_BASE);
//     case(state_r)
//         S_QUERY_RX: begin
//             if (!avm_waitrequest && avm_readdata[RX_OK_BIT])    StartRead(RX_BASE);
//             else                                                StartRead(STATUS_BASE);
//         end
//         S_READ:         StartRead(STATUS_BASE);
//         S_CALCULATE:    StartRead(STATUS_BASE);
//         S_QUERY_TX: begin
//             if (!avm_waitrequest && avm_readdata[TX_OK_BIT])    StartWrite(TX_BASE);
//             else                                                StartRead(STATUS_BASE);
//         end
//         S_WRITE:        StartRead(STATUS_BASE);
//     endcase
// end

// // sequential logic
// always_ff @(posedge avm_clk or posedge avm_rst) begin
//     if (avm_rst) begin
//         n_r <= 0;
//         d_r <= 0;
//         enc_r <= 0;
//         dec_r <= 0;
//         avm_address_r <= STATUS_BASE;
//         avm_read_r <= 1;
//         avm_write_r <= 0;
//         state_r <= S_QUERY_RX;
//         bytes_counter_r <= 63;
//         rsa_start_r <= 0;
//     end else begin
//         n_r <= n_w;
//         d_r <= d_w;
//         enc_r <= enc_w;
//         dec_r <= dec_w;
//         avm_address_r <= avm_address_w;
//         avm_read_r <= avm_read_w;
//         avm_write_r <= avm_write_w;
//         state_r <= state_w;
//         bytes_counter_r <= bytes_counter_w;
//         rsa_start_r <= rsa_start_w;
//     end
// end

// endmodule

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
localparam S_GET_KEY_1      = 0;
localparam S_GET_DATA       = 1;
localparam S_WAIT_CALCULATE = 2;
localparam S_GET_KEY_2      = 3;
localparam S_SEND_DATA      = 4;
localparam S_DONE = 5;

logic [255:0] n_r, n_w, d_r, d_w, enc_r, enc_w, dec_r, dec_w;
logic [2:0] state_r, state_w;
logic [6:0] bytes_counter_r, bytes_counter_w;
logic [4:0] avm_address_r, avm_address_w;
logic avm_read_r, avm_read_w, avm_write_r, avm_write_w;

logic rsa_start_r, rsa_start_w;
logic rsa_finished;
logic [255:0] rsa_dec;

assign avm_address      = avm_address_r;
assign avm_read         = avm_read_r;
assign avm_write        = avm_write_r;
assign avm_writedata    = dec_r[247-:8];

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
        avm_read_w      = 1;
        avm_write_w     = 0;
        avm_address_w   = addr;
    end
endtask
task StartWrite;
    input [4:0] addr;
    begin
        avm_read_w      = 0;
        avm_write_w     = 1;
        avm_address_w   = addr;
    end
endtask

always_comb begin
   // TODO
   n_w = n_r;
   d_w = d_r;
   enc_w = enc_r;
   dec_w = dec_r;
   avm_address_w = avm_address_r;
   avm_read_w = avm_read_r;
   avm_write_w = avm_write_r;
   state_w = state_r;
   bytes_counter_w = bytes_counter_r;
   rsa_start_w = rsa_start_r;


   case(state_r)
   S_GET_DATA:begin
       if((!avm_waitrequest) ) begin
        StartRead(STATUS_BASE);
        state_w = S_GET_DATA;
           if(bytes_counter_r <= 32)begin
               n_w = {n_r[247:0], avm_readdata[7:0]};
           end else begin
               if(bytes_counter_r <= 64)begin
                    d_w = {d_r[247:0], avm_readdata[7:0]};
               end else begin
                   enc_w = {enc_r[247:0], avm_readdata[7:0]};
               end 
           end
           state_w = S_GET_KEY_1;
           avm_address_w = STATUS_BASE;
           if(bytes_counter_r == 96)begin
                state_w = S_WAIT_CALCULATE;
                rsa_start_w = 1;
            end 
       end else begin
            state_w = S_GET_DATA;
            StartRead(RX_BASE);
       end
   end
   S_GET_KEY_1:begin
       if((!avm_waitrequest) && (avm_readdata[RX_OK_BIT])) begin
           state_w = S_GET_DATA;
           StartRead(RX_BASE);
           bytes_counter_w = bytes_counter_r + 1;
       end else begin
            StartRead(STATUS_BASE);
            state_w = S_GET_KEY_1;
       end
       
   end
   S_WAIT_CALCULATE:begin
        rsa_start_w = 0;
        StartRead(STATUS_BASE);
       if(rsa_finished) begin
           dec_w = rsa_dec;
           state_w = S_GET_KEY_2;
           bytes_counter_w = 0;
       end else begin
           state_w = S_WAIT_CALCULATE;
       end
   end
   S_SEND_DATA:begin
       if((!avm_waitrequest) ) begin
           StartRead(STATUS_BASE);
           if (bytes_counter_r <= 30) begin
                state_w = S_GET_KEY_2;
                dec_w = dec_r << 8;
           end else begin
                dec_w = 0;
                enc_w = 0;
                state_w = S_GET_KEY_1;
                bytes_counter_w = 64;
           end
       end else begin
           StartWrite(TX_BASE);
           state_w = S_SEND_DATA;
       end
   end
   S_GET_KEY_2:begin      
       if((!avm_waitrequest) && (avm_readdata[TX_OK_BIT])) begin
           state_w = S_SEND_DATA;
           StartWrite(TX_BASE);
           bytes_counter_w = bytes_counter_r + 1;
       end else begin
            StartRead(STATUS_BASE);
            state_w = S_GET_KEY_2;
       end  
       
   end
//    S_DONE: begin
//         n_w = n_r;
//         d_w = d_r;
//         enc_w = enc_r;
//         dec_w = dec_r;
//         avm_address_w = avm_address_r;
//         avm_read_w = 1;
//         avm_write_w = 0;
//         state_w = state_r;
//         bytes_counter_w = 0;
//         rsa_start_w = 0;
//    end
   default :begin
        n_w = n_r;
        d_w = d_r;
        enc_w = enc_r;
        dec_w = dec_r;
        avm_address_w = avm_address_r;
        avm_read_w = 1;
        avm_write_w = 0;
        state_w = state_r;
        bytes_counter_w = 0;
        rsa_start_w = 0;
   end
   endcase

end


always_ff @(posedge avm_clk or posedge avm_rst) begin
    if (avm_rst) begin
        n_r             <= 0;
        d_r             <= 0;
        enc_r           <= 0;
        dec_r           <= 0;
        avm_address_r   <= STATUS_BASE;
        avm_read_r      <= 1;
        avm_write_r     <= 0;
        state_r         <= S_GET_KEY_1;
        bytes_counter_r <= 0;
        rsa_start_r     <= 0;
    end else begin
        n_r             <= n_w;
        d_r             <= d_w;
        enc_r           <= enc_w;
        dec_r           <= dec_w;
        avm_address_r   <= avm_address_w;
        avm_read_r      <= avm_read_w;
        avm_write_r     <= avm_write_w;
        state_r         <= state_w;
        bytes_counter_r <= bytes_counter_w;
        rsa_start_r     <= rsa_start_w;
    end
end

endmodule