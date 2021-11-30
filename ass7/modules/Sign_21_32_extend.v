`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:25 11/05/2021 
// Design Name: 
// Module Name:    Sign_21_32_extend 
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
module Sign_21_32_extend(input [20:0] in, output reg [31:0] out);

	always @(*) begin
		if(in[20] == 1) begin
			out = {11'b11111111111 , in}; 
		end else begin
			out = {11'b00000000000 ,in};
		end
	end
	
endmodule
