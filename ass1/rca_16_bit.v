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
// Create Date:    17:32:23 08/25/2021 
// Design Name: 
// Module Name:    rca_16_bit 
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
module rca_16_bit(a, b, cin, cout, sum);
    input[15:0] a, b;
    input cin;
    output[15:0] sum;
    output cout;
    wire c;
    rca_8_bit rca1(a[7:0], b[7:0], cin, c, sum[7:0]);
    rca_8_bit rca2(a[15:8], b[15:8], c, cout, sum[15:8]);
endmodule
