`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:    23:31:20 09/27/2021 
// Design Name: 
// Module Name:    two_comp_fsm 
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
module two_comp_fsm(in,rst,clk,out);
	input in,rst,clk;
	output reg out;
	
	reg PS,NS; // present state, next state
	parameter s0 = 1'b0, s1 = 1'b1; // state0, state1
	
	// seq part
	always @( posedge clk or posedge rst ) begin
		if(rst)
			begin
				PS <= s0;
				NS <= s0;
			end
		else
			PS <= NS;
	end
	
	// next state calculation
	always @(PS or in)
		begin
			if( PS == s0)
				begin
					if(in == 1'b0)
						NS = s0;
					else // change to s1 if input is 1 and present state is state0
						NS = s1;
				end
			else
				NS = s1;	// remain in s1 if PS is s1
		end
		
	// output calculation
	always @(PS or in)
		begin
			if( PS == s0)
				out = in; // output same as input,
			else
				out = ~in; // output inverse of input,
		end
	
	// printing variables
	always @(*) begin
		$display("time =  %0t, clk = %b, rst = %b, in = %b, PS = %b,  NS = %b, out = %b", $time, clk, rst, in, PS, NS, out);
	 end

endmodule
