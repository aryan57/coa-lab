`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 1
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:    23:31:20 09/27/2021 
// Design Name: 
// Module Name:    test_bench_lfsr 
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

module test_bench_lfsr;

	// Inputs
	reg clk;
	reg reset;
	reg select;
	reg [3:0] seed;

	// Outputs
	wire [3:0] status;

	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.clk(clk), 
		.reset(reset), 
		.select(select), 
		.seed(seed), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		select = 0;
		seed = 4'b1111;
		#5 select = 1;
		#127
		$finish;
	end
	always #4 clk = ~clk;
      
endmodule

