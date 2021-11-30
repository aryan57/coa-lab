`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 6
// Problem no - 3
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
// 
// Create Date:    22:22:08 10/09/2021 
// Design Name: 
// Module Name:    booth 
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
module booth(
	input rst,
	input clk,
	input  [7:0] M_in,
	input  [7:0] Q_in,
	input  [7:0] A_in
);

reg PS,NS;
reg [7:0] M;
reg [7:0] Q;
reg [7:0] A;
	
	
parameter s0=1'b0, s1=1'b1;

reg [1:0] temp;

always@(posedge clk or posedge rst)
begin
	if(rst)
	begin
		A = A_in;
		M = M_in;
		Q = Q_in;
		PS = s0;
		NS = s0;
	end
	else
	begin
	
		PS=NS;
		temp={Q[0],PS};
		
		case (temp)
		
			2'b01: begin
			A = A + M;
			end
			
			2'b10: begin
			A = A - M ;
			end
			
		endcase
		
		// now do arithmetic right shift of {A,Q_in,Q-1}
		NS = Q[0];
		
		Q[0] = Q[1];
		Q[1] = Q[2];
		Q[2] = Q[3];
		Q[3] = Q[4];
		Q[4] = Q[5];
		Q[5] = Q[6];
		Q[6] = Q[7];
		Q[7] = A[0];
		
		A[0] = A[1];
		A[1] = A[2];
		A[2] = A[3];
		A[3] = A[4];
		A[4] = A[5];
		A[5] = A[6];
		A[6] = A[7];
		
	end
end

always @(*) begin
		$display("time =  %0t, clk = %b, PS = %b,NS = %b, A = %b,Q = %b", $time, clk, PS, NS, A, Q);
	 end

endmodule
