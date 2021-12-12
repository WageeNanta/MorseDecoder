`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 10:55:32 PM
// Design Name: 
// Module Name: state_traversal
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


module state_traversal(
    input clear,
    input clock_in,
    input [1:0] typeValue,
    output reg [5:0] letter = 6'b111111,
    output reg newLetter = 0
    //output reg [2:0]led
    );
    reg [5:0] state = 6'b111111;
    parameter GAP = 2'b00;
    parameter DOT = 2'b01;
    parameter DASH = 2'b10;
    parameter NOTHING = 2'b11;
    
    parameter [5:0] BLANK = 6'b111111;
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
    
  
    
    
    always @ (posedge clock_in) 
        if(clear == 1)
        begin
        newLetter = 0;
             case(state)
                BLANK:  begin
                        //led = 3'b100; 
                        case(typeValue)
                        DOT: state = E;
                        DASH: state = T;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                letter = BLANK;
                            end
                        endcase    
                        end
                E:  begin
                    //led = 3'b010; 
                    case(typeValue)
                        DOT: state = I;
                        DASH: state = A;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = E;
                            end 
                    endcase         
                    end
                T:  case(typeValue)
                        DOT: state = N;
                        DASH: state = M;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = T;
                            end
                    endcase 
                I:  begin
                    //led = 3'b001;
                    case(typeValue)
                        DOT: state = S;
                        DASH: state = U;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = I;
                            end
                    endcase
                    end
                A:  case(typeValue)
                        DOT: state = R;
                        DASH: state = W;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = A;
                            end
                    endcase                          
                N:  case(typeValue)
                        DOT: state = D;
                        DASH: state = K;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = N;
                            end
                    endcase                          
                M:  case(typeValue)
                        DOT: state = G;
                        DASH: state = O;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = M;
                            end
                    endcase                          
                S:  case(typeValue)
                        DOT: state = H;
                        DASH: state = V;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = S;
                            end
                    endcase                          
                U:  case(typeValue)
                        DOT: state = F;
                        DASH: state = N1;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = U;
                            end
                    endcase                          
                R:  case(typeValue)
                        DOT: state = L;
                        DASH: state = BLANK;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = NULL;
                                letter = R;
                            end
                    endcase                          
                W:  case(typeValue)
                        DOT: state = P;
                        DASH: state = J;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = W;
                            end
                    endcase                          
                D:  case(typeValue)
                        DOT: state = B;
                        DASH: state = X;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = D;
                            end
                    endcase                          
                K:  case(typeValue)
                        DOT: state = C;
                        DASH: state = Y;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = K;
                            end
                    endcase                          
                G:  case(typeValue)
                        DOT: state = Z;
                        DASH: state = Q;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = G;
                            end
                    endcase                          
                O:  case(typeValue)
                        DOT: state = N2;
                        DASH: state = N3;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = O;
                            end
                    endcase                          
                H:  case(typeValue)
                        DOT: state = FIVE;
                        DASH: state = FOUR;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = H;
                            end
                    endcase                          
                V:  case(typeValue)
                        DOT: state = BLANK;
                        DASH: state = THREE;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = V;
                            end
                    endcase
                F:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = F;
                            end
                    endcase                          
                N1: case(typeValue)
                        DOT: state = NULL;
                        DASH: state = TWO;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = NULL;
                            end
                    endcase                          
                L:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = L;
                            end
                    endcase
                P:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = P;
                            end
                    endcase                          
                J:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = ONE;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = J;
                            end
                    endcase                          
                            
                B:  case(typeValue)
                        DOT: state = SIX;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = B;
                            end
                    endcase                          
                X:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = X;
                            end
                    endcase                          
                C:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = C;
                            end
                    endcase                          
                Y:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = Y;
                            end
                    endcase                          
                Z:  case(typeValue)
                        DOT: state = SEVEN;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = Z;
                            end
                    endcase                          
                Q:  case(typeValue)
                        DOT: state = NULL;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = Q;
                            end
                     endcase                                       
                N2:  case(typeValue)
                        DOT: state = EIGHT;
                        DASH: state = NULL;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = NULL;
                            end
                     endcase                   
                N3:  case(typeValue)
                        DOT: state = NINE;
                        DASH: state = ZERO;
                        NOTHING: state = state; 
                        default : 
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = NULL;
                            end
                     endcase 
                FIVE:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = FIVE;
                             end
                       endcase     
               FOUR:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = FOUR;
                             end
                       endcase      
                     
               THREE:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = THREE;
                             end
                       endcase      
               TWO:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = TWO;
                             end
                       endcase      
               ONE:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = ONE;
                             end
                     endcase        
               SIX:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = SIX;
                             end
                       endcase              
               SEVEN:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = SEVEN;
                             end
                       endcase      
               EIGHT:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = EIGHT;
                             end
                       endcase      
                NINE:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = NINE;
                             end
                       endcase 
                ZERO:  case(typeValue)
                          DOT: state = NULL;
                          DASH: state = NULL;
                          NOTHING: state = state; 
                          default : 
                             begin
                                newLetter = 1;
                                state = BLANK;
                                letter = ZERO;
                             end
                       endcase                                                                 
                NULL:  case(typeValue)
                        NOTHING: state = state;
                        GAP :  
                            begin
                                newLetter = 1;
                                state = BLANK;
                                letter = NULL;
                            end
                        default: state = NULL; //loop in this state until user input GAP   
                        endcase                          
                default:
                    begin
                        state = BLANK;
                        newLetter = 1;
                    end                     
                                               
            endcase    
        end
        else
            begin
            newLetter = 0;
            state = BLANK;
            letter = NULL;
            end
endmodule
    