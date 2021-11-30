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
// Create Date:   23:36:20 08/26/2021
// Design Name:   CLA_16_bit_ripple
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/cla_16_bit_ripple_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16_bit_ripple
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_16_bit_ripple_testbench;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [15:0] sum;

	// Instantiate the Unit Under Test (UUT)
	CLA_16_bit_ripple uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
        $dumpfile("variables.vcd");
        //$dumpvars(0, top);
        $monitor( "a = %b b = %b | sum = %b", a, b, sum);
        a = 16'b1111111100111111;
        b = 16'b0101010101010101;
        cin = 0;
        #20;
        a = 16'b1100111100111001;
        b = 16'b0111010101010101;
        cin = 0;
        #20;
        a = 16'b0100100100111001;
        b = 16'b0101011101010111;
        cin = 0;
        #20;
        $finish;

	end
      
endmodule

