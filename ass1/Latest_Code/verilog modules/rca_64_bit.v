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
// Create Date:    17:46:45 08/25/2021 
// Design Name: 
// Module Name:    rca_64_bit 
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
module rca_64_bit(a, b, cin, cout, sum);
    input[63:0] a, b;
    input cin;
    output[63:0] sum;
    output cout;
    wire c;
    rca_32_bit rca1(a[31:0], b[31:0], cin, c, sum[31:0]);
    rca_32_bit rca2(a[63:32], b[63:32], c, cout, sum[63:32]);
endmodule
