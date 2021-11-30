`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:    23:31:20 09/27/2021 
// Design Name: 
// Module Name:    test_bench_two_comp_fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_two_comp_fsm;

	// Inputs
	reg in;
	reg rst;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	two_comp_fsm uut (
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

		#1 rst = 1; // do reset
		#1 rst = 0; // get reset back to 0 and do input=0
			in = 0;
		#6 in = 0; // change inputs at 6 units of time
		#6 in = 1;
		#6 in = 0;
		#6 in = 1;
		#6
		$finish;

	end
	
	always #3 clk = ~clk;
      
endmodule

