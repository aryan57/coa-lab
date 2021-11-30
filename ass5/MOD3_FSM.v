`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 5
// Problem no - 3
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
//
// Create Date:    23:31:20 09/27/2021 
// Design Name: 
// Module Name:    MOD3_FSM 
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
module MOD3_FSM(in, rst, clk, out);
  input in, rst, clk;
  output reg out;
  reg [1:0] PS, NS; //previous and next state
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10; //s0 -> remainder = 0, s1 -> remainder = 1 and  s2 -> remainder = 2
  
  //seq part
  always @(posedge clk or posedge rst) begin
      if(rst)
        PS <= s0;
      else
        PS <= NS;
  end

  //next state logic
  always @(PS or in) begin
      if(PS == s0) begin
        if(in == 0)
          NS = s0;
        else
          NS = s1;
      end
      if(PS==s1) begin
        if(in==0) 
          NS = s2;
        else 
          NS = s0;
      end
      if(PS==s2) begin
        if(in==0) 
          NS = s1;
        else 
          NS = s2;
      end
    end
      
	 //output logic	0 -> not div by 3 and 1 -> div by 3
    always @(PS or in) begin
      if(PS==s0) out = 1;
      if(PS==s1) out = 0;
      if(PS==s2) out = 0;
    end
	 always @(*) begin
		$display("time =  %0t clk = %b PS = %b, in = %b NS = %b ", $time, clk, PS, in, NS);
	 end
endmodule