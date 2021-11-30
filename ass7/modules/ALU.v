`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:36 11/03/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(input clka, input [31:0] A, input [31:0] B, input [4:0] ALU_C, output reg [31:0] res, output reg [2:0] flags);
	reg cout;
	reg [31:0] temp;
	reg signed [31:0] temp2;
	reg [31:0] B_temp;
	always @(*) begin
		B_temp = B;
		if(ALU_C[4] == 1'b1)begin
			B_temp = ~B;
		end
		
		if(ALU_C[1:0] == 2'b00) begin                                //ADD
			{cout, res} = A+B_temp;
			temp = 32'b00000000000000000000000000000000;
			temp[0] = ALU_C[2];
			res = res + temp;
			if(res == 32'b00000000000000000000000000000000) begin
				flags[0]=1;
			end else begin
				flags[0]=0;
			end
				
			if(res[31] == 1'b1) begin
				flags[1]=1;
			end else begin
				flags[1]=0;
			end
		end
		
		if(ALU_C[1:0] == 2'b01) begin                                //AND
			res = A&B;
		end
		
		if(ALU_C[1:0] == 2'b10) begin                                //XOR
			res = A^B;
		end

		if(ALU_C[1:0] == 2'b11) begin                                //SHIFT
			if(ALU_C[3] == 1'b1)begin
				if(ALU_C[2] == 1'b1)begin
					temp2 = A;
					res = temp2>>>B;
					/*
					res = (~A);
					res = res+1;
					res = res>>B;
					res = res+1;
					*/
				end else begin
					res = A>>B;
				end
			end else begin
				res = A<<B;
			end
		end
	end
	/*
	 always @(*) begin
		$display("ALU | time =  %0t clka = %b A =%d    B =%d    B_temp =%d    res =%d ", $time, clka, $signed(A), $signed(B), $signed(B_temp), $signed(res));
	 end
	 */
	
	always @(posedge clka)begin
		flags[2] = cout;
	end
endmodule
