`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 10:16:44 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    
    input clk,clear,t17,w19,
    //output letter1,//final output
    output [6:0]seg,
    output [15:0]led,
    output hsync, vsync,
    output [11:0]vga,
    output [3:0]an
    );

    wire clock;
    wire clock1hz;
    wire [1:0] typeValue;
    wire [5:0] temp_letter; 
    wire newLetter;
    //wire [2:0]led;
    //wire [15:0]led1; 
    wire [9:0]x,y;
    wire video_on, pixel_tick;
    reg [11:0]vga_reg,vga_next;
    wire [15:0]seg1;
    wire [5:0]letterQ;
    wire [15:0]segQ;

    wire [1:0]checkValue;

    wire [19:0]refresh;
    wire [3:0]num1,num2,num3,num4;
    wire [3:0]num;
   
       divide(clk,clock);
       divide1(clk,clock1hz);
       refreshment(clk, refresh);
       //input_morse(clock,t17,w19,typeValue);
      // type_state(clk,clear,clock,t17,w19,typeValue,led[2:0]);
       type_state2(clock,clear,t17,w19,typeValue,led);
       state_traversal(clear,clock,typeValue,temp_letter,newLetter);
       //vga_sync(clk,clear,hsync,vsync,video_on, p_tick, x, y);
       translator(newLetter, clear, temp_letter, clock,seg1);
       
       random(clock,newLetter,refresh, letterQ);
       letterQtoSegQ(clock,letterQ,segQ);
       
       check(clock, newLetter, letterQ, temp_letter, checkValue);
       
       counter(clock, checkValue,clear,num1,num2,num3,num4);
       selectLed(refresh,num1,num2,num3,num4,an,num);
       numTo7seg(num,seg);
       
       vga_sync vga_sync_unit (.clk(clk), .reset(clear), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(pixel_tick), .x(x), .y(y));
       
       always@(posedge clk)
        begin
        //vga_next = 1;
        if(video_on)
            begin
            if( x >= 291 + 100 && x <= 320 + 100 && y >= 176 && y <= 179 && seg1[0] == 1)
                begin
                //if(seg1[0] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 + 100 && x <= 350 + 100 && y >= 176 && y <= 179 && seg1[1] == 1)
                begin
                //if(seg1[1] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 347 + 100 && x <= 350 + 100 && y >= 180 && y <= 239 && seg1[2] == 1)
                begin
                //if(seg1[2] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 347 + 100 && x <= 350 + 100 && y >= 240 && y <= 299 && seg1[3] == 1)
                begin
                //if(seg1[3] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 + 100 && x <= 350 + 100 && y >= 300 && y <= 303 && seg1[4] == 1)
                begin
                //if(seg1[4] == 1)
                vga_next = 12'h000;
                end
            else if( x >= 291 + 100 && x <= 320 + 100 && y >= 300 && y <= 303 && seg1[5] == 1)
                begin
                //if(seg1[5] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 + 100 && x <= 294 + 100 && y >= 240 && y <= 299 && seg1[6] == 1)
                begin
                //if(seg1[6] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 + 100 && x <= 294 + 100 && y >= 180 && y <= 239 && seg1[7] == 1)
                begin
                //if(seg1[7] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 + 100 && x <= 320 + 100 && y >= 238 && y <= 241 && seg1[8] == 1)
                begin
                //if(seg1[8] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 + 100 && x <= 350 + 100 && y >= 238 && y <= 241 && seg1[9] == 1)
                begin
                //if(seg1[9] == 1)
               vga_next = 12'h000;
                end
            else if(x >= 319 + 100 && x <= 322 + 100 && y >= 180 && y <= 239 && seg1[10] == 1)
                begin
                //if(seg1[10] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 319 + 100 && x <= 322 + 100 && y >= 240 && y <= 299 && seg1[11] == 1)
                begin
                //if(seg1[11] == 1)
                vga_next = 12'h000;
                end
            else if(x>=293+ 100 && x<=295 + 100&& y>=179 && y<=181 && seg1[12]==1  ) //seg13
                begin
                vga_next = 12'h000;
                end
            else if(x>=295 + 100&& x<=296 + 100&& y>=180 && y<=181 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=295 + 100&& x<=297+ 100 && y>=182 && y<=183 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=296+ 100 && x<=298 + 100&& y>=184 && y<=185 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=297+ 100 && x<=298+ 100 && y==186 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=297+ 100 && x<=299+ 100 && y>=187 && y<=188 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=298+ 100 && x<=300+ 100 && y>=189 && y<=190 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=299+ 100 && x<=300+ 100 && y==191 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=299+ 100 && x<=301+ 100 && y>=192 && y<=193 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=300+ 100 && x<=302+ 100 && y>=194 && y<=195 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=301+ 100 && x<=302+ 100 && y==196 && seg1[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=301+ 100 && x<=303+ 100 && y>=197 && y<=198 && seg1[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=302+ 100 && x<=304+ 100 && y>=199 && y<=200 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=303+ 100 && x<=304+ 100 && y==201 && seg1[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=303+ 100 && x<=305+ 100 && y>=202 && y<=203 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=304+ 100 && x<=306+ 100 && y>=204 && y<=205 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if( x>=305+ 100 && x<=306+ 100 && y==206 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=305+ 100 && x<=307 + 100&& y>=207 && y<=208 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=306+ 100 && x<=308+ 100 && y>=209 && y<=210 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=307+ 100 && x<=308+ 100 && y==211 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=307+ 100 && x<=309+ 100 && y>=212 && y<=213 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=308+ 100 && x<=310+ 100 && y>=214 && y<=215 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=309+ 100 && x<=310+ 100 && y==216  && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=309+ 100 && x<=311+ 100 && y>=217 && y<=218 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=310+ 100 && x<=312+ 100 && y>=219 && y<= 220 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=311+ 100 && x<=312+ 100 && y>=221 && y<=222 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=311+ 100 && x<=313+ 100 && y>=222 && y<=223 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=312+ 100 && x<=314+ 100 && y>=224 && y<=225 && seg1[12]==1  )
                begin 
                vga_next = 12'h000;
                end
            else if(x>=313+ 100 && x<=314+ 100 && y==226 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=313+ 100 && x<=315+ 100 && y>=227 && y<=228 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=314+ 100 && x<=316+ 100 && y>=229 && y<=230 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=315+ 100 && x<=316+ 100 && y==231 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=315+ 100 && x<=317+ 100 && y>=232 && y<=233 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=316+ 100 && x<=318+ 100 && y>=234 && y<=235 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=318+ 100 && x<=320+ 100 && y>=236 && y<= 239 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=317+ 100 && x<=318+ 100 && y>=236 && y<= 237 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if( x >= 346+ 100 && x <= 348+ 100 && y >= 179 && y <= 181 && seg1[13] == 1) //seg14
                begin
                vga_next = 12'h000;
                end
            else if( x >= 345+ 100 && x <= 346+ 100 && y >= 180 && y <= 181 && seg1[13] == 1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=344+ 100 && x<=346 + 100&& y>=182 && y<=183 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343+ 100 && x<=345 + 100&& y>=184 && y<=185 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 + 100&& x<=344+ 100 && y==186 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 + 100&& x<=344+ 100 && y>= 187 && y<=188 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 + 100&& x<= 343+ 100 && y>=189 && y<=190 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 + 100&& x<=342+ 100&& y==191 && seg1[13]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>= 340+ 100&& x<=342+ 100 && y>=192 && y<=193 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339+ 100 && x<=341+ 100 && y>=194 && y<=195 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339+ 100 && x<=340+ 100 && y==196 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338+ 100 && x<=340+ 100 && y>=197 && y<=198 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337 + 100&& x<=339 + 100&& y>=199 && y<=200 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337+ 100 && x<=338+ 100 && y==201 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336+ 100 && x<=338+ 100 && y>=202 && y<=203 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335+ 100 && x<=337+ 100 && y>=204 && y<=205 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335+ 100 && x<=336+ 100 && y==206 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 + 100&& x<=336+ 100 && y>=207 && y<=208 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333+ 100 && x<=335+ 100 && y>=209 && y<=210 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333+ 100 && x<=334 + 100&& y==211 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332+ 100 && x<=334 + 100&& y>=212 && y<=213 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331+ 100 && x<=333+ 100 && y>=214 && y<=215 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331 + 100&& x<=332+ 100 && y== 216 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330+ 100 && x<=332+ 100 && y>=217 && y<=218 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329+ 100 && x<=331+ 100 && y>=219 && y<=220 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329+ 100 && x<=330+ 100 && y==221 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328+ 100 && x<=330 + 100&& y>=222 && y<=223 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 + 100&& x<=329+ 100 && y>=224 && y<=225 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 + 100&& x<=328+ 100 && y== 226 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=326+ 100 && x<=328+ 100 && y>=227 && y<=228 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 + 100&& x<=327 + 100&& y>=229 && y<=230 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 + 100&& x<=326+ 100 && y==231 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=324 + 100&& x<=326+ 100 && y>=232 && y<=233 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323+ 100 && x<=325+ 100 && y>=234 && y<=235 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 + 100&& x<=324 + 100&& y>=236 && y<=237 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=321+ 100 && x<=323+ 100 && y>=236 && y<=239 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if (x  >= 293+ 100 &&  x<= 295+ 100 && y>= 298 && y<= 301 && seg1[14]==1 )  //seg15
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 295 + 100&&  x<= 296+ 100 && y>= 298 && y<= 299 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 295 + 100&&  x<= 297+ 100 && y>= 296 && y<= 297 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 296+ 100 &&  x<= 298+ 100 && y>= 294 && y<= 295 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 297+ 100 &&  x<= 298 + 100&& y == 293 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 297 + 100&&  x<= 299+ 100 && y >= 291 && y<= 292 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 298 + 100&&  x<= 300+ 100 && y >= 289 && y<= 290 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 299 + 100&&  x<= 300+ 100 && y == 288 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 299+ 100 &&  x<= 301 + 100&& y >= 286 && y<= 287 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 300+ 100 &&  x<= 302+ 100 && y >= 284 && y<= 285 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 301 + 100&&  x<= 302+ 100 && y == 283 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 301 + 100&&  x<= 303 + 100&& y >= 281 && y<= 282 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 302 + 100&&  x<= 304+ 100 && y >= 279 && y<= 280 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 303 + 100&&  x<= 304 + 100&& y == 278 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 303 + 100&&  x<= 305 + 100&& y >= 276 && y<= 277 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 304 + 100&&  x<=306 + 100 && y >=274  && y<=275 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=305 + 100 &&  x<=306 + 100 && y ==273 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=305 + 100 &&  x<=307 + 100 && y >=271  && y<=272 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=306 + 100 &&  x<=308 + 100 && y >=269  && y<=270 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=307 + 100 &&  x<=308 + 100 && y ==268 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=307 + 100 &&  x<=309 + 100 && y >=266  && y<=267 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=308 + 100 &&  x<=310 + 100 && y >=264  && y<=265 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=309 + 100 &&  x<=310 + 100 && y == 263 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=309+ 100  &&  x<=311 + 100 && y >=261  && y<=262 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=310 + 100 &&  x<=312 + 100 && y >=259  && y<=260 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 311 + 100&&  x<=312 + 100 && y ==258 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=311 + 100 &&  x<=313 + 100 && y >=256  && y<=257 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=312 + 100 &&  x<=314 + 100 && y >=254  && y<=255 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=313 + 100 &&  x<=314 + 100 && y ==253  && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 313 + 100&&  x<=315 + 100 && y >=251  && y<=252 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=314 + 100 &&  x<=316 + 100 && y >=249  && y<=250 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=315+ 100 &&  x<= 316+ 100&& y ==248 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=315 + 100 &&  x<=317+ 100  && y >=246  && y<=247 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=316 + 100 &&  x<=318 + 100 && y >=244  && y<=245 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 317 + 100&&  x<=318 + 100 && y >=242  && y<=243 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 318+ 100 &&  x<=320 + 100 && y >=240  && y<=243 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if(x>=321+ 100 && x<=323+ 100 && y>=240 && y<=243 && seg1[15]==1  ) //seg16
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 + 100&& x<=324+ 100 && y>=242 && y<=243 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323+ 100 && x<=325+ 100 && y>=244 && y<=245 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=324 + 100&& x<=326 + 100&& y>=246 && y<=247 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325+ 100 && x<=326+ 100 && y==248 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 + 100&& x<=327+ 100 && y>=249 && y<=250 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=326+ 100 && x<=328 + 100&& y>= 251&& y<=252 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327+ 100 && x<=328 + 100&& y==253 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>= 327+ 100 && x<=329+ 100 && y>=254 && y<=255 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328+ 100 && x<=329+ 100 && y==256 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328 + 100&& x<=330+ 100 && y==257 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 + 100&& x<=330+ 100 && y==258 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 + 100&& x<=331+ 100 && y>=259 && y<=260 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330 + 100&& x<=331+ 100 && y== 261 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330+ 100 && x<=332+ 100 && y==262 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331+ 100 && x<=332+ 100 && y==263 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331+ 100 && x<=333+ 100 && y>=264 && y<=265 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332+ 100 && x<=333+ 100 && y==266 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332+ 100 && x<=334+ 100 && y==267  && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333+ 100 && x<=334+ 100 && y==268 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333+ 100 && x<=335+ 100 && y>=269 && y<=270 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 + 100&& x<=335 + 100&& y==271 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334+ 100 && x<=336+ 100 && y==272 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335+ 100 && x<=336+ 100 && y==273 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335 + 100&& x<=337+ 100 && y>=274 && y<=275 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336+ 100 && x<=337 + 100&& y==276 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336+ 100 && x<=338 + 100&& y==277 && seg1[15]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337+ 100 && x<=338+ 100 && y==278  && seg1[15]== 1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337+ 100 && x<=339+ 100 && y>=279 && y<=280 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338+ 100 && x<=339+ 100 && y==281 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338+ 100 && x<=340+ 100 && y==282 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339 + 100&& x<=340 + 100&& y>=283 && y<=284 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339+ 100 && x<=341+ 100 && y==285 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=340+ 100 && x<=341+ 100 && y==286 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=340 + 100&& x<=342 + 100&& y==287 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 + 100&& x<=342+ 100 && y>=288 && y<=289 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341+ 100 && x<=343+ 100 && y== 290 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 + 100&& x<=343+ 100 && y==291 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 + 100&& x<=344 + 100&& y==292 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 + 100&& x<=344+ 100 && y>=293 && y<=294 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343+ 100 && x<=345+ 100 && y== 295 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=344+ 100 && x<=345+ 100 && y==296 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=344 + 100&& x<=346+ 100 && y==297 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=346+100 && x<=348 +100 && y>=298 && y<=301 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if( x >= 291 - 100 && x <= 320 - 100 && y >= 176 && y <= 179 && segQ[0] == 1)
                begin
                //if(segQ[0] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 - 100 && x <= 350 - 100 && y >= 176 && y <= 179 && segQ[1] == 1)
                begin
                //if(segQ[1] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 347 - 100 && x <= 350 - 100 && y >= 180 && y <= 239 && segQ[2] == 1)
                begin
                //if(segQ[2] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 347 - 100 && x <= 350 - 100 && y >= 240 && y <= 299 && segQ[3] == 1)
                begin
                //if(segQ[3] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 - 100 && x <= 350 - 100 && y >= 300 && y <= 303 && segQ[4] == 1)
                begin
                //if(segQ[4] == 1)
                vga_next = 12'h000;
                end
            else if( x >= 291 - 100 && x <= 320 - 100 && y >= 300 && y <= 303 && segQ[5] == 1)
                begin
                //if(segQ[5] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 - 100 && x <= 294 - 100 && y >= 240 && y <= 299 && segQ[6] == 1)
                begin
                //if(segQ[6] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 - 100 && x <= 294 - 100 && y >= 180 && y <= 239 && segQ[7] == 1)
                begin
                //if(segQ[7] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 - 100 && x <= 320 - 100 && y >= 238 && y <= 241 && segQ[8] == 1)
                begin
                //if(segQ[8] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 - 100 && x <= 350 - 100 && y >= 238 && y <= 241 && segQ[9] == 1)
                begin
                //if(segQ[9] == 1)
               vga_next = 12'h000;
                end
            else if(x >= 319 - 100 && x <= 322 - 100 && y >= 180 && y <= 239 && segQ[10] == 1)
                begin
                //if(segQ[10] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 319 - 100 && x <= 322 - 100 && y >= 240 && y <= 299 && segQ[11] == 1)
                begin
                //if(segQ[11] == 1)
                vga_next = 12'h000;
                end
            else if(x>=293- 100 && x<=295 - 100&& y>=179 && y<=181 && segQ[12]==1  ) //segQ3
                begin
                vga_next = 12'h000;
                end
            else if(x>=295 - 100&& x<=296 - 100&& y>=180 && y<=181 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=295 - 100&& x<=297- 100 && y>=182 && y<=183 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=296- 100 && x<=298 - 100&& y>=184 && y<=185 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=297- 100 && x<=298- 100 && y==186 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=297- 100 && x<=299- 100 && y>=187 && y<=188 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=298- 100 && x<=300- 100 && y>=189 && y<=190 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=299- 100 && x<=300- 100 && y==191 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=299- 100 && x<=301- 100 && y>=192 && y<=193 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=300- 100 && x<=302- 100 && y>=194 && y<=195 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=301- 100 && x<=302- 100 && y==196 && segQ[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=301- 100 && x<=303- 100 && y>=197 && y<=198 && segQ[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=302- 100 && x<=304- 100 && y>=199 && y<=200 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=303- 100 && x<=304- 100 && y==201 && segQ[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=303- 100 && x<=305- 100 && y>=202 && y<=203 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=304- 100 && x<=306- 100 && y>=204 && y<=205 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if( x>=305- 100 && x<=306- 100 && y==206 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=305- 100 && x<=307 - 100&& y>=207 && y<=208 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=306- 100 && x<=308- 100 && y>=209 && y<=210 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=307- 100 && x<=308- 100 && y==211 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=307- 100 && x<=309- 100 && y>=212 && y<=213 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=308- 100 && x<=310- 100 && y>=214 && y<=215 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=309- 100 && x<=310- 100 && y==216  && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=309- 100 && x<=311- 100 && y>=217 && y<=218 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=310- 100 && x<=312- 100 && y>=219 && y<= 220 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=311- 100 && x<=312- 100 && y>=221 && y<=222 && segQ[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=311- 100 && x<=313- 100 && y>=222 && y<=223 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=312- 100 && x<=314- 100 && y>=224 && y<=225 && segQ[12]==1  )
                begin 
                vga_next = 12'h000;
                end
            else if(x>=313- 100 && x<=314- 100 && y==226 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=313- 100 && x<=315- 100 && y>=227 && y<=228 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=314- 100 && x<=316- 100 && y>=229 && y<=230 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=315- 100 && x<=316- 100 && y==231 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=315- 100 && x<=317- 100 && y>=232 && y<=233 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=316- 100 && x<=318- 100 && y>=234 && y<=235 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=318- 100 && x<=320- 100 && y>=236 && y<= 239 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=317- 100 && x<=318- 100 && y>=236 && y<= 237 && segQ[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if( x >= 346- 100 && x <= 348- 100 && y >= 179 && y <= 181 && segQ[13] == 1) //segQ4
                begin
                vga_next = 12'h000;
                end
            else if( x >= 345- 100 && x <= 346- 100 && y >= 180 && y <= 181 && segQ[13] == 1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=344- 100 && x<=346 - 100&& y>=182 && y<=183 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343- 100 && x<=345 - 100&& y>=184 && y<=185 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 - 100&& x<=344- 100 && y==186 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 - 100&& x<=344- 100 && y>= 187 && y<=188 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 - 100&& x<= 343- 100 && y>=189 && y<=190 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 - 100&& x<=342- 100&& y==191 && segQ[13]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>= 340- 100&& x<=342- 100 && y>=192 && y<=193 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339- 100 && x<=341- 100 && y>=194 && y<=195 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339- 100 && x<=340- 100 && y==196 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338- 100 && x<=340- 100 && y>=197 && y<=198 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337 - 100&& x<=339 - 100&& y>=199 && y<=200 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337- 100 && x<=338- 100 && y==201 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336- 100 && x<=338- 100 && y>=202 && y<=203 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335- 100 && x<=337- 100 && y>=204 && y<=205 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335- 100 && x<=336- 100 && y==206 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 - 100&& x<=336- 100 && y>=207 && y<=208 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333- 100 && x<=335- 100 && y>=209 && y<=210 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333- 100 && x<=334 - 100&& y==211 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332- 100 && x<=334 - 100&& y>=212 && y<=213 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331- 100 && x<=333- 100 && y>=214 && y<=215 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331 - 100&& x<=332- 100 && y== 216 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330- 100 && x<=332- 100 && y>=217 && y<=218 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329- 100 && x<=331- 100 && y>=219 && y<=220 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329- 100 && x<=330- 100 && y==221 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328- 100 && x<=330 - 100&& y>=222 && y<=223 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 - 100&& x<=329- 100 && y>=224 && y<=225 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 - 100&& x<=328- 100 && y== 226 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=326- 100 && x<=328- 100 && y>=227 && y<=228 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 - 100&& x<=327 - 100&& y>=229 && y<=230 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 - 100&& x<=326- 100 && y==231 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=324 - 100&& x<=326- 100 && y>=232 && y<=233 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323- 100 && x<=325- 100 && y>=234 && y<=235 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 - 100&& x<=324 - 100&& y>=236 && y<=237 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=321- 100 && x<=323- 100 && y>=236 && y<=239 && segQ[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if (x  >= 293- 100 &&  x<= 295- 100 && y>= 298 && y<= 301 && segQ[14]==1 )  //segQ5
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 295 - 100&&  x<= 296- 100 && y>= 298 && y<= 299 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 295 - 100&&  x<= 297- 100 && y>= 296 && y<= 297 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 296- 100 &&  x<= 298- 100 && y>= 294 && y<= 295 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 297- 100 &&  x<= 298 - 100&& y == 293 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 297 - 100&&  x<= 299- 100 && y >= 291 && y<= 292 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 298 - 100&&  x<= 300- 100 && y >= 289 && y<= 290 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 299 - 100&&  x<= 300- 100 && y == 288 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 299- 100 &&  x<= 301 - 100&& y >= 286 && y<= 287 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 300- 100 &&  x<= 302- 100 && y >= 284 && y<= 285 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 301 - 100&&  x<= 302- 100 && y == 283 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 301 - 100&&  x<= 303 - 100&& y >= 281 && y<= 282 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 302 - 100&&  x<= 304- 100 && y >= 279 && y<= 280 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 303 - 100&&  x<= 304 - 100&& y == 278 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 303 - 100&&  x<= 305 - 100&& y >= 276 && y<= 277 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 304 - 100&&  x<=306 - 100 && y >=274  && y<=275 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=305 - 100 &&  x<=306 - 100 && y ==273 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=305 - 100 &&  x<=307 - 100 && y >=271  && y<=272 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=306 - 100 &&  x<=308 - 100 && y >=269  && y<=270 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=307 - 100 &&  x<=308 - 100 && y ==268 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=307 - 100 &&  x<=309 - 100 && y >=266  && y<=267 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=308 - 100 &&  x<=310 - 100 && y >=264  && y<=265 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=309 - 100 &&  x<=310 - 100 && y == 263 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=309- 100  &&  x<=311 - 100 && y >=261  && y<=262 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=310 - 100 &&  x<=312 - 100 && y >=259  && y<=260 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 311 - 100&&  x<=312 - 100 && y ==258 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=311 - 100 &&  x<=313 - 100 && y >=256  && y<=257 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=312 - 100 &&  x<=314 - 100 && y >=254  && y<=255 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=313 - 100 &&  x<=314 - 100 && y ==253  && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 313 - 100&&  x<=315 - 100 && y >=251  && y<=252 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=314 - 100 &&  x<=316 - 100 && y >=249  && y<=250 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=315- 100 &&  x<= 316- 100&& y ==248 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=315 - 100 &&  x<=317- 100  && y >=246  && y<=247 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=316 - 100 &&  x<=318 - 100 && y >=244  && y<=245 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 317 - 100&&  x<=318 - 100 && y >=242  && y<=243 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 318- 100 &&  x<=320 - 100 && y >=240  && y<=243 && segQ[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if(x>=321- 100 && x<=323- 100 && y>=240 && y<=243 && segQ[15]==1  ) //segQ6
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 - 100&& x<=324- 100 && y>=242 && y<=243 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323- 100 && x<=325- 100 && y>=244 && y<=245 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=324 - 100&& x<=326 - 100&& y>=246 && y<=247 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325- 100 && x<=326- 100 && y==248 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 - 100&& x<=327- 100 && y>=249 && y<=250 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=326- 100 && x<=328 - 100&& y>= 251&& y<=252 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327- 100 && x<=328 - 100&& y==253 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>= 327- 100 && x<=329- 100 && y>=254 && y<=255 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328- 100 && x<=329- 100 && y==256 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328 - 100&& x<=330- 100 && y==257 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 - 100&& x<=330- 100 && y==258 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 - 100&& x<=331- 100 && y>=259 && y<=260 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330 - 100&& x<=331- 100 && y== 261 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330- 100 && x<=332- 100 && y==262 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331- 100 && x<=332- 100 && y==263 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331- 100 && x<=333- 100 && y>=264 && y<=265 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332- 100 && x<=333- 100 && y==266 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332- 100 && x<=334- 100 && y==267  && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333- 100 && x<=334- 100 && y==268 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333- 100 && x<=335- 100 && y>=269 && y<=270 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 - 100&& x<=335 - 100&& y==271 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334- 100 && x<=336- 100 && y==272 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335- 100 && x<=336- 100 && y==273 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335 - 100&& x<=337- 100 && y>=274 && y<=275 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336- 100 && x<=337 - 100&& y==276 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336- 100 && x<=338 - 100&& y==277 && segQ[15]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337- 100 && x<=338- 100 && y==278  && segQ[15]== 1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337- 100 && x<=339- 100 && y>=279 && y<=280 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338- 100 && x<=339- 100 && y==281 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338- 100 && x<=340- 100 && y==282 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339 - 100&& x<=340 - 100&& y>=283 && y<=284 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339- 100 && x<=341- 100 && y==285 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=340- 100 && x<=341- 100 && y==286 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=340 - 100&& x<=342 - 100&& y==287 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 - 100&& x<=342- 100 && y>=288 && y<=289 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341- 100 && x<=343- 100 && y== 290 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 - 100&& x<=343- 100 && y==291 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 - 100&& x<=344 - 100&& y==292 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 - 100&& x<=344- 100 && y>=293 && y<=294 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343- 100 && x<=345- 100 && y== 295 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=344- 100 && x<=345- 100 && y==296 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=344 - 100&& x<=346- 100 && y==297 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=346- 100 && x<=348 - 100&& y>=298 && y<=301 && segQ[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else
                vga_next = 12'hFFF;
            end
        else
           vga_next = 12'h03F;
        end
   
    always@(posedge clk)
        begin
        if( pixel_tick)
            vga_reg <= vga_next;
        end
        
    assign vga = vga_reg;
    //displaying(clk,seg,video_on,p_tick,x,y,vga);
       
    //fon add 
    //vga_sync vga_sync_unit (.clk(clk), .reset(clear), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(p_tick), .x(x), .y(y));
endmodule
