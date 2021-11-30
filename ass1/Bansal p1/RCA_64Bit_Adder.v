`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:56 08/27/2021 
// Design Name: 
// Module Name:    RCA_64Bit_Adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RCA_64Bit_Adder(s, c, a, b, c0);
	output [63:0] s;
	output c;
	input [63:0] a, b;
	input c0;
	
	wire w1;
	
	RCA_32Bit_Adder rca32bit1(s[31:0], w1, a[31:0], b[31:0], c0);
	RCA_32Bit_Adder rca32bit2(s[63:32], c, a[63:32], b[63:32], w1);

endmodule
