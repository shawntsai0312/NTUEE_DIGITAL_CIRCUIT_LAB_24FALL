// qsys.v

// Generated using ACDS version 15.0 145

`timescale 1 ps / 1 ps
module qsys (
		output wire        altpll_100k_clk,                   //              altpll_100k.clk
		output wire        altpll_108m_clk,                   //              altpll_108m.clk
		output wire        altpll_12m_clk,                    //               altpll_12m.clk
		output wire        altpll_400k_clk,                   //              altpll_400k.clk
		input  wire        clk_clk,                           //                      clk.clk
		input  wire        reset_reset_n,                     //                    reset.reset_n
		input  wire [1:0]  usb_0_avalon_usb_slave_address,    //   usb_0_avalon_usb_slave.address
		input  wire        usb_0_avalon_usb_slave_chipselect, //                         .chipselect
		input  wire        usb_0_avalon_usb_slave_read,       //                         .read
		input  wire        usb_0_avalon_usb_slave_write,      //                         .write
		input  wire [15:0] usb_0_avalon_usb_slave_writedata,  //                         .writedata
		output wire [15:0] usb_0_avalon_usb_slave_readdata,   //                         .readdata
		input  wire        usb_0_external_interface_INT1,     // usb_0_external_interface.INT1
		inout  wire [15:0] usb_0_external_interface_DATA,     //                         .DATA
		output wire        usb_0_external_interface_RST_N,    //                         .RST_N
		output wire [1:0]  usb_0_external_interface_ADDR,     //                         .ADDR
		output wire        usb_0_external_interface_CS_N,     //                         .CS_N
		output wire        usb_0_external_interface_RD_N,     //                         .RD_N
		output wire        usb_0_external_interface_WR_N,     //                         .WR_N
		input  wire        usb_0_external_interface_INT0      //                         .INT0
	);

	wire    rst_controller_reset_out_reset; // rst_controller:reset_out -> [altpll_0:reset, usb_0:reset]

	qsys_altpll_0 altpll_0 (
		.clk       (clk_clk),                        //       inclk_interface.clk
		.reset     (rst_controller_reset_out_reset), // inclk_interface_reset.reset
		.read      (),                               //             pll_slave.read
		.write     (),                               //                      .write
		.address   (),                               //                      .address
		.readdata  (),                               //                      .readdata
		.writedata (),                               //                      .writedata
		.c0        (altpll_108m_clk),                //                    c0.clk
		.c1        (altpll_12m_clk),                 //                    c1.clk
		.c2        (altpll_100k_clk),                //                    c2.clk
		.c3        (altpll_400k_clk),                //                    c3.clk
		.areset    (),                               //        areset_conduit.export
		.locked    (),                               //        locked_conduit.export
		.phasedone ()                                //     phasedone_conduit.export
	);

	qsys_usb_0 usb_0 (
		.clk        (clk_clk),                           //                clk.clk
		.reset      (rst_controller_reset_out_reset),    //              reset.reset
		.address    (usb_0_avalon_usb_slave_address),    //   avalon_usb_slave.address
		.chipselect (usb_0_avalon_usb_slave_chipselect), //                   .chipselect
		.read       (usb_0_avalon_usb_slave_read),       //                   .read
		.write      (usb_0_avalon_usb_slave_write),      //                   .write
		.writedata  (usb_0_avalon_usb_slave_writedata),  //                   .writedata
		.readdata   (usb_0_avalon_usb_slave_readdata),   //                   .readdata
		.irq        (),                                  //          interrupt.irq
		.OTG_INT1   (usb_0_external_interface_INT1),     // external_interface.export
		.OTG_DATA   (usb_0_external_interface_DATA),     //                   .export
		.OTG_RST_N  (usb_0_external_interface_RST_N),    //                   .export
		.OTG_ADDR   (usb_0_external_interface_ADDR),     //                   .export
		.OTG_CS_N   (usb_0_external_interface_CS_N),     //                   .export
		.OTG_RD_N   (usb_0_external_interface_RD_N),     //                   .export
		.OTG_WR_N   (usb_0_external_interface_WR_N),     //                   .export
		.OTG_INT0   (usb_0_external_interface_INT0)      //                   .export
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
