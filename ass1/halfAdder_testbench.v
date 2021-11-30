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
// Create Date:   15:03:31 08/27/2021
// Design Name:   halfAdder
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/halfAdder_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module halfAdder_testbench;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire cout;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	halfAdder uut (
		.a(a), 
		.b(b), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		$monitor( "a= %b b = %b | sum = %b cout = %b", a, b, sum, cout);
		// Initialize Inputs
		a = 1;
		b = 1;

		#20;
       	
		// Add stimulus here
		$finish;
	end
      
endmodule

