`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 1
// Problem no - 1
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:   15:16:15 08/27/2021
// Design Name:   rca_64_bit
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/rca_64_bit_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_64_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_64_bit_testbench;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [63:0] sum;

	// Instantiate the Unit Under Test (UUT)
	rca_64_bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 64'b0011111010110001111000000000001100111110101111110011111010111111;
		b = 64'b0101010101010101010101010101010101010101010101010101010101010101;
		cin = 0;
		#20;
		a = 64'b0011111010111111001111101011111100111110101111110011111010111111;
		b = 64'b0101010101111111010100000000000101010101010111110001000000010101;
		cin = 0;
		#20;
		a = 64'b1011111010111111111110000001111110101010000111011101000100010111;
		b = 64'b0101001001110010010100101100010101010101010101010101010101010101;
		cin = 0;
		#20;		
		// Add stimulus here

	end
      
endmodule

