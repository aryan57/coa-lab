`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 4
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
// 
// 
// Create Date:    07:42:59 09/28/2021 
// Design Name: 
// Module Name:    Shift_Register_32bit 
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
module Shift_Register_32bit(clk, reset, mode, sin, p_in, sout, status);

	input clk, reset, mode, sin;
	input[31:0] p_in;
	output sout;
	output[31:0] status;
	reg[31:0] q;
	wire[2:0] m;
	
	//chaining 4, 8 bit shift registers 
	shift_register s0(clk, reset, mode, sin, p_in[7:0], m[0], status[7:0]);
	shift_register s1(clk, reset, mode, m[0], p_in[15:8], m[1], status[15:8]);
	shift_register s2(clk, reset, mode, m[1], p_in[23:16], m[2], status[23:16]);
	shift_register s3(clk, reset, mode, m[2], p_in[31:24], sout, status[31:24]);     

endmodule
