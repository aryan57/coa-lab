`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:29 11/06/2021 
// Design Name: 
// Module Name:    Datapaths 
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
module Datapaths(input [25:0] j_path1, 
					  input [20:0] j_path2,
					  input [31:0] j_path3,
					  input [31:0] read_data1,
					  input [2:0] flags,
					  input [2:0] jmp_type,
					  input [1:0] flag_select,
					  input j_select,
					  input jmp_reg,
					  input jmp_instr,
					  input [1:0] w_select,
					  input [4:0] Read_addr1,
					  input [4:0] Read_addr2,
					  input [31:0] mem_read_data,
					  input [31:0] ALU_res,
					  input mem_to_reg,
					  input jal,
					  output [31:0] finalPC,
					  output [4:0] write_addr,
					  output [31:0] reg_write_data
					  );
	wire [31:0] j_path1_out, j_path2_out, j_out_1, j_out_2, j_out_3, mem_line;
	wire valid_jmp;
	reg flag_out;
	
	always@(*) begin
		if(flag_select == 2'b00) begin
			flag_out = flags[0];
		end
		if(flag_select == 2'b01) begin
			flag_out = flags[1];
		end
		if(flag_select == 2'b10) begin
			flag_out = flags[2];
		end
	end
	
	//Datapaths for branching part
	Branch_Logic blogic(jmp_type, flag_out, valid_jmp);
	
	Sign_26_32_extend extender_1(.in(j_path1), .out(j_path1_out));
	Sign_21_32_extend extender_2(.in(j_path2), .out(j_path2_out));
	
	MUX_2_1 mux1(j_path2_out, j_path1_out, j_select, j_out_1);
	MUX_2_1 mux2(read_data1, j_out_1, jmp_reg, j_out_2);
	MUX_2_1 mux3(j_out_2, j_path3, valid_jmp, j_out_3);
	MUX_2_1 mux4(j_out_3, j_path3, jmp_instr, finalPC);
	
	/*always@(*)begin
		if(valid_jmp==1) begin
			$display("branch info | time =  %0t clka = %b, immediate = %b", $time, clka, j_out_1);
		end
	end*/
	
	//W_select
	MUX4Bit_4_1_ mux5(5'b00000, 5'b11111, Read_addr2, Read_addr1, w_select, write_addr);
	
	//memory to register
	MUX_2_1 mux6(mem_read_data, ALU_res, mem_to_reg, mem_line);
	MUX_2_1 mux7(j_path3, mem_line, jal, reg_write_data);
	
	
	
endmodule
