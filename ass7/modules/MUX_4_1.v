`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:03 11/05/2021 
// Design Name: 
// Module Name:    MUX_4_1 
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
module MUX_4_1(input [31:0] choice_11, 
					input [31:0] choice_10, 
					input [31:0] choice_01, 
					input [31:0] choice_00, 
					input [1:0] select,
					output reg [31:0] out
					);
	always@(*) begin
		if(select == 2'b00) begin
			out = choice_00;
		end

		if(select == 2'b01) begin
			out = choice_01;
		end
		
		if(select == 2'b10) begin
			out = choice_10;
		end

		if(select == 2'b11) begin
			out = choice_11;
		end
	end
	
endmodule
