`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:11:39 AM
// Design Name: 
// Module Name: input_morse
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


module input_morse(

    input clk_in,
    input t17,  //switch from basys3 board to input morse code
    input w19,  //switch from basys3 board to separate the letter
    output reg [1:0] type //type of the input
    );


    reg [3:0]count = 0;
    reg [1:0]type_old;
    reg [1:0]type_present;
    
    parameter GAP = 2'b00;
    parameter DOT = 2'b01;
    parameter DASH = 2'b10;
    parameter STOP = 2'b11;
    
    initial count = 0;
    initial type_old = STOP;
    initial type_present = STOP;
    
    always @ (posedge clk_in)
    begin
        
        if (t17 == 1)
            count <= count + 1;
        
        if(type_present == STOP)
        begin
        
            if( count!=0 && count > 4'b0110  )
                begin
                    type_present <= DASH;   //user input dash
                end
            else if(count != 0)
                begin
                    type_present <= DOT;    //user input dot
                end  
            else if(w19)
                type_present <= GAP; 
        end
        if(t17 == 0)
            type_present <= STOP;
             
         
        //if(type_old != type_present)
            //type_old <= type_present;
        //type <= type_old;
    end
endmodule

