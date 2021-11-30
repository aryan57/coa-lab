`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:32 08/27/2021 
// Design Name: 
// Module Name:    Full_Adder 
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
module Full_Adder(s, c, a, b, c0);
	output s, c;
	input a, b, c0;
	wire w1, w2, w3;
	
	and gate1(w1, a, b); // w1 = a&b
	xor gate2(w2, a, b);	// w2 = a^b
	and gate3(w3, w2, c0);	// w3 = (a^b)&c0
	xor gate4(s, w2, c0);	// s = (a^b)^c0
	or gate5(c, w3, w1);		// c = (a^b)&c0 + a&b

endmodule
