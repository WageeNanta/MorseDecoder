`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 12:01:32 PM
// Design Name: 
// Module Name: type_state
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


module type_state(
    input clk_board,
    input clear,
    input clk_in,
    input t17,  //switch from basys3 board to input morse code
    input w19,  //switch from basys3 board to separate the letter
    output [1:0] type, //type of the input
    output reg [2:0]led
    );


    reg [3:0]count = 0;
    //reg [1:0]type_old;
    reg t17_old;
    reg w19_old;
    reg [1:0]type_now;
    reg [1:0]type_old;
    
    reg state;
    reg [3:0]sent_count = 0 ;
    
    wire pos_w19;
    wire pos_but;
    wire neg_but;
    
    parameter GAP = 2'b00;
    parameter DOT = 2'b01;
    parameter DASH = 2'b10;
    parameter STOP = 2'b11;
    
    //initial type_now = STOP;
    //initial type_old = STOP;
    //initial count = 0;
   // initial type = STOP;
    //initial type_present = STOP;
   // initial led = 0;
    
    always@(posedge clk_board,negedge clear)
        begin
        if(!clear)
            begin
            t17_old <= 0;
            w19_old <= 0;
            end
        else
            begin
            t17_old <= t17;
            w19_old <= w19;
            end
        end
        
    assign pos_but = (!t17_old) & (t17);
    assign neg_but = (t17_old) & (!t17);
    assign pos_w19 = (!w19_old) & (w19);
    
    
   always@(posedge clk_in, negedge clear)
        begin
        if(!clear)
            count <= 0;
        //else if( pos_w19 )
        //    count <= 0;
        //else if (pos_but)
        //    count <= 0;
        else
            begin
                if(t17 == 1)
                    begin
                        if(count == 15)
                            count <= count;
                        else
                            count <= count + 1;
                    end
                else if(t17 == 0)
                    begin
                        if(count > 0)
                            begin
                            sent_count <= 0;
                            //    if(count > 9)
                           
                                state <= 1;
                            //    else if(count!=0 && count < 10)
                            //        state <= 1;
                                sent_count = count;
                                count <= 0;
                            end
                       else
                        begin
                        state <= 0;
                        sent_count <= 0;
                        end
                    end
            end
        end
        

      always@(posedge clk_board, negedge clear)
        begin
            if(!clear)
                type_old <= STOP;
            else
                type_old <= type_now;
        end
        
     always@ ( * )
     
        begin
        type_now = type_old;
        //type_old = type_now;
        case(type_old)
            STOP:begin 
                  led = 3'b000;
              //    if(state)
                    begin
                        if(sent_count > 9)
                            type_now = DASH;
                        else if(sent_count != 0 && sent_count < 10)
                            type_now = DOT;
                        else if(w19)
                            type_now = GAP;
                        else if( type_old == STOP )
                            type_now = type_now;
                    end
                 end
            DOT: begin
                    led = 3'b001;
                    type_now = STOP;
                    //count = 0;
                  end
            DASH: begin
                    led = 3'b011;
                    type_now = STOP;
                    //count = 0;
                  end
            GAP: begin
                    led = 3'b111;
                    type_now = STOP;
                    //count = 0;
                  end
        endcase
        end
        assign type = type_old;
     /*reg [1:0]type_reg;
     reg[2:0]led_reg;   
     always@(posedge clk_board, nef)
        begin
        //led <= 3'b000;
        if(neg_but)
            begin
            if(count > 9)
                begin
                type_reg = DASH;
                led_reg = 3'b011;
                end
            else if(count != 0 && count <= 9 )
                begin
                type_reg = DOT;
                led_reg = 3'b001;
                end
            if(pos_w19)
                begin
                type_reg = GAP;
                led_reg = 3'b111;
                end
            end
        end
        assign type = type_reg;
        assign led = led_reg;
    //always@(posedge clk_in, posedge w19)
    
    /always @ (posedge clk_in)
    begin
        if(clear == 0)
            begin
            count = 0;
            type = STOP;
            t17_old = 0;
            led = 0;
            end
        else
        begin
        if (t17 == 1)
            begin
            t17_old <= 0;
            count <= count + 1;
            end //dont want to work anymore
        
        if(type == STOP)
        begin
        
            if( count!=0 && count > 4'b0110 )
                begin
                if(t17_old == 1)
                    begin
                    type <= DASH;   //user input dash
                    led <= 3'b011;
                    end
                end
            else if(count != 0)
                begin
                if(t17_old == 1)
                    begin
                    type <= DOT;    //user input dot
                    led <= 3'b001;
                    end
                end  
            if(w19)
            begin
                //if(t17_old == 1)
                begin
                    type <= GAP;
                    led <= 3'b111;
                end
            end
        end
        if(t17 == 0)
            begin
            t17_old <= 1;
            count <= 0;
            led <= 3'b000;
            type <= STOP;
            end
        if(t17_old != t17)
            t17_old <= t17;
             
         
        //if(type_old != type_present)
            //type_old <= type_present;
        //type <= type_old;
        end 
    end */
endmodule
