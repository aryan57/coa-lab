`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 4
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
//
// Create Date:    23:16:44 09/27/2021 
// Design Name: 
// Module Name:    shift_register 
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
module shift_register(clk, reset, mode, sin, p_in, sout, status);
	input clk, reset, mode, sin;
	input[3:0] p_in;
	output sout;
	output[3:0] status;
	reg[3:0] q;
	wire[3:0] m;
	
	reg feedback;
	assign feedback = q[0]^q[1];

	mux_2_1 m0(p_in[0], q[1], mode, m[0]);
	mux_2_1 m1(p_in[1], q[2], mode, m[1]);
	mux_2_1 m2(p_in[2], q[3], mode, m[2]);
	mux_2_1 m3(p_in[3], feedback, mode, m[3]);
	
	//shift logic
	always @(posedge clk)
		begin
			q[0] <= m[0];
			q[1] <= m[1];
			q[2] <= m[2];
			q[3] <= m[3];
		end        
   
	//serial output = MSB
	assign sout = q[0];
	assign status = q;
endmodule
