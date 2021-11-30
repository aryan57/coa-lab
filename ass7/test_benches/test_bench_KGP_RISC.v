`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:41:31 11/07/2021
// Design Name:   KGP_RISC_Processor
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Assignment_7/KGP_RISC_19CS10065/test_bench_KGP_RISC.v
// Project Name:  KGP_RISC_19CS10065
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGP_RISC_Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_KGP_RISC;

	// Inputs
	reg clka;
	reg f_clka;
	reg reset;

	// Outputs
	wire [4:0] write_addr;
	wire [31:0] ALUres;
	wire [31:0] finalPC;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC_Processor uut (
		.clka(clka), 
		.f_clka(f_clka), 
		.reset(reset), 
		.write_addr(write_addr), 
		.ALUres(ALUres), 
		.finalPC(finalPC)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		f_clka = 0;
		reset = 0;
		#19;
		reset = 1;
		#50;
		reset = 0;
	end
	always #1 f_clka = ~f_clka;
	always #20 clka = ~clka;
   
endmodule

