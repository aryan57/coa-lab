`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:59 11/05/2021 
// Design Name: 
// Module Name:    Sign_16_32_extend 
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
module Sign_16_32_extend(input [15:0] in, output reg [31:0] out);

	always @(*) begin
		if(in[15] == 1) begin
			out = {16'b1111111111111111 , in}; 
		end else begin
			out = {16'b0000000000000000 ,in};
		end
	end
	
endmodule
