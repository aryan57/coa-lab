`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Assignment no - 1
// Problem no - 1
// Semester - Autumn(2021-2022)
// Group No - 48
// Members - Vinit Raj, Aryan Agarwal
// Company: 
// Engineer:
//
// Create Date:   17:56:00 08/25/2021
// Design Name:   rca_8_bit
// Module Name:   C:/Users/vinit/Desktop/Acads/Sem5/COALAB/Ass1/ADDERS/rca_8_bit_test_bench.v
// Project Name:  ADDERS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rca_8_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top();
    reg[7:0] a_8, b_8;
    reg cin_8;
    wire[7:0] sum_8;
    wire cout_8;
    rca_8_bit rca_8(a_8, b_8, cin_8, cout_8, sum_8);  

    initial begin
        $dumpfile("variables.vcd");
        $dumpvars(0, top);
        $monitor( "a_8 = %b b_8 = %b | sum_8 = %b", a_8, b_8, sum_8);
        a_8 = 8'b00111111;
        b_8 = 8'b01010101;
        cin_8=0;
        #20;
        a_8 = 8'b10100111;
        b_8 = 8'b01111101;
        cin_8=0;
        #20;
        a_8 = 8'b10110010;
        b_8 = 8'b10010101;
        cin_8=0;
        #20;
        $finish;
    end
endmodule

