`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:59 08/27/2021 
// Design Name: 
// Module Name:    RCA_32Bit_Adder 
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
module RCA_32Bit_Adder(s, c, a, b, c0);
	output [31:0] s;
	output c;
	input [31:0] a, b;
	input c0;
	
	wire w1;
	RCA_16Bit_Adder rca16bit1(s[15:0], w1, a[15:0], b[15:0], c0);
	RCA_16Bit_Adder rca16bit2(s[31:16], c, a[31:16], b[31:16], w1);


endmodule
