`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 1
// Problem no - 1
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
// 
// Create Date:    17:31:12 08/25/2021 
// Design Name: 
// Module Name:    rca_8_bit 
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
module rca_8_bit(a, b, cin, cout, sum);
    input[7:0] a, b;
    input cin;
    output[7:0] sum;
    output cout;
    wire[6:0] c;
    fullAdder f1(a[0], b[0], cin, c[0], sum[0]);
    fullAdder f2(a[1], b[1], c[0], c[1], sum[1]);
    fullAdder f3(a[2], b[2], c[1], c[2], sum[2]);
    fullAdder f4(a[3], b[3], c[2], c[3], sum[3]);
    fullAdder f5(a[4], b[4], c[3], c[4], sum[4]);
    fullAdder f6(a[5], b[5], c[4], c[5], sum[5]);
    fullAdder f7(a[6], b[6], c[5], c[6], sum[6]);
    fullAdder f8(a[7], b[7], c[6], cout, sum[7]);
endmodule
