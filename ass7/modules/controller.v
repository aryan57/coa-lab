`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:41 11/05/2021 
// Design Name: 
// Module Name:    controller 
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
module controller(input [31:0] instr, 
						output reg mem_read,
						output reg mem_write,
						output reg reg_write,
						output reg mem_to_reg,
						output reg [1:0] w_select,
						output reg j_select,
						output reg [4:0] ALU_C,
						output reg comp,
						output reg [1:0] flag_select,
						output reg jal,
						output reg [2:0] jmp_type,
						output reg [1:0] b_src,
						output reg jmp_reg,
						output reg jmp_instr
						);
						
	always@(*)begin
		if(instr[31:30] == 2'b00)begin               //R type instructions
		
			if(instr[5:0] == 6'b000001)begin              //add
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[5:0] == 6'b000010)begin              //comp
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b10100;
				comp = 1'b1;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[5:0] == 6'b000011)begin              //and
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00001;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end

			if(instr[5:0] == 6'b000100)begin              //xor
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00010;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[5:0] == 6'b000101)begin              //shllv
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00011;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[5:0] == 6'b000110)begin              //shrlv
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b01011;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[5:0] == 6'b000111)begin              //shrav
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b01111;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
		end
		
		if(instr[31:30] == 2'b10)begin               //Immediate type instructions
		
			if(instr[29:26] == 4'b0001)begin          //addi
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b01;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[29:26] == 4'b0010)begin          //compi
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b10100;
				comp = 1'b1;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[29:26] == 4'b0101)begin          //shll
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00011;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b01;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[29:26] == 4'b0110)begin          //shrl
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b01011;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b01;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[29:26] == 4'b0111)begin          //shra
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b01111;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b01;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
		end
		
		if(instr[31:30] == 2'b01)begin               //Load Store instructions
		
			if(instr[29:26] == 4'b0000)begin          //lw
				mem_read = 1'b1;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b1;
				w_select = 2'b01;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b10;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
			if(instr[29:26] == 4'b0001)begin          //sw
				mem_read = 1'b0;
				mem_write = 1'b1;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b10;
				jmp_reg = 1'b0;
				jmp_instr = 1'b0;
			end
			
		end
		
		if(instr[31:30] == 2'b11)begin               //branch instructions
		
			if(instr[29:26] == 4'b0000)begin          //b
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b000;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0001)begin          //bl
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				mem_to_reg = 1'b0;
				w_select = 2'b10;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b1;
				jmp_type = 3'b001;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0010)begin          //bcy
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b10;
				jal = 1'b0;
				jmp_type = 3'b010;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0011)begin          //bncy
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b10;
				jal = 1'b0;
				jmp_type = 3'b011;
				b_src = 2'b00;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0100)begin          //br
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b0;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b100;
				b_src = 2'b00;
				jmp_reg = 1'b1;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0101)begin          //bltz
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b1;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b01;
				jal = 1'b0;
				jmp_type = 3'b101;
				b_src = 2'b11;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0110)begin          //bz
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b1;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b110;
				b_src = 2'b11;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
			if(instr[29:26] == 4'b0111)begin          //bnz
				mem_read = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				mem_to_reg = 1'b0;
				w_select = 2'b00;
				j_select = 1'b1;
				ALU_C = 5'b00000;
				comp = 1'b0;
				flag_select = 2'b00;
				jal = 1'b0;
				jmp_type = 3'b111;
				b_src = 2'b11;
				jmp_reg = 1'b0;
				jmp_instr = 1'b1;
			end
			
		end
		
	end
	
endmodule
