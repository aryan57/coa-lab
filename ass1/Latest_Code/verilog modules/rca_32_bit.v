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
// Create Date:    17:45:45 08/25/2021 
// Design Name: 
// Module Name:    rca_32_bit 
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
module rca_32_bit(a, b, cin, cout, sum);
    input[31:0] a, b;
    input cin;
    output[31:0] sum;
    output cout;
    wire c;
    rca_16_bit rca1(a[15:0], b[15:0], cin, c, sum[15:0]);
    rca_16_bit rca2(a[31:16], b[31:16], c, cout, sum[31:16]);
endmodule
