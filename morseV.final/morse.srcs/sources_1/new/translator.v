`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 06:50:41 PM
// Design Name: 
// Module Name: translator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module translator(
    input newletter,
    input [5:0]letter,
    input clock,
    output reg [15:0]seg,
    output reg [6:0]seg1
    );
    //reg [5:0]letter_old = 6'b111111;
    
    parameter [5:0] ZERO = 6'b000000;
    parameter [5:0] ONE = 6'b000001;
    parameter [5:0] TWO = 6'b000010;
    parameter [5:0] THREE = 6'b000011;
    parameter [5:0] FOUR = 6'b000100;
    parameter [5:0] FIVE = 6'b000101;
    parameter [5:0] SIX = 6'b000110;
    parameter [5:0] SEVEN = 6'b000111;
    parameter [5:0] EIGHT = 6'b001000;
    parameter [5:0] NINE = 6'b001001;
    
    parameter [5:0] A = 6'b001010;
    parameter [5:0] B = 6'b001011;
    parameter [5:0] C = 6'b001100;
    parameter [5:0] D = 6'b001101;
    parameter [5:0] E = 6'b001110;
    parameter [5:0] F = 6'b001111;
    parameter [5:0] G = 6'b010000;
    parameter [5:0] H = 6'b010001;
    parameter [5:0] I = 6'b010010;
    parameter [5:0] J = 6'b010011;
    parameter [5:0] K = 6'b010100;
    parameter [5:0] L = 6'b010101;
    parameter [5:0] M = 6'b010110;
    parameter [5:0] N = 6'b010111;
    parameter [5:0] O = 6'b011000;
    parameter [5:0] P = 6'b011001;
    parameter [5:0] Q = 6'b011010;
    parameter [5:0] R = 6'b011011;
    parameter [5:0] S = 6'b011100;
    parameter [5:0] T = 6'b011101;
    parameter [5:0] U = 6'b011110;
    parameter [5:0] V = 6'b011111;
    parameter [5:0] W = 6'b100000;
    parameter [5:0] X = 6'b100001;
    parameter [5:0] Y = 6'b100010;
    parameter [5:0] Z = 6'b100011;
    parameter [5:0] N1 = 6'b100100;
    parameter [5:0] N2 = 6'b100101;
    parameter [5:0] N3 = 6'b100110;
    parameter [5:0] NULL = 6'b100111;
    
    always@(posedge clock)
    begin
        if(newletter == 1)
        case(letter)
	       ZERO : seg = 16'b0110000011111111;
	       ONE : seg = 16'b0000000000001100;
	       TWO : seg = 16'b0000001101110111;
	       THREE : seg = 16'b0000001100111111;
	       FOUR : seg = 16'b0000001110001100;
	       FIVE : seg = 16'b0000001110111011;
	       SIX : seg = 16'b0000001111111011;
	       SEVEN : seg = 16'b0110000000000011;
	       EIGHT : seg = 16'b0000001111111111;
	       NINE : seg = 16'b0000001110111111;
	       A : seg = 16'b0000001111001111;
	       B : seg = 16'b0010001111111011;
	       C : seg = 16'b0000000011110011;
	       D : seg = 16'b0000110100111111;
	       E : seg = 16'b0000001111110011;
	       F : seg = 16'b0000001111000011;
	       G : seg = 16'b0000001011111011;
	       H : seg = 16'b0000001111001100;
	       I : seg = 16'b0000110000110011;
	       J : seg = 16'b0000000001111100;
	       K : seg = 16'b1010000111000000;
	       L : seg = 16'b0000000011110000;
	       M : seg = 16'b0011000011001100;
	       N : seg = 16'b1001000011001100;
	       O : seg = 16'b0000000011111111; 
	       P : seg = 16'b0000001111000111;
	       Q : seg = 16'b1000000011111111;
	       R : seg = 16'b1000001111000111;
	       S : seg = 16'b0001001000111011;
	       T : seg = 16'b0000110000000011;
	       U : seg = 16'b0000000011111100;
	       V : seg = 16'b0110000011000000;
	       W : seg = 16'b1100000011001100;
	       X : seg = 16'b1111000000000000;
	       Y : seg = 16'b0011100000000000;
	       Z : seg = 16'b0110000000110011;
        default : seg = 16'b00000000000000;   
        endcase
    end
    
     always@(posedge clock)
    begin
        //if(letter_old != letter && letter != 6'b111111)
        //    letter_old = letter;
        if(newletter == 1)
        case(letter)
	       ZERO : seg1 = 7'b1000000;
	       ONE : seg1 = 7'b1111001;
	       TWO : seg1 = 7'b0100100;
	       THREE : seg1 = 7'b0110001;
	       FOUR : seg1 = 7'b0011001;
	       FIVE : seg1 = 7'b0010010;
	       SIX : seg1 = 7'b0000010;
	       SEVEN : seg1 = 7'b1111000;
	       EIGHT : seg1 = 7'b0000000;
	       NINE : seg1 = 7'b0011000;
	       A : seg1 = 7'b0001000;
	       B : seg1 = 7'b0000011;
	       C : seg1 = 7'b1000110;
	       D : seg1 = 7'b0100001;
	       E : seg1 = 7'b00000110;
	       F : seg1 = 7'b0001110;
	       G : seg1 = 7'b0010000;
	       H : seg1 = 7'b0001001;
	       I : seg1 = 7'b1101110;
	       J : seg1 = 7'b1100001;
	       K : seg1 = 7'b1110110;
	       L : seg1 = 7'b1000111;
	       M : seg1 = 7'b0110110;
	       N : seg1 = 7'b0110111;
	       O : seg1 = 7'b0100011;
	       P : seg1 = 7'b0001100;
	       Q : seg1 = 7'b0010100;
	       R : seg1 = 7'b0101111;
	       S : seg1 = 7'b0110010;
	       T : seg1 = 7'b1001110;
	       U : seg1 = 7'b1000001;
	       V : seg1 = 7'b1100011;
	       W : seg1 = 7'b0111000;
	       X : seg1 = 7'b1001001;
	       Y : seg1 = 7'b0001101;
	       Z : seg1 = 7'b1110111;
        default : seg1 = 7'b1111111; 
        endcase
    end
endmodule
