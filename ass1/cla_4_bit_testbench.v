`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 1
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:   22:22:02 08/25/2021
// Design Name:   CLA_4_bit
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/cla_4_bit_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_4bit_testbench;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [3:0] sum;

	// Instantiate the Unit Under Test (UUT)
	CLA_4_bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
        $dumpfile("variables.vcd");
        //$monitor( "a = %b b = %b | sum = %b ", a, b, sum);
        a = 4'b1011;
        b = 4'b0001;
        cin=0;
        #100;
        $finish;

	end
      
endmodule

