`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:36:27 08/27/2021
// Design Name:   RCA_16Bit_Adder
// Module Name:   D:/COAA Lab/Assignment1/RCA_16Bit_Adder_Test.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_16Bit_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA_16Bit_Adder_Test;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg c0;

	// Outputs
	wire [15:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	RCA_16Bit_Adder uut (
		.s(s), 
		.c(c), 
		.a(a), 
		.b(b), 
		.c0(c0)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("a=%d, b=%d, Carry_in=%d --> s=%d, Carry_out=%d\n", a, b, c0, s, c);
		#1 a = 16'd65500; b = 16'd35; c0 = 0;
		#1 a = 16'd65500; b = 16'd35; c0 = 1;
		#1 a = 16'd6000; b = 16'd35; c0 = 0;
		#1 a = 16'd6500; b = 16'd35; c0 = 1;
		#1 $finish;

	end
      
endmodule

