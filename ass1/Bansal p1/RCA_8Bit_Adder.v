`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:58 08/27/2021 
// Design Name: 
// Module Name:    RCA_8Bit_Adder 
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
module RCA_8Bit_Adder(s, c, a, b, c0);
	output [7:0] s;
	output c;
	input [7:0] a, b;
	input c0;
	
	wire w1, w2, w3, w4, w5, w6, w7;
	Full_Adder fa1(s[0], w1, a[0], b[0], c0);
	Full_Adder fa2(s[1], w2, a[1], b[1], w1);
	Full_Adder fa3(s[2], w3, a[2], b[2], w2);
	Full_Adder fa4(s[3], w4, a[3], b[3], w3);
	Full_Adder fa5(s[4], w5, a[4], b[4], w4);
	Full_Adder fa6(s[5], w6, a[5], b[5], w5);
	Full_Adder fa7(s[6], w7, a[6], b[6], w6);
	Full_Adder fa8(s[7], c, a[7], b[7], w7);


endmodule
