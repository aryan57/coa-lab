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
// Create Date:    17:09:57 10/09/2021 
// Design Name: 
// Module Name:    bit_serial_adder 
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

//FSM model for bit serial adder circuit
module bit_serial_adder(input clk, input rst, input mode, input[7:0] a, input[7:0] b, output reg carry, output[7:0] ans);
	wire curA, curB;
	wire[7:0] statA, statB;
	reg out; //passes the addition value ro output register
	reg PS, NS;
	parameter s0 = 1'b0, s1 = 1'b1, z = 1'b0;  //s0 -> carryin from previous state = 0, s1 ->  carryin from previous state = 1
	
	input_shift_register inA(clk, mode, z, a, curA, statA);
	input_shift_register inB(clk, mode, z, b, curB, statB);
	
	output_shift_register outAdd(clk, out, ans);
	
	//seq part
	always @(posedge clk or posedge rst) begin
		if(rst)
			PS <= s0;
		else
			PS <= NS;
	end
	
	//next state logic
	always @(PS or curA or curB) begin
		if(PS == s0) begin
        if((curA & curB))
          NS = s1;
        else
          NS = s0;
      end
		if(PS == s1) begin
        if((curA | curB) == 0) 
          NS = s0;
        else 
          NS = s1;
      end
	end
	
	 //output logic
    always @(PS or curA or curB) begin
      if(PS==s0) out = (curA^curB);
      if(PS==s1) out = !(curA^curB);
		assign carry = (PS&(curA^curB))|(curA&curB);
    end
	
	always @(*) begin
		$display("time =  %0t clk = %b PS = %b, curA = %b, curB = %b, NS = %b, out = %b ", $time, clk, PS, curA, curB, NS, out);
	end
endmodule
