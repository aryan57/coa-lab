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
// Create Date:    07:23:24 09/28/2021 
// Design Name: 
// Module Name:    Comparator_32_bit 
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
module Comparator_32_bit(clk, mode, op, rst, a, b, L, E, G);
  input op, rst, clk, mode;
  input [31:0] a, b;
  output reg L, E, G;
  reg [1:0] PS, NS;
  reg sin = 0;
  reg reset = 0;
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10; //s0 implies equal, s1 -> a<b and s2 -> a>b
  wire aout, bout;
  wire [31:0] statusa, statusb;
  
  //Shift_Registers that output MSB and left shift
  Shift_Register_32bit A(clk, reset, mode, sin, a, aout, statusa);
  Shift_Register_32bit B(clk, reset, mode, sin, b, bout, statusb);
  
  //next state logic
  always @(PS or aout or bout) begin
		if(PS==s0) begin
			if(aout==1 & bout==0) NS = s2;
			if(aout==0 & bout==1) NS = s1;
			if(aout == bout) NS = PS;
		end
		else NS = PS;
  end
	
  //seq part
  always @(posedge clk or posedge rst) begin
      if(rst)
			PS <= s0;
      else 
			PS <= NS;
  end
  
  //output logic when op=1 that is process ends
  always @(op) begin
		if(op==1) begin
			if(PS==s0) begin
				L = 0;
				E = 1;
				G = 0;
			end
			if(PS==s1) begin
				L = 1;
				E = 0;
				G = 0;
			end
			if(PS==s2) begin
				L = 0;
				E = 0;
				G = 1;
			end
		end
		else begin
			L = 0;
			E = 0;
			G = 0;
		end
		$display("time =  %0t clk = %b L = %b E = %b G = %b op = %b", $time, clk, L, E, G, op);
  end
	 always @(*) begin
		$display("time =  %0t clk = %b PS = %b, aout = %b bout = %b NS = %b stata = %b statb = %b op = %b", $time, clk, PS, aout, bout, NS, statusa, statusb, op);
	 end
endmodule
