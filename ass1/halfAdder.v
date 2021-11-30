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
// Create Date:    17:19:56 08/25/2021 
// Design Name: 
// Module Name:    halfAdder 
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
module halfAdder (a, b, cout, sum);
    input  a, b;
    output cout, sum;
    assign cout = a&b;
    assign sum = a^b;
endmodule
