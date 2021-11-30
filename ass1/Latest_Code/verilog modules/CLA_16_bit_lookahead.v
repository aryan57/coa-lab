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
// Create Date:    23:48:27 08/26/2021 
// Design Name: 
// Module Name:    CLA_16_bit_lookahead 
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
module CLA_16_bit_lookahead(a, b, cin, cout, sum);
    input[15:0] a, b;
    input cin;
    output[15:0] sum;
    output cout;
    wire[3:0] c;
	 wire[3:0] p, g;
	 wire blockp, blockg;
    CLA_4_bit_block cla1(a[3:0], b[3:0], cin, p[0], g[0], sum[3:0]);
	 CLA_4_bit_block cla2(a[7:4], b[7:4], c[1], p[1], g[1], sum[7:4]);
	 CLA_4_bit_block cla3(a[11:8], b[11:8], c[2], p[2], g[2], sum[11:8]);
	 CLA_4_bit_block cla4(a[15:12], b[15:12], c[3], p[3], g[3], sum[15:12]);
	 lookahead_carry_unit lcu(p, g, cin, c, cout, blockp, blockg);
endmodule
