`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 6
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
// 
// Create Date:    14:39:27 10/09/2021 
// Design Name: 
// Module Name:    input_shift_register 
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

//allows parallel loading and serial out
module input_shift_register(clk, mode, sin, p_in, sout, status);
	input clk, mode, sin;
	input[7:0] p_in;
	output sout;
	output[7:0] status;
	reg[7:0] q;
	wire[7:0] m;

	mux_2_1 m0(p_in[0], q[1], mode, m[0]);
	mux_2_1 m1(p_in[1], q[2], mode, m[1]);
	mux_2_1 m2(p_in[2], q[3], mode, m[2]);
	mux_2_1 m3(p_in[3], q[4], mode, m[3]);
	mux_2_1 m4(p_in[4], q[5], mode, m[4]);
	mux_2_1 m5(p_in[5], q[6], mode, m[5]);
	mux_2_1 m6(p_in[6], q[7], mode, m[6]);
	mux_2_1 m7(p_in[7], sin, mode, m[7]);
	
	//shift logic
	always @(posedge clk)
		begin
			q[0] <= m[0];
			q[1] <= m[1];
			q[2] <= m[2];
			q[3] <= m[3];
			q[4] <= m[4];
			q[5] <= m[5];
			q[6] <= m[6];
			q[7] <= m[7];
		end        
   
	//serial output = LSB
	assign sout = q[0];
	assign status = q;
endmodule
