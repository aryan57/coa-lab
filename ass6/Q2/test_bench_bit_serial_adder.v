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
// Create Date:   17:39:23 10/09/2021
// Design Name:   bit_serial_adder
// Module Name:   D:/Downloads/Assignment_6/test_bench_bit_serial_adder.v
// Project Name:  Assignment_6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit_serial_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_bit_serial_adder;

	// Inputs
	reg clk;
	reg rst;
	reg mode;
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] ans;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	bit_serial_adder uut (
		.clk(clk), 
		.rst(rst), 
		.mode(mode), 
		.a(a), 
		.b(b), 
		.carry(carry),
		.ans(ans)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		mode = 0;
		a = 8'b00110011;
		b = 8'b10010010;
		
		#5
		rst = 1;
		mode = 1;
		#1
		rst = 0;
		#63
		$finish;
        
		// Add stimulus here

	end
	always #4 clk = ~clk;
	
endmodule

