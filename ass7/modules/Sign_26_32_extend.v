`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:39 11/05/2021 
// Design Name: 
// Module Name:    Sign_26_32_extend 
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
module Sign_26_32_extend(input [25:0] in, output reg [31:0] out);

	always @(*) begin
		if(in[20] == 1) begin
			out = {6'b111111, in}; 
		end else begin
			out = {6'b000000, in};
		end
	end
	
endmodule
