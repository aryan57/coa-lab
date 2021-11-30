`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:09 11/03/2021 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(clka, ena, addra, douta);

input clka;
input ena;
input [31 : 0] addra;
output [31 : 0] douta;

I_ROM icache(.clka(clka), .ena(ena), .addra(addra), .douta(douta));

endmodule
