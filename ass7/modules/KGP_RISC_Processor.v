`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:37 11/06/2021 
// Design Name: 
// Module Name:    KGP_RISC_Processor 
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
module KGP_RISC_Processor(input clka,
								  input f_clka, 
								  input reset, 
								  output [4:0] write_addr, 
								  output [31:0] ALUres, 
								  output [31:0] finalPC);
								  
	wire [15:0] imm1;
	wire [20:0] imm2;
	wire [31:0] imm1_out, imm2_out, read_data2, read_data1;
	wire [31:0] ALU_1, ALU_2;
	wire [25:0] j_path1;
	wire [20:0] j_path2;
	wire [31:0] j_path3;
	wire [2:0] flags;
	wire [4:0] Read_addr1;
	wire [4:0] Read_addr2;
	wire [31:0] mem_read_data;
	wire [31:0] ALU_res;
	assign ALUres = ALU_res;
	/*
	wire [31:0] finalPC;
	wire [4:0] write_addr;
	*/
	wire [31:0] reg_write_data;
	wire [31:0] pout, instr_out;
	
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
	wire [3 : 0] wea;
	
	assign j_path2 = instr_out[20:0];
	assign j_path1 = instr_out[25:0];
	assign Read_addr1 = instr_out[25:21];
	assign Read_addr2 = instr_out[20:16];
	assign imm1 = instr_out[15:0];
	assign imm2 = instr_out[20:0];
	wire [31:0] ans;
	
	RegisterFile regfile(clka, instr_out[25:21], instr_out[20:16], write_addr, reg_write_data, reg_write, read_data1, read_data2, ans);
	controller controlUnit(instr_out,
								  mem_read,
						        mem_write,
						        reg_write,
						        mem_to_reg,
						        w_select,
						        j_select,
						        ALU_C,
						        comp,
						        flag_select,
						        jal,
						        jmp_type,
						        b_src,
						        jmp_reg,
						        jmp_instr);
								  
	Sign_16_32_extend extender1(imm1, imm1_out);
	Sign_21_32_extend extender2(imm2, imm2_out);
	
	MUX_4_1 mux1(32'd0, imm1_out, imm2_out, read_data2, b_src, ALU_2);
	MUX_2_1 mux2(32'd0, read_data1, comp, ALU_1);
	
	Datapaths paths(j_path1, 
					    j_path2,
					    j_path3,
					    read_data1,
					    flags,
					    jmp_type,
					    flag_select,
					    j_select,
					    jmp_reg,
					    jmp_instr,
					    w_select,
					    Read_addr1,
					    Read_addr2,
					    mem_read_data,
					    ALU_res,
					    mem_to_reg,
					    jal,
					    finalPC,
					    write_addr,
					    reg_write_data
						 );
	
	PC program_counter(clka, reset, finalPC, pout);
	ADD4 p_next(pout, j_path3);
	InstructionMemory IM(f_clka, 1'b1, pout, instr_out);
	ALU alu(clka, ALU_1, ALU_2, ALU_C, ALU_res, flags);
	assign wea = {mem_write, mem_write, mem_write, mem_write};
	DataMemory DM(f_clka, mem_read, wea, ALU_res, read_data2, mem_read_data);
	
	always @(*) begin
		$display("program counter | time =  %0t clka = %b, pc=%d           , instr = %b ", $time, clka, pout, instr_out);
		if(pout == 32'd56)begin
			$display("The gcd is %d ", $signed(ans));
			$finish;
		end
		//$display("flag info | time =  %0t clka = %b, flags = %b", $time, clka, flags);
	end
	
endmodule
