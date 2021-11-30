`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:48 11/05/2021 
// Design Name: 
// Module Name:    MUX_2_1 
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
module MUX_2_1(online, offline, select, out);
	input [31:0] offline, online;
	input select;
	output [31:0] out;
	assign out = (select)?online:offline;
endmodule
