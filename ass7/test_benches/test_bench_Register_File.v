`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:06:46 11/05/2021
// Design Name:   RegisterFile
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Assignment_7/KGP_RISC_19CS10065/test_bench_Register_File.v
// Project Name:  KGP_RISC_19CS10065
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_Register_File;

	// Inputs
	reg clka;
	reg [4:0] ReadAddr1;
	reg [4:0] ReadAddr2;
	reg [4:0] WriteAddr;
	reg [31:0] WriteData;
	reg reg_write;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	wire [31:0] ans;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.clka(clka), 
		.ReadAddr1(ReadAddr1), 
		.ReadAddr2(ReadAddr2), 
		.WriteAddr(WriteAddr), 
		.WriteData(WriteData), 
		.reg_write(reg_write), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2),
		.ans(ans)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		ReadAddr1 = 4'b0000;
		ReadAddr2 = 4'b0001;
		WriteAddr = 4'b0001;
		WriteData = 32'b10101010101010101010101010101010;
		reg_write = 1'b0;
		#190
		reg_write = 1'b1;
		#400
		$finish;
	end
	always #100 clka = ~clka;
      
endmodule

