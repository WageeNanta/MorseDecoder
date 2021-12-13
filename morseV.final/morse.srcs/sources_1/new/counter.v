`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 12:29:18 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk_in,
    input [1:0] type, //type of the input
    output reg [15:0] led1,
    output reg [1:0] typeValue
    
    );
    reg i = 0;
    reg [3:0]led = 0;
    reg [1:0] temp_type;

    parameter GAP = 2'b00;
    parameter DOT = 2'b01;
    parameter DASH = 2'b10;
    parameter NOTHING = 2'b11;
    
    initial led = 0;
    initial led1 = 0;
    
    always @ (posedge clk_in)
    begin
   
        if()
        if (t17 == 1)
            led <= led+1;
        
         if( led > 4'b0010 )
            begin
                led1[i] <= 1'b1;
                led1[i+1] <= 1'b1;
                led1[i+2] <= 1'b1;
                type <= DASH;   //user input dash
            end
        else if(led != 0)
        begin
            led1[i] <= 1'b1;
            type <= DOT;    //user input dot
        end  
        else if(w19)
            type <= GAP; 
             
        if(t17 == 0)
            led1 <= 0;
            
        if(type)
    end
endmodule