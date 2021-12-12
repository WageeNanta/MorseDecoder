`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 10:42:18 PM
// Design Name: 
// Module Name: divide
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


module divide (
    input clock,
    output clk_out
);
    reg elapsed; //elapsed time 1 second
    reg [27:0] state;
    
    always @(posedge clock)
        if(state == 1000000) state <= 0;
        else state <= state + 1;
    always @(state)
        if(state == 1000000) elapsed = 1;
        else elapsed = 0;
    assign clk_out = elapsed;
endmodule

module divide1 (
    input clock,
    output clk_out
);
    reg elapsed; //elapsed time 1 second
    reg [27:0] state;
    
    always @(posedge clock)
        if(state == 100000000) state <= 0;
        else state <= state + 1;
    always @(state)
        if(state == 100000000) elapsed = 1;
        else elapsed = 0;
    assign clk_out = elapsed;
endmodule

module refreshment (
    input clock,
    output reg [19:0]refresh
);    
    initial refresh = 0;
    always @(posedge clock)
        begin
        refresh <= refresh + 1;
        end
endmodule


module counter(
    input clock,
    input [1:0]check,
    input clear,
    output reg [3:0]num1,num2,num3,num4
);
    reg countWrong = 0;
    initial num1 = 0;
    initial num2 = 0;
    initial num3 = 0;
    initial num4 = 0;
    
    always@(posedge clock)
        begin
        if(!clear)
            begin
            countWrong <= 0;
            num1 <= 0;
            num2 <= 0;
            num3 <= 0;
            num4 <= 0;
            end
        else if(check == 2'b11 && countWrong == 0)
            begin
            if(num1 == 4'b1001 )
                begin
                num1 <= 0;
                if(num2 == 4'b1001)
                    begin
                    num2 <= 0;
                    if(num3 == 4'b1001)
                        begin
                        num3 <= 0;
                        if(num4 == 4'b1001)
                            begin
                            num4 <= 0;
                            end
                        else
                            begin
                            num4 <= num4 + 1;
                            end
                        end
                    else
                        begin
                        num3 <= num3 + 1;
                        end
                    end
                else
                    begin
                    num2 <= num2 + 1;
                    end
                end
            else
                begin
                num1 <= num1 + 1;
                end
            end
        else if(check == 2'b01)
            begin
            num1 <= num1;
            num2 <= num2;
            num3 <= num3;
            num3 <= num4;
            end
        else if(check == 2'b00 && countWrong == 0)
            begin
            countWrong <= countWrong + 1;
            end
        end
endmodule

module selectLed(
    input [19:0]count,
    input [3:0]led1, led2,led3,led4,
    output reg [3:0]an, led
);
    always @(count or led1 or led2 or led3 or led4)
        begin
            case(count[16:15])
                2'b00:
                    begin
                    an = 4'b1110;
                    led = led1;
                    end
                2'b01:
                    begin
                    an = 4'b1101;
                    led = led2;
                    end
                2'b10:
                    begin
                    an = 4'b1011;
                    led = led3;
                    end
                2'b11:
                    begin
                    an = 4'b0111;
                    led = led4;
                    end
            endcase
        end
endmodule

module numTo7seg(
    input [3:0]num,
    output reg [6:0]seg
);
    always@(num)
        begin
        case(num)
        4'b0000: seg = 7'b1000000;  //0
        4'b0001: seg = 7'b1111001;  //1
        4'b0010: seg = 7'b0100100;  //2
        4'b0011: seg = 7'b0110000;  //3
        4'b0100: seg = 7'b0011001;  //4
        4'b0101: seg = 7'b0010010;  //5
        4'b0110: seg = 7'b0000010;  //6
        4'b0111: seg = 7'b1111000;  //7
        4'b1000: seg = 7'b0000000;  //8
        4'b1001: seg = 7'b0010000;  //9
        default: seg = 7'b1000000;  //0
        endcase
        end
endmodule



module random(
    input clock,
    input newLetter,
    input [19:0]refresh,
    output reg [5:0]letterQ
 );
    always@(clock)
        begin
        if(newLetter == 1 )
            begin
            letterQ = refresh%36;
            end
        end
 endmodule
 
 
 module check(
    input clock,
    input newLetter,
    input [5:0]letterQ,
    input [5:0]letter, 
    output reg [1:0]checkValue
    );
    parameter CORRECT = 2'b11;
    parameter WRONG = 2'b00;
    parameter STAY = 2'b01;
    
    reg [5:0]letterQ_old; 

    always@(posedge clock)
        begin
        checkValue <= STAY;
        if(newLetter)
            begin
            if(letter == letterQ_old)
                begin
                checkValue <= CORRECT; 
                end
            else if(letter != letterQ_old)
                begin
                checkValue <= WRONG; 
                end
            end
        letterQ_old <= letterQ;
        end
 endmodule