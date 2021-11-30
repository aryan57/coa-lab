`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:01 11/06/2021 
// Design Name: 
// Module Name:    Branch_Logic 
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
module Branch_Logic(input [2:0] jmp_type, input flag, output reg valid_jmp);

	always@(*) begin
		if(jmp_type == 3'b000) begin
			valid_jmp = 1'b1;
		end
		if(jmp_type == 3'b001) begin
			valid_jmp = 1'b1;
		end
		if(jmp_type == 3'b010) begin
			valid_jmp = flag;
		end
		if(jmp_type == 3'b011) begin
			valid_jmp = ~flag;
		end
		if(jmp_type == 3'b100) begin
			valid_jmp = 1'b1;
		end
		if(jmp_type == 3'b101) begin
			valid_jmp = flag;
		end
		if(jmp_type == 3'b110) begin
			valid_jmp = flag;
		end
		if(jmp_type == 3'b111) begin
			valid_jmp = ~flag;
		end
		
	end

endmodule
