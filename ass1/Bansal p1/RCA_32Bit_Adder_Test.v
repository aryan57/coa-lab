`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:51:40 08/27/2021
// Design Name:   RCA_32Bit_Adder
// Module Name:   D:/COAA Lab/Assignment1/RCA_32Bit_Adder_Test.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_32Bit_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA_32Bit_Adder_Test;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg c0;

	// Outputs
	wire [31:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	RCA_32Bit_Adder uut (
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
		$monitor("a=%d, b=%d, Carry_In=%d --> sum=%d, Carry_Out=%d\n", a, b, c0, s, c);
		#1 a = 32'd1000; b = 32'd10000; c0 = 1;
		#1 a = 32'd1043500; b = 32'd10546000; c0 = 0;
		#1 a = 32'd1005670; b = 32'd1087000; c0 = 0;
		#1 a = 32'd1323000; b = 32'd13320000; c0 = 0;
		#1 a = 32'd14000; b = 32'd102000; c0 = 1;
		#1 $finish;
		// Add stimulus here

	end
      
endmodule

