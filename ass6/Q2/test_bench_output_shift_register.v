`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 6
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:   17:07:12 10/09/2021
// Design Name:   output_shift_register
// Module Name:   D:/Downloads/Assignment_6/test_bench_output_shift_register.v
// Project Name:  Assignment_6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: output_shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_output_shift_register;

	// Inputs
	reg clk;
	reg sin;

	// Outputs
	wire [7:0] status;

	// Instantiate the Unit Under Test (UUT)
	output_shift_register uut (
		.clk(clk), 
		.sin(sin), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		sin = 1;
		#64
		$finish;
	end
	always #4 clk = ~clk;
      
endmodule

