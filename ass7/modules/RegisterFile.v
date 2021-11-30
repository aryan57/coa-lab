`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:45 11/05/2021 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(input clka,
                    input [4:0] ReadAddr1, 
                    input [4:0] ReadAddr2, 
						  input [4:0] WriteAddr, 
						  input [31:0] WriteData,  
						  input reg_write, 
						  output reg [31:0] ReadData1, 
						  output reg [31:0] ReadData2,
						  output reg [31:0] ans
						  );
						  
				
	reg [31:0]registers [31:0];
	
	
	
	always @(negedge clka)begin
		registers[0] <= 32'd0;
		if(reg_write) begin
			registers[WriteAddr] <= WriteData;
		end
		/*
		#2
		$display("write info | time =  %0t clka = %b, reg %d =%d    regwrite = %b ", $time, clka, WriteAddr, $signed(registers[WriteAddr]), $signed(reg_write));
		*/
		/*
		registers[0] <= 32'd0;
		ReadData1 <= registers[ReadAddr1];
		ReadData2 <= registers[ReadAddr2];
		*/
	end
	
	always @(posedge clka)begin
		#10
		ReadData1 <= registers[ReadAddr1];
		ReadData2 <= registers[ReadAddr2];
		ans <= registers[5'b00001];
		#2
		$display("read info | time =  %0t clka = %b, reg %d =%d   |reg %d =%d", $time, clka, ReadAddr1, $signed(ReadData1), ReadAddr2, $signed(ReadData2));
		
	end
	
	
endmodule
