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
// Create Date:   15:14:19 08/27/2021
// Design Name:   rca_16_bit
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/rca_16_bit_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_16_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rca_16_bit_testbench;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [15:0] sum;

	// Instantiate the Unit Under Test (UUT)
	rca_16_bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 16'b1111111010111111;
		b = 16'b0101010101010101;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

