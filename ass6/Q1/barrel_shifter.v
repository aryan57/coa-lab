`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment no - 6
// Problem no - 1
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer: 
// 
// Create Date:    12:58:43 10/09/2021 
// Design Name: 
// Module Name:    barrel_shifter 
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
module barrel_shifter(input [7:0] in, input [2:0] shamt, input dir, output [7:0] out);
	wire[7:0] lay_1_2, lay_2_3, lay_3_4, lay_4_5;  //lay_i_j connects layer i to j
	parameter z = 1'b0;
	
	//reversal layer
	mux_2_1 layer_1_0(in[0], in[7], dir, lay_1_2[0]);
	mux_2_1 layer_1_1(in[1], in[6], dir, lay_1_2[1]);
	mux_2_1 layer_1_2(in[2], in[5], dir, lay_1_2[2]);
	mux_2_1 layer_1_3(in[3], in[4], dir, lay_1_2[3]);
	mux_2_1 layer_1_4(in[4], in[3], dir, lay_1_2[4]);
	mux_2_1 layer_1_5(in[5], in[2], dir, lay_1_2[5]);
	mux_2_1 layer_1_6(in[6], in[1], dir, lay_1_2[6]);
	mux_2_1 layer_1_7(in[7], in[0], dir, lay_1_2[7]);
	
	//layer for 4 shift
	mux_2_1 layer_2_0(lay_1_2[0], lay_1_2[4], shamt[2], lay_2_3[0]);
	mux_2_1 layer_2_1(lay_1_2[1], lay_1_2[5], shamt[2], lay_2_3[1]);
	mux_2_1 layer_2_2(lay_1_2[2], lay_1_2[6], shamt[2], lay_2_3[2]);
	mux_2_1 layer_2_3(lay_1_2[3], lay_1_2[7], shamt[2], lay_2_3[3]);
	mux_2_1 layer_2_4(lay_1_2[4], z, shamt[2], lay_2_3[4]);
	mux_2_1 layer_2_5(lay_1_2[5], z, shamt[2], lay_2_3[5]);
	mux_2_1 layer_2_6(lay_1_2[6], z, shamt[2], lay_2_3[6]);
	mux_2_1 layer_2_7(lay_1_2[7], z, shamt[2], lay_2_3[7]);
	
	//layer for 2 shift
	mux_2_1 layer_3_0(lay_2_3[0], lay_2_3[2], shamt[1], lay_3_4[0]);
	mux_2_1 layer_3_1(lay_2_3[1], lay_2_3[3], shamt[1], lay_3_4[1]);
	mux_2_1 layer_3_2(lay_2_3[2], lay_2_3[4], shamt[1], lay_3_4[2]);
	mux_2_1 layer_3_3(lay_2_3[3], lay_2_3[5], shamt[1], lay_3_4[3]);
	mux_2_1 layer_3_4(lay_2_3[4], lay_2_3[6], shamt[1], lay_3_4[4]);
	mux_2_1 layer_3_5(lay_2_3[5], lay_2_3[7], shamt[1], lay_3_4[5]);
	mux_2_1 layer_3_6(lay_2_3[6], z, shamt[1], lay_3_4[6]);
	mux_2_1 layer_3_7(lay_2_3[7], z, shamt[1], lay_3_4[7]);
	
	//layer for 1 shift
	mux_2_1 layer_4_0(lay_3_4[0], lay_3_4[1], shamt[0], lay_4_5[0]);
	mux_2_1 layer_4_1(lay_3_4[1], lay_3_4[2], shamt[0], lay_4_5[1]);
	mux_2_1 layer_4_2(lay_3_4[2], lay_3_4[3], shamt[0], lay_4_5[2]);
	mux_2_1 layer_4_3(lay_3_4[3], lay_3_4[4], shamt[0], lay_4_5[3]);
	mux_2_1 layer_4_4(lay_3_4[4], lay_3_4[5], shamt[0], lay_4_5[4]);
	mux_2_1 layer_4_5(lay_3_4[5], lay_3_4[6], shamt[0], lay_4_5[5]);
	mux_2_1 layer_4_6(lay_3_4[6], lay_3_4[7], shamt[0], lay_4_5[6]);
	mux_2_1 layer_4_7(lay_3_4[7], z, shamt[0], lay_4_5[7]);
	
	//layer for reversal
	mux_2_1 layer_5_0(lay_4_5[0], lay_4_5[7], dir, out[0]);
	mux_2_1 layer_5_1(lay_4_5[1], lay_4_5[6], dir, out[1]);
	mux_2_1 layer_5_2(lay_4_5[2], lay_4_5[5], dir, out[2]);
	mux_2_1 layer_5_3(lay_4_5[3], lay_4_5[4], dir, out[3]);
	mux_2_1 layer_5_4(lay_4_5[4], lay_4_5[3], dir, out[4]);
	mux_2_1 layer_5_5(lay_4_5[5], lay_4_5[2], dir, out[5]);
	mux_2_1 layer_5_6(lay_4_5[6], lay_4_5[1], dir, out[6]);
	mux_2_1 layer_5_7(lay_4_5[7], lay_4_5[0], dir, out[7]);

endmodule
