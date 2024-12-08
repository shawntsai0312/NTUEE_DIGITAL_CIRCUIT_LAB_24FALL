// (C) 2001-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

/******************************************************************************
 *                                                                            *
 * This module reads and writes data to USB chip on the DE2 Board.            *
 *                                                                            *
 ******************************************************************************/

module qsys_usb_0 (
	// Inputs
	clk,
	reset,

	address,
	chipselect,
	read,
	write,
	writedata,

	OTG_INT0,
	OTG_INT1,

	// Bidirectionals
	OTG_DATA,

	// Outputs
	readdata,

	irq,

	OTG_RST_N,
	OTG_ADDR,
	OTG_CS_N,
	OTG_RD_N,
	OTG_WR_N
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 1: 0]	address;
input						chipselect;
input						read;
input						write;
input			[15: 0]	writedata;

input						OTG_INT0;
input						OTG_INT1;

// Bidirectionals
inout			[15: 0]	OTG_DATA;

// Outputs
output reg	[15: 0]	readdata;

output reg				irq;

output reg				OTG_RST_N;
output reg	[ 1: 0]	OTG_ADDR;
output reg				OTG_CS_N;
output reg				OTG_RD_N;
output reg				OTG_WR_N;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers
reg			[15: 0]	data_to_usb_chip;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset == 1'b1)
	begin
		readdata				<= 16'h0000;

		irq					<= 1'b0;

		data_to_usb_chip	<= 16'h0000;

		OTG_RST_N			<= 1'b0;
		OTG_ADDR				<= 2'h0;
		OTG_CS_N				<= 1'b1;
		OTG_RD_N				<= 1'b1;
		OTG_WR_N				<= 1'b1;
	end
	else
	begin
		readdata				<= OTG_DATA;

		irq					<= ~OTG_INT1 | ~OTG_INT0;
		
		data_to_usb_chip	<= writedata[15:0];

		OTG_RST_N			<= 1'b1;
		OTG_ADDR				<= address;
		OTG_CS_N				<= ~chipselect;
		OTG_RD_N				<= ~read;
		OTG_WR_N				<= ~write;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign OTG_DATA	= OTG_WR_N ? 16'hzzzz : data_to_usb_chip;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

