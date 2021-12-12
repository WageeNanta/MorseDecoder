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
    input clear,
    input [5:0]letter,
    input clock,
    output reg [15:0]seg
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
        if(clear == 0)
            begin
            seg = 16'b00000000000000; 
            end
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
	       D : seg = 16'b0000110000111111;
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
endmodule

module letterQtoSegQ(
    input clock,
    input [5:0]letterQ,
    output reg[15:0]segQ
);
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
        case(letterQ)
	       ZERO : segQ = 16'b0110000011111111;
	       ONE : segQ = 16'b0000000000001100;
	       TWO : segQ = 16'b0000001101110111;
	       THREE : segQ = 16'b0000001100111111;
	       FOUR : segQ = 16'b0000001110001100;
	       FIVE : segQ = 16'b0000001110111011;
	       SIX : segQ = 16'b0000001111111011;
	       SEVEN : segQ = 16'b0110000000000011;
	       EIGHT : segQ = 16'b0000001111111111;
	       NINE : segQ = 16'b0000001110111111;
	       A : segQ = 16'b0000001111001111;
	       B : segQ = 16'b0010001111111011;
	       C : segQ = 16'b0000000011110011;
	       D : segQ = 16'b0000110000111111;
	       E : segQ = 16'b0000001111110011;
	       F : segQ = 16'b0000001111000011;
	       G : segQ = 16'b0000001011111011;
	       H : segQ = 16'b0000001111001100;
	       I : segQ = 16'b0000110000110011;
	       J : segQ = 16'b0000000001111100;
	       K : segQ = 16'b1010000111000000;
	       L : segQ = 16'b0000000011110000;
	       M : segQ = 16'b0011000011001100;
	       N : segQ = 16'b1001000011001100;
	       O : segQ = 16'b0000000011111111; 
	       P : segQ = 16'b0000001111000111;
	       Q : segQ = 16'b1000000011111111;
	       R : segQ = 16'b1000001111000111;
	       S : segQ = 16'b0001001000111011;
	       T : segQ = 16'b0000110000000011;
	       U : segQ = 16'b0000000011111100;
	       V : segQ = 16'b0110000011000000;
	       W : segQ = 16'b1100000011001100;
	       X : segQ = 16'b1111000000000000;
	       Y : segQ = 16'b0011100000000000;
	       Z : segQ = 16'b0110000000110011;
        default : segQ = 16'b00000000000000;    
        endcase
    end
endmodule
