`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 11:18:39 PM
// Design Name: 
// Module Name: displaying
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


module displaying(
    input clock,
    input [15:0]seg,
    input video_on, p_tick,
    input [9:0]x,y,
    output vga
    );
    reg vga_reg,vga_next;
    
    //vga_sync vga_sync_unit (.clk(clk), .reset(clear), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(p_tick), .x(x), .y(y));
    
    always@(posedge clock)
        begin
        //vga_next = 1;
        //if(video_on)
            //begin
            if( x >= 291 && x <= 320 && y >= 176 && y <= 179)
                if(seg[0] == 1)
                    vga_next = 0;
            else if(x >= 321 && x <= 350 && y >= 176 && y <= 179)
                if(seg[1] == 1)
                    vga_next = 0;
            else if(x >= 347 && x <= 350 && y >= 180 && y <= 239)
                if(seg[2] == 1)
                    vga_next = 0;
            else if(x >= 347 && x <= 350 && y >= 240 && y <= 299)
                if(seg[3] == 1)
                    vga_next = 0;
            else if(x >= 321 && x <= 350 && y >= 300 && y <= 303)
                if(seg[4] == 1)
                    vga_next = 0;
            else if( x >= 291 && x <= 320 && y >= 300 && y <= 303)
                if(seg[5] == 1)
                    vga_next = 0;
            else if(x >= 291 && x <= 294  && y >= 240 && y <= 299)
                if(seg[6] == 1)
                    vga_next = 0;
            else if(x >= 291 && x <= 294 && y >= 180 && y <= 239)
                if(seg[7] == 1)
                    vga_next = 0;
            else if(x >= 295 && x <= 318 && y >= 238 && y <= 241)
                if(seg[8] == 1)
                    vga_next = 0;
            else if(x >= 323 && x <= 346 && y >= 238 && y <= 241)
                if(seg[9] == 1)
                    vga_next = 0;
            else if(x >= 319 && x <= 322 && y >= 180 && y <= 239)
                if(seg[10] == 1)
                    vga_next = 0;
            else if(x >= 319 && x <= 322 && y >= 240 && y <= 299)
                if(seg[11] == 1)
                    vga_next = 0;
            else if( x >= 295 && x <= 296 && y >= 180 && y <= 181) // seg13
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 295 && x <= 297 && y >= 182 && y <= 183)
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 296 && x <= 298 && y >= 184 && y <= 185)
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 297 && x <= 298 && y == 186 )
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 297 && x <= 299 && y >= 187 && y <= 188)
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 298 && x <= 300 && y >= 189 && y <= 190)
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 299 && x <= 300 &&  y == 191)
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 299 && x <= 301 && y >= 192 && y <= 193)
                if(seg[12] == 1)
                    vga_next = 0;
            else if( x >= 300 && x <= 302 && y >= 194 && y <= 195)
                if(seg[12] == 0)
                    vga_next = 0;
            else if( x >= 301 && x <= 302 && y == 196)
                if(seg[12] == 1)
                    vga_next = 0;
            else
                vga_next = 1;
            //end
        //else
        //   vga_next = 0;
        end
   
  //  always@(posedge clock)
     //   begin
       // if( p_tick)
         //   vga_reg <= vga_next;
        //end
        
    //assign vga = vga_reg;
endmodule
