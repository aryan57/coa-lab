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
// Create Date:    23:31:20 09/27/2021 
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
module lfsr(clk, reset, select, seed, status);
	input clk, reset, select;
	input[3:0] seed;
	output[3:0] status;
	
	reg[3:0] q; // current state
	wire[3:0] m; // for storing mux outputs
	
	wire feedback;
	assign feedback = q[0]^q[1];

	mux_2_1 m0(seed[0], q[1], select, m[0]);
	mux_2_1 m1(seed[1], q[2], select, m[1]);
	mux_2_1 m2(seed[2], q[3], select, m[2]);
	mux_2_1 m3(seed[3], feedback, select, m[3]);
	
	//shift logic
	// (ouput of muxes will be used as input next time)
	always @(posedge clk)
		begin
			q[0] <= m[0];
			q[1] <= m[1];
			q[2] <= m[2];
			q[3] <= m[3];
		end
      
	assign status = q;

endmodule
