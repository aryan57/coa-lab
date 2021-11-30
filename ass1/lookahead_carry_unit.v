`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 1
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
// 
// Create Date:    23:42:52 08/26/2021 
// Design Name: 
// Module Name:    lookahead_carry_unit 
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
module lookahead_carry_unit(p, g, cin, c, cout, blockp, blockg);
	input[3:0] p, g;
	input cin;
	output blockp, blockg, cout;
	output[3:0] c;
	assign c[0]=cin;
	assign c[1]=g[0]|p[0]&cin;
	assign c[2]=g[1]|p[1]&g[0]|p[1]&p[0]&cin;
	assign c[3]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&cin;
	assign cout=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&cin;
	assign blockp=p[3]&p[2]&p[1]&p[0];
	assign blockg=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0];
endmodule
