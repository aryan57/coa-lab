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
// Create Date:   08:20:27 09/28/2021
// Design Name:   Comparator_32_bit
// Module Name:   D:/Downloads/Assignment5/test_bench_32bit_comparator.v
// Project Name:  Assignment5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparator_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_32bit_comparator;

	// Inputs
	reg clk;
	reg mode;
	reg op;
	reg rst;
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire L;
	wire E;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	Comparator_32_bit uut (
		.clk(clk), 
		.mode(mode), 
		.op(op), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.L(L), 
		.E(E), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 0;
		op = 0;
		rst = 0;
		a = 32'b10010010100100101011001010010010;
		b = 32'b10010010100100101001001010010010;
		#5 mode = 1;
		#1 rst = 1;
		#1 rst = 0;
		#255
		op = 1;
		#1
		$finish;
	end
	always #4 clk = ~clk;
      
endmodule

