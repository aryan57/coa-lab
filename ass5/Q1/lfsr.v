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
// Module Name:    lfsr
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
module lfsr(clk, reset, mode, p_in, status);
	input clk, reset, mode;
	input[3:0] p_in;
	output[3:0] status;
	wire[3:0] q;
	wire[3:0] m;
	
	wire feedback;
	assign feedback = q[0]^q[1];

	mux_2_1 m0(p_in[0], q[1], mode, m[0]);
	mux_2_1 m1(p_in[1], q[2], mode, m[1]);
	mux_2_1 m2(p_in[2], q[3], mode, m[2]);
	mux_2_1 m3(p_in[3], feedback, mode, m[3]);
		
	DFF d0(clk, reset, m[0], q[0]);
	DFF d1(clk, reset, m[1], q[1]);
	DFF d2(clk, reset, m[2], q[2]);
	DFF d3(clk, reset, m[3], q[3]);
	assign status = q;
	 always @(*) begin
		$display("time =  %0t, clk = %b, m = %b, q = %b ", $time, clk, m, q);
	 end
endmodule