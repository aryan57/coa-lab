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
// Create Date:    17:29:17 08/25/2021 
// Design Name: 
// Module Name:    fullAdder 
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
module fullAdder (a, b, cin, cout, sum);
    input  a, b, cin;
    output cout, sum;
    wire c1, c2, s;
    halfAdder ha1(a, b, c1, s);
    halfAdder ha2(s, cin, c2, sum);
    or g1(cout, c1, c2);
endmodule
