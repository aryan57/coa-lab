`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:06:10 08/27/2021
// Design Name:   Full_Adder
// Module Name:   D:/COAA Lab/Assignment1/Full_Adder_Test.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Full_Adder_Test;

	// Inputs
	reg a;
	reg b;
	reg c0;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	Full_Adder uut (
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
		$monitor("a=%d, b=%d, carr_in=%d --> sum=%d, carry_out=%d\n", a, b, c0, s, c);
		#1 a=0; b=0;
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		#1 a=0; b=0; c0=1;
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		#1 $finish;
	end
      
endmodule

