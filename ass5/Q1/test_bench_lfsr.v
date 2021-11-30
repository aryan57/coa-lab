`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:26:31 09/28/2021
// Design Name:   lfsr
// Module Name:   D:/Downloads/Assignment5/test_bench_lfsr.v
// Project Name:  Assignment5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lfsr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_lfsr;

	// Inputs
	reg clk;
	reg reset;
	reg mode;
	reg [3:0] p_in;

	// Outputs
	wire [3:0] status;

	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.clk(clk), 
		.reset(reset), 
		.mode(mode), 
		.p_in(p_in), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		mode = 0;
		p_in = 4'b1111;
		#10
		mode = 1;
		#95
		$finish;
	end
	always #3 clk = ~clk;
      
endmodule

