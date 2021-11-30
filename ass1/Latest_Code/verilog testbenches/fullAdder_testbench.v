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
// Create Date:   15:09:29 08/27/2021
// Design Name:   fullAdder
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/fullAdder_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fullAdder_testbench;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire cout;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	fullAdder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 1;
		cin = 1;
		#20;
		a = 0;
		b = 1;
		cin = 0;
		#20;
		a = 1;
		b = 1;
		cin = 0;
		#20;
		// Add stimulus here
		$finish;
	end
      
endmodule

