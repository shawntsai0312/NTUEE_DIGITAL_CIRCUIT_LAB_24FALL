module TestSlave (
	input               avm_clk,
	input               avm_rst_n,
	input        [4:0]  avm_address,
	input               avm_actually_read,
	output logic [31:0] avm_readdata,
	input               avm_actually_write,
	input        [31:0] avm_writedata,

	output             to232_rdy,
	input              to232_ack,
	output logic [7:0] to232_dat,
	input              from232_rdy,
	output             from232_ack,
	input  logic [7:0] from232_dat
);

	logic [7:0] txdat;
	logic [7:0] rxdat;
	logic tx_src_rdy;
	logic tx_src_ack;
	logic rx_dst_rdy;
	logic rx_dst_ack;
	PPForward u_txctrl(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.src_rdy(tx_src_rdy),
		.src_ack(tx_src_ack),
		.dst_rdy(to232_rdy),
		.dst_ack(to232_ack)
	);
	PPForward u_rxctrl(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.src_rdy(from232_rdy),
		.src_ack(from232_ack),
		.dst_rdy(rx_dst_rdy),
		.dst_ack(rx_dst_ack)
	);
	assign rx_dst_ack = avm_actually_read && avm_address == 0;
	assign tx_src_rdy = avm_actually_write && avm_address == 4;
	assign to232_dat = txdat;

	always @(posedge avm_clk or negedge avm_rst_n) begin
		if (!avm_rst_n) begin
			txdat <= 0;
			rxdat <= 0;
		end else begin
			if (tx_src_ack) begin
				txdat <= avm_writedata;
			end
			if (from232_ack) begin
				rxdat <= from232_dat;
			end
		end
	end

	always @* begin
		avm_readdata = 32'bx;
		if (avm_actually_read) begin
			case (avm_address)
				0: avm_readdata = rxdat;
				8: avm_readdata = {24'b0,rx_dst_rdy,!to232_rdy,6'b0};
			endcase
		end
	end
endmodule

module tb;
	localparam CLK = 10;
	localparam HCLK = CLK/2;

	logic avm_rst_n;
	logic avm_clk;
	initial avm_clk = 0;
	always #HCLK avm_clk = ~avm_clk;

	logic [4:0]  avm_address;
	logic        avm_read;
	logic [31:0] avm_readdata;
	logic        avm_write;
	logic [31:0] avm_writedata;
	logic        avm_waitrequest;
	logic        avm_rdy;
	logic        avm_ack;
	logic        avm_actually_read;
	logic        avm_actually_write;
	logic        to232_rdy;
	logic        to232_ack;
	logic [7:0]  to232_dat;
	logic        from232_rdy;
	logic        from232_ack;
	logic [7:0]  from232_dat;
	logic        pass;

	Rsa256Wrapper u_master(
		.avm_rst(!avm_rst_n),
		.avm_clk(avm_clk),
		.avm_address(avm_address),
		.avm_read(avm_read),
		.avm_readdata(avm_readdata),
		.avm_write(avm_write),
		.avm_writedata(avm_writedata),
		.avm_waitrequest(avm_waitrequest)
	);
	assign avm_rdy = avm_read || avm_write;
	assign avm_waitrequest = !avm_ack;
	assign avm_actually_read = avm_read && avm_ack;
	assign avm_actually_write = avm_write && avm_ack;
	PPRandomDst#(1,4) u_pp_rnd_m2s(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy(avm_rdy),
		.ack(avm_ack)
	);
	TestSlave u_slave(
		.avm_rst_n(avm_rst_n),
		.avm_clk(avm_clk),
		.avm_address(avm_address),
		.avm_actually_read(avm_actually_read),
		.avm_readdata(avm_readdata),
		.avm_actually_write(avm_actually_write),
		.avm_writedata(avm_writedata),
		.to232_rdy(to232_rdy),
		.to232_ack(to232_ack),
		.to232_dat(to232_dat),
		.from232_rdy(from232_rdy),
		.from232_ack(from232_ack),
		.from232_dat(from232_dat)
	);
	PPRandomDst#(1,8) u_pp_rnd_to232(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy(to232_rdy),
		.ack(to232_ack)
	);
	PPRandomSrc#(1,8) u_pp_rnd_from232(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy(from232_rdy),
		.ack(from232_ack)
	);
	PPCheck#(5) u_premature_read(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy_and_dat({avm_read,avm_address}),
		.ack(avm_actually_read)
	);
	PPCheck#(5+32) u_premature_write(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy_and_dat({avm_write,avm_address,avm_writedata}),
		.ack(avm_actually_write)
	);
	PPCheck#(8) u_premature_tx(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy_and_dat({u_slave.tx_src_rdy,u_slave.avm_writedata}),
		.ack(u_slave.tx_src_ack)
	);
	PPCheck#(0) u_premature_rx(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy_and_dat(u_slave.rx_dst_rdy),
		.ack(u_slave.rx_dst_ack)
	);
	PPFileInitiator #(8,"%x") u_input(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.rdy(from232_rdy),
		.ack(from232_ack),
		.dat(from232_dat)
	);
	PPFileMonitor #(8,"%x",100) u_output(
		.clk(avm_clk),
		.rst_n(avm_rst_n),
		.ack(to232_ack),
		.dat(to232_dat)
	);

	localparam EXTRA_ACK = 2;
	initial begin
		$dumpfile("wrapper.fsdb");
		$dumpvars;
		u_input.fp = $fopen("wrapper_input.txt", "r");
		u_output.fp = $fopen("wrapper_output.txt", "r");
		u_output.expected = 217;
		u_pp_rnd_m2s.count = -1;
		u_pp_rnd_from232.count = 288;
		u_pp_rnd_to232.count = 217 + EXTRA_ACK;
		avm_rst_n = 1;
		#1;
		avm_rst_n = 0;
		#100;
		avm_rst_n = 1;
		for (int i = 0; i < 1000000; ++i) begin
			@(posedge avm_clk)
			if (u_pp_rnd_from232.count == 0 && u_pp_rnd_to232.count <= EXTRA_ACK) begin
				for (int j = 0; j < 100; ++j) begin
					@(posedge avm_clk);
				end
				pass = 1;
				$display("Simulation done");
				u_output.Report(pass);
				if (pass) begin
					$display("+======================+");
					$display("|  Simulation Correct  |");
					$display("+======================+");
				end else begin
					$display("+====================+");
					$display("|  Simulation Wrong  |");
					$display("+====================+");
				end
				$finish;
			end
		end
		$display("Simulation time too long.");
		$display("+====================+");
		$display("|  Simulation Fuck  |");
		$display("+====================+");
		$finish;
	end

	always @(posedge avm_clk) begin
		if (avm_read && avm_write) begin
			$display("You cannot assert read and write at the same cycle");
			$display("+====================+");
			$display("|  Simulation Dick  |");
			$display("+====================+");
			$finish;
		end
	end


endmodule
