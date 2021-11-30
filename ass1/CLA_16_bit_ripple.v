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
// Create Date:    23:25:33 08/26/2021 
// Design Name: 
// Module Name:    CLA_16_bit_ripple 
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
module CLA_16_bit_ripple(a, b, cin, cout, sum);
    input[15:0] a, b;
    input cin;
    output[15:0] sum;
    output cout;
    wire[2:0] c;
    CLA_4_bit cla1(a[3:0], b[3:0], cin, c[0], sum[3:0]);
	 CLA_4_bit cla2(a[7:4], b[7:4], c[0], c[1], sum[7:4]);
	 CLA_4_bit cla3(a[11:8], b[11:8], c[1], c[2], sum[11:8]);
	 CLA_4_bit cla4(a[15:12], b[15:12], c[2], cout, sum[15:12]);
endmodule
