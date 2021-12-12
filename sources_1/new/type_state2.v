`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 01:38:38 PM
// Design Name: 
// Module Name: type_state2
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


module type_state2(
    input clock100Hz,
    input clear,
    input btnR,
    input  btnL,
    output [1:0]type,
    output reg [15:0]led
    );
    
    reg [7:0]count = 0;
    
    reg [4:0]i = 0;
    
    reg btnLOld = 0;
    reg btnROld = 0;
    
    reg [1:0]type_old = 0;
    reg [1:0]type_next = 0;
    
    reg state;
    reg [7:0]finalCount = 0;
    
    parameter GAP = 2'b00;
    parameter DOT = 2'b01;
    parameter DASH = 2'b10;
    parameter STOP = 2'b11;
    
    always @ (posedge clock100Hz)
        begin
        
        type_next = STOP;
        //led = 3'b000;
        finalCount = 0;
                
        // Clear

        if(clear == 0)
            begin
            led = 0;
            i = 16;
            end
                
        // BUTTION RIGHT COUNTER
        
        if(btnR == 1)
            begin
                if(count <100)
                    count = count + 1;
            end
        
        if(btnR == 0)
            begin                
                finalCount = count;
                count = 0;
            end
        
        // BUTTON LEFT 
        
        if ( ( btnL != btnLOld)  &&  ( btnL == 1 ) )
            begin
                type_next = GAP;
                led = 0;
                i = 16;
            end
        
        // State Assign
        
        if ( ( btnR != btnROld) && ( btnR ==  0) )
            begin
                if(i == 16)
                    i = i - 1;
                if(finalCount < 70) begin
                    type_next = DOT;
                    if(i > 1 && i != 16)
                        begin
                        led[i] = 1;
                        i = i - 2;
                        end
                    //led = 3'b011;
                    end
                else begin
                    type_next = DASH;  
                    if(i > 1 && i != 16)
                        begin
                            i = i - 2;
                            led[i] = 1;
                            led[i+1] = 1;
                            led[i+2] = 1;
                            i = i - 2;
                        end
                    //led = 3'b001;    
                    end
     
            end
        
        
        btnROld <= btnR;
        btnLOld <= btnL;
        
        end
        
        assign type = type_next;
        
endmodule
