`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:59 08/27/2021 
// Design Name: 
// Module Name:    RCA_16Bit_Adder 
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
module RCA_16Bit_Adder(s, c, a, b, c0);
	output [15:0] s;
	output c;
	input [15:0] a, b;
	input c0;
	
	wire w1;
	
	RCA_8Bit_Adder rca8bit1(s[7:0], w1, a[7:0], b[7:0], c0);
	RCA_8Bit_Adder rca8bit2(s[15:8], c, a[15:8], b[15:8], w1);


endmodule
