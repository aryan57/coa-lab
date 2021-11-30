`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:56 08/27/2021 
// Design Name: 
// Module Name:    Half_Adder 
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
module Half_Adder(s, c, a, b);
	output s, c;
	input a, b;
	
	xor gate1(s, a, b);
	and gate2(c, a, b);

endmodule
