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
// Create Date:   00:01:58 08/27/2021
// Design Name:   CLA_16_bit_lookahead
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/cla_16_bit_lookahead_testbench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16_bit_lookahead
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla_16_bit_lookahead_testbench;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [15:0] sum;

	// Instantiate the Unit Under Test (UUT)
	CLA_16_bit_lookahead uut (
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
        $finish;
	end
      
endmodule

