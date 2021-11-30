`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:33 11/05/2021 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(clka, ena, wea, addra, dina, douta);
	input clka;
	input ena;
	input [3 : 0] wea;
	input [31 : 0] addra;
	input [31 : 0] dina;
	output [31 : 0] douta;
	
	dcache d_cache(.clka(clka), .ena(ena), .wea(wea), .addra(addra), .dina(dina), .douta(douta));
endmodule
