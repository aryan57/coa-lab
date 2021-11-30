`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 6
// Problem no - 3
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
//
// Create Date:   17:04:18 10/10/2021
// Design Name:   booth_test_bench
// Module Name:   /home/aryan/Documents/Academic pdfs/Semester Coursework/Sem 5/COA Lab/ass6/booth/test_booth.v
// Project Name:  booth
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_booth;

	// Inputs
	reg rst;
	reg clk;
	reg [7:0] M_in;
	reg [7:0] Q_in;
	reg [7:0] A_in;

	// Instantiate the Unit Under Test (UUT)
	booth uut (
		.rst(rst), 
		.clk(clk), 
		.M_in(M_in), 
		.Q_in(Q_in),
		.A_in(A_in)
	);

	initial begin
		// Initialize Inputs
	
		rst = 0;
		clk = 0;
		A_in = 8'b00000000; // 0
		M_in = 8'b10011100; // -100
		Q_in = 8'b01100100; // 100
		
		#1 rst = 1;
		#1 rst = 0;
		#63
		$finish;
	end
	always #4 clk = ~clk;
      
endmodule

