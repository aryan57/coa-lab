`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:58:25 11/05/2021
// Design Name:   ALU
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Assignment_7/KGP_RISC_19CS10065/test_bench_ALU.v
// Project Name:  KGP_RISC_19CS10065
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_ALU;

	// Inputs
	reg clka;
	reg [31:0] A;
	reg [31:0] B;
	reg [4:0] ALU_C;

	// Outputs
	wire [31:0] res;
	wire [2:0] flags;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.clka(clka), 
		.A(A), 
		.B(B), 
		.ALU_C(ALU_C), 
		.res(res), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		A = 32'b11101010101001010010101010100101;     //ADD
		B = 32'b11101010101001010010101010100101;
		ALU_C = 5'b00000;
		#20;
		A = 32'b00000000000000000000000000000000;     //COMP of B
		B = 32'b00000000000000000000000000000001;
		ALU_C = 5'b10100;
		#20;
		A = 32'b11101010111011010010101010100101;     //AND
		B = 32'b11101010101001010010101010100101;
		ALU_C = 5'b00001;
		#20
		A = 32'b11101010111011010010101010100101;     //XOR
		B = 32'b11101010101001010010101010100101;
		ALU_C = 5'b00010;
		#20
		A = 32'b11101010101001010010101010100101;    //Shift left
		B = 32'b00000000000000000000000000000010;
		ALU_C = 5'b00011;
		#20
		A = 32'b11101010101001010010101010100101;    //Shift right arithmetic
		B = 32'b00000000000000000000000000000010;
		ALU_C = 5'b01111;
		#20
		$finish;
	end
	always #10 clka = ~clka;
      
endmodule

