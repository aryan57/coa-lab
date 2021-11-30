`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:28:42 11/07/2021
// Design Name:   controller
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Assignment_7/KGP_RISC_19CS10065/test_bench_controller.v
// Project Name:  KGP_RISC_19CS10065
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_controller;

	// Inputs
	reg [31:0] instr;

	// Outputs
	wire mem_read;
	wire mem_write;
	wire reg_write;
	wire mem_to_reg;
	wire [1:0] w_select;
	wire j_select;
	wire [4:0] ALU_C;
	wire comp;
	wire [1:0] flag_select;
	wire jal;
	wire [2:0] jmp_type;
	wire [1:0] b_src;
	wire jmp_reg;
	wire jmp_instr;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.instr(instr), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.w_select(w_select), 
		.j_select(j_select), 
		.ALU_C(ALU_C), 
		.comp(comp), 
		.flag_select(flag_select), 
		.jal(jal), 
		.jmp_type(jmp_type), 
		.b_src(b_src), 
		.jmp_reg(jmp_reg), 
		.jmp_instr(jmp_instr)
	);

	initial begin
		// Initialize Inputs
		instr = 32'd0;

		// Wait 100 ns for global reset to finish
		#100;
		instr = 32'b01000000000000010000000000000000;    //lw
		#100
		instr = 32'b00000000011000110000000000000100;    //xor
		#100
		instr = 32'b00000000010000010000000000000001;    //add
		#100
		instr = 32'b00000000100000100000000000000010;    //comp
		#100
		instr = 32'b11011000011000000000000000111000;    //bz
		#100
		instr = 32'b11010100011000000000000000110000;    //bltz
		#100
		instr = 32'b11000000000000000000000000001000;    //b
		#100
		$finish;
	end
      
endmodule

