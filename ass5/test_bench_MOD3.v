`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 3
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
//
// Create Date:   00:01:57 09/28/2021
// Design Name:   MOD3_FSM
// Module Name:   D:/Downloads/Assignment5/test_bench_MOD3.v
// Project Name:  Assignment5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MOD3_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_MOD3;

	// Inputs
	reg in;
	reg rst;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	MOD3_FSM uut (
		.in(in), 
		.rst(rst), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		rst = 0;
		clk = 0;
		#1 rst = 1;
		#1 rst = 0;
			in = 1;
		#6 in = 1;
		#6 in = 0;
		#6 in = 1;
		#6 in = 1;
		#6  
		$finish;
	end
	always #3 clk = ~clk;
      
endmodule

