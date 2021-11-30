`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:17:54 08/27/2021
// Design Name:   RCA_8Bit_Adder
// Module Name:   D:/COAA Lab/Assignment1/RCA_8Bit_Adder_Test.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_8Bit_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA_8Bit_Adder_Test;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg c0;

	// Outputs
	wire [7:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	RCA_8Bit_Adder uut (
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
		$monitor("a=%d, b=%d, Carry_In=%d --> sum=%d, Carry_out=%d \n", a, b, c0, s, c);
		
		#1 a = 8'd10; b = 8'd15; c0 = 1;
		#1 a = 8'd100; b = 8'd105; c0 = 0;
		#1 a = 8'd110; b = 8'd115; c0 = 0;
		#1 a = 8'd108; b = 8'd125; c0 = 0;
		#1 a = 8'd11; b = 8'd15; c0 = 0;
		#1 a = 8'd115; b = 8'd140; c0 = 0;
		#1 a = 8'd115; b = 8'd140; c0 = 1;
		#1 $finish;
	end
      
endmodule

