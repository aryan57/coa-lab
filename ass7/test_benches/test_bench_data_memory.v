`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:38:27 11/05/2021
// Design Name:   DataMemory
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Assignment_7/KGP_RISC_19CS10065/test_bench_data_memory.v
// Project Name:  KGP_RISC_19CS10065
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_data_memory;

	// Inputs
	reg clka;
	reg ena;
	reg [3:0] wea;
	reg [31:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clka(clka), 
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		ena = 1'b1;
		wea = 4'b0000;
		addra = 32'b00000000000000000000000000000000;
		dina = 0;
		#9
		wea = 4'b1111;
		addra = 32'b00000000000000000000000000000000;
		dina = 32'd54;
		#20
		wea = 4'b0000;
		#20
		$finish;
	end
	always #10 clka = ~clka;
      
endmodule

