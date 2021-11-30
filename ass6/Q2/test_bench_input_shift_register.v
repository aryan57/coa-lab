`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 6
// Problem no - 2
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:   16:12:48 10/09/2021
// Design Name:   input_shift_register
// Module Name:   D:/Downloads/Assignment_6/test_bench_input_shift_register.v
// Project Name:  Assignment_6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: input_shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_input_shift_register;

	// Inputs
	reg clk;
	reg mode;
	reg sin;
	reg [7:0] p_in;

	// Outputs
	wire sout;
	wire [7:0] status;

	// Instantiate the Unit Under Test (UUT)
	input_shift_register uut (
		.clk(clk), 
		.mode(mode), 
		.sin(sin), 
		.p_in(p_in), 
		.sout(sout), 
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 0;
		sin = 0;
		p_in = 8'b10010010;
		#5 mode = 1;
		#64
		$finish;
	end
	always #4 clk = ~clk;
      
endmodule

