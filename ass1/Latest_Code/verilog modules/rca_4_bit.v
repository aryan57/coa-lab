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
// Create Date:    23:22:36 08/26/2021 
// Design Name: 
// Module Name:    rca_4_bit 
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
module rca_4_bit(a, b, cin, cout, sum);
    input[3:0] a, b;
    input cin;
    output[3:0] sum;
    output cout;
    wire[2:0] c;
    fullAdder f1(a[0], b[0], cin, c[0], sum[0]);
    fullAdder f2(a[1], b[1], c[0], c[1], sum[1]);
    fullAdder f3(a[2], b[2], c[1], c[2], sum[2]);
    fullAdder f4(a[3], b[3], c[2], cout, sum[3]);
endmodule

