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
// Create Date:   15:12:04 08/27/2021
// Design Name:   rca_32_bit
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/rca_32_bit_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_32_bit_testbench;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [31:0] sum;

	// Instantiate the Unit Under Test (UUT)
	rca_32_bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 32'b00111110101111110011111010111111;
		b = 32'b01010101010101010101010101010101;
		cin = 0;
		#20;
		a = 32'b10111110100111000011111010100110;
		b = 32'b01010111010101110101011101110111;
		cin = 0;
		#20;
		a = 32'b00111110101111110000100100111111;
		b = 32'b01010111010101010111111111010101;
		cin = 0;
		#20;		
		// Add stimulus here

	end
      
endmodule

