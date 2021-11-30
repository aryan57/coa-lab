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
// Create Date:    14:47:59 10/09/2021 
// Design Name: 
// Module Name:    output_shift_register 
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

//takes input from one end and stores by shifting
module output_shift_register(clk, sin, status);
	input clk, sin;
	output[7:0] status;
	reg[7:0] q;
	wire[7:0] m;
	
	//shift logic
	always @(posedge clk)
		begin
			q[0] <= q[1];
			q[1] <= q[2];
			q[2] <= q[3];
			q[3] <= q[4];
			q[4] <= q[5];
			q[5] <= q[6];
			q[6] <= q[7];
			q[7] <= sin;
		end        

	assign status = q;
endmodule
