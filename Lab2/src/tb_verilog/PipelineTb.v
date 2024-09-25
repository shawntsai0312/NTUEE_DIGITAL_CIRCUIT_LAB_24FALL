module PPRandomSrc #(
	parameter PROB = 200,
	parameter ORDER = 8
)(
	input      clk,
	input      rst_n,
	output reg rdy,
	input      ack
);

localparam MASK = (1<<ORDER)-1;
integer count;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		rdy <= 0;
	end else if (ack || !rdy) begin
		if (count != 0 && ($random & MASK) < PROB) begin
			rdy <= 1;
			count <= count - 1;
		end else begin
			rdy <= 0;
		end
	end
end

endmodule

//////////
//////////

module PPRandomDst #(
	parameter PROB = 200,
	parameter ORDER = 8
)(
	input      clk,
	input      rst_n,
	input      rdy,
	output reg ack
);

integer count;
localparam MASK = (1<<ORDER)-1;
reg can_ack;
always@* ack = can_ack & rdy;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n || rdy) begin
		can_ack <= count != 0 && ($random&MASK) < PROB;
	end
	if (ack) begin
		count <= count - 1;
	end
end

endmodule

//////////
//////////

module PPCheck #(
	parameter BW = 0
)(
	input clk,
	input rst_n,
	input [BW:0] rdy_and_dat,
	input ack
);

reg should_keep;
reg [BW:0] prev;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		should_keep <= 0;
	end else begin
		if (should_keep && (prev !== rdy_and_dat || ^prev === 1'bx)) begin
			$display("Protocol not met %m");
			$display("+====================+");
			$display("|  Simulation Abort  |");
			$display("+====================+");
			$finish;
		end
		prev <= rdy_and_dat;
		should_keep <= {rdy_and_dat[BW],ack} == 2'b10;
	end
end

endmodule

//////////
//////////

module PPFileInitiator #(
	parameter BW=1,
	parameter [127:0] FMT="%d"
)(
	input clk,
	input rst_n,
	input rdy,
	input ack,
	output reg [BW-1:0] dat
);

localparam [BW-1:0] X = {BW{1'bx}};

integer fp;
reg [BW-1:0] dat_w, dat_r;

always @* dat = rdy ? dat_r: X;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		$fseek(fp, 0, 0);
		$fscanf(fp, FMT, dat_r);
	end else if (ack) begin
		if ($feof(fp)) begin
			dat_w = X;
		end else begin
			$fscanf(fp, FMT, dat_w);
		end
		dat_r <= dat_w;
	end
end

endmodule

//////////
//////////

module PPFileMonitor #(
	parameter BW=1,
	parameter [127:0] FMT="%d",
	parameter MAX_ERR = 100
)(
	input clk,
	input rst_n,
	input ack,
	input [BW-1:0] dat
);

localparam [BW-1:0] X = {BW{1'bx}};

integer fp, expected;
integer error, received;
reg [BW-1:0] dat_r;
reg [BW-1:0] dat_w;
task Report;
	inout pass;
begin
	$display("Report of %m:"              );
	$display("    %10d Expected", expected);
	$display("    %10d Received", received);
	$display("    %10d Error"   , error   );
	pass = pass && expected === received && error === 0;
end
endtask

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		$fseek(fp, 0, 0);
		error = 0;
		received = 0;
		if ($feof(fp)) begin
			dat_w = X;
		end else begin
			$fscanf(fp, FMT, dat_r);
		end
	end else if (ack) begin
		if ($feof(fp)) begin
			dat_w = X;
		end else begin
			$fscanf(fp, FMT, dat_w);
		end
		dat_r <= dat_w;
		received <= received + 1;
		if (^dat === 1'bx || dat_r !== dat) begin
			$display("[%m] (Simulated/Expected) %x / %x", dat, dat_r);
			if (error == MAX_ERR) begin
				$display("%m max error (%d) reached", MAX_ERR);
				$display("+====================+");
				$display("|  Simulation Abort  |");
				$display("+====================+");
				$finish;
			end
			error <= error + 1;
		end
	end
end

endmodule
