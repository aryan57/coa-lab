`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 1
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
//
// Create Date:    23:17:33 09/27/2021 
// Design Name: 
// Module Name:    DFF
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
module DFF(clk, reset, in, out);
	input clk, reset, in;
	output reg out;
	
	always @(posedge clk or posedge reset) begin
		if(reset) out <= 0;
		else out <= in;
	end
endmodule
