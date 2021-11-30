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
// Create Date:    20:32:28 08/25/2021 
// Design Name: 
// Module Name:    CLA_4_bit 
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
module CLA_4_bit(a, b, cin, cout, sum);
	input[3:0] a, b;
	input cin;
	output[3:0] sum;
	output cout;
	wire[3:0] p, g, c;
	assign p[0]=a[0]^b[0];
	assign p[1]=a[1]^b[1];
	assign p[2]=a[2]^b[2];
	assign p[3]=a[3]^b[3];
	assign g[0]=a[0]&b[0];
	assign g[1]=a[1]&b[1];
	assign g[2]=a[2]&b[2];
	assign g[3]=a[3]&b[3];
	assign c[0]=cin;
	assign c[1]=g[0]|p[0]&cin;
	assign c[2]=g[1]|p[1]&g[0]|p[1]&p[0]&cin;
	assign c[3]=g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&cin;
	assign cout=g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&cin;
	assign sum[0]=p[0]^cin;
	assign sum[1]=p[1]^c[1];
	assign sum[2]=p[2]^c[2];
	assign sum[3]=p[3]^c[3];
endmodule
