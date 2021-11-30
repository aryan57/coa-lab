`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:14 08/27/2021
// Design Name:   Half_Adder
// Module Name:   D:/COAA Lab/Assignment1/Half_Adder_Test.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Half_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Half_Adder_Test;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	Half_Adder uut (
		.s(s), 
		.c(c), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor("a=%d, b=%d --> sum=%d, carry=%d \n", a, b, s, c);
		#1 a=0; b=0;
		#1 a=1; b=0;
		#1 a=0; b=1;
		#1 a=1; b=1;
		#1 a=0; b=0;
		#1 $finish;
	end
      
endmodule

