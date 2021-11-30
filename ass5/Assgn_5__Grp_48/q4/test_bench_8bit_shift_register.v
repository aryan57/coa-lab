
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 4
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
//
// Create Date:   07:32:22 09/28/2021
// Design Name:   shift_register
// Module Name:   D:/Downloads/Assignment5/test_bench_8bit_shift_register.v
// Project Name:  Assignment5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_8bit_shift_register;

	// Inputs
	reg clk;
	reg reset;
	reg mode;
	reg sin;
	reg [7:0] p_in;

	// Outputs
	wire sout;
	wire [7:0] status;

	// Instantiate the Unit Under Test (UUT)
	shift_register uut (
		.clk(clk), 
		.reset(reset), 
		.mode(mode), 
		.sin(sin), 
		.p_in(p_in), 
		.sout(sout), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		mode = 0;
		sin = 0;
		p_in = 8'b10010010;
		#5 mode = 1;
		#64
		$finish;
	end
	always #4 clk = ~clk;
      
endmodule

