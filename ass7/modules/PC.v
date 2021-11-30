`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:19 11/06/2021 
// Design Name: 
// Module Name:    PC 
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
module PC(input clka, input reset, input [31:0] in, output reg [31:0] out);

	always@(posedge clka) begin
		if(reset) begin
			out <= 32'b000000000000000000000000000000000; 	//first line of code
		end else begin
			out <= in; 
		end
		
	end

endmodule
