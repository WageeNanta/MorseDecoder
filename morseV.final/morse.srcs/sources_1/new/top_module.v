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
    output [11:0]vga
    );

    wire clock;
    wire [1:0] typeValue;
    wire [5:0] temp_letter; 
    wire newLetter;
    //wire [2:0]led;
    //wire [15:0]led1; 
    wire [9:0]x,y;
    wire video_on, pixel_tick;
    reg [11:0]vga_reg,vga_next;
    wire [15:0]seg1;

   
       divide(clk,clock);
       //input_morse(clock,t17,w19,typeValue);
      // type_state(clk,clear,clock,t17,w19,typeValue,led[2:0]);
       type_state2(clock,clear,t17,w19,typeValue,led);
       state_traversal(clear,clock,typeValue,temp_letter,newLetter);
       //vga_sync(clk,clear,hsync,vsync,video_on, p_tick, x, y);
       translator(newLetter, temp_letter, clock,seg1,seg);
       
       vga_sync vga_sync_unit (.clk(clk), .reset(clear), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(pixel_tick), .x(x), .y(y));
       
       always@(posedge clk)
        begin
        //vga_next = 1;
        if(video_on)
            begin
            if( x >= 291 && x <= 320 && y >= 176 && y <= 179 && seg1[0] == 1)
                begin
                //if(seg1[0] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 && x <= 350 && y >= 176 && y <= 179 && seg1[1] == 1)
                begin
                //if(seg1[1] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 347 && x <= 350 && y >= 180 && y <= 239 && seg1[2] == 1)
                begin
                //if(seg1[2] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 347 && x <= 350 && y >= 240 && y <= 299 && seg1[3] == 1)
                begin
                //if(seg1[3] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 && x <= 350 && y >= 300 && y <= 303 && seg1[4] == 1)
                begin
                //if(seg1[4] == 1)
                vga_next = 12'h000;
                end
            else if( x >= 291 && x <= 320 && y >= 300 && y <= 303 && seg1[5] == 1)
                begin
                //if(seg1[5] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 && x <= 294  && y >= 240 && y <= 299 && seg1[6] == 1)
                begin
                //if(seg1[6] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 && x <= 294 && y >= 180 && y <= 239 && seg1[7] == 1)
                begin
                //if(seg1[7] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 291 && x <= 320 && y >= 238 && y <= 241 && seg1[8] == 1)
                begin
                //if(seg1[8] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 321 && x <= 350 && y >= 238 && y <= 241 && seg1[9] == 1)
                begin
                //if(seg1[9] == 1)
               vga_next = 12'h000;
                end
            else if(x >= 319 && x <= 322 && y >= 180 && y <= 239 && seg1[10] == 1)
                begin
                //if(seg1[10] == 1)
                vga_next = 12'h000;
                end
            else if(x >= 319 && x <= 322 && y >= 240 && y <= 299 && seg1[11] == 1)
                begin
                //if(seg1[11] == 1)
                vga_next = 12'h000;
                end
            else if(x>=293 && x<=295 && y>=179 && y<=181 && seg1[12]==1  ) //seg13
                begin
                vga_next = 12'h000;
                end
            else if(x>=295 && x<=296 && y>=180 && y<=181 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=295 && x<=297 && y>=182 && y<=183 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=296 && x<=298 && y>=184 && y<=185 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=297 && x<=298 && y==186 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=297 && x<=299 && y>=187 && y<=188 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=298 && x<=300 && y>=189 && y<=190 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=299 && x<=300 && y==191 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=299 && x<=301 && y>=192 && y<=193 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=300 && x<=302 && y>=194 && y<=195 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=301 && x<=302 && y==196 && seg1[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=301 && x<=303 && y>=197 && y<=198 && seg1[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=302 && x<=304 && y>=199 && y<=200 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=303 && x<=304 && y==201 && seg1[12]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=303 && x<=305 && y>=202 && y<=203 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=304 && x<=306 && y>=204 && y<=205 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if( x>=305 && x<=306 && y==206 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=305 && x<=307 && y>=207 && y<=208 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=306 && x<=308 && y>=209 && y<=210 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=307 && x<=308 && y==211 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=307 && x<=309 && y>=212 && y<=213 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=308 && x<=310 && y>=214 && y<=215 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=309 && x<=310 && y==216  && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=309 && x<=311 && y>=217 && y<=218 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=310 && x<=312 && y>=219 && y<= 220 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=311 && x<=312 && y>=221 && y<=222 && seg1[12]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=311 && x<=313 && y>=222 && y<=223 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=312 && x<=314 && y>=224 && y<=225 && seg1[12]==1  )
                begin 
                vga_next = 12'h000;
                end
            else if(x>=313 && x<=314 && y==226 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=313 && x<=315 && y>=227 && y<=228 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=314 && x<=316 && y>=229 && y<=230 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=315 && x<=316 && y==231 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=315 && x<=317 && y>=232 && y<=233 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=316 && x<=318 && y>=234 && y<=235 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=318 && x<=320 && y>=236 && y<= 239 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=317 && x<=318 && y>=236 && y<= 237 && seg1[12]==1  )
                begin
                vga_next = 12'h000;
                end
            else if( x >= 346 && x <= 348 && y >= 179 && y <= 181 && seg1[13] == 1) //seg14
                begin
                vga_next = 12'h000;
                end
            else if( x >= 345 && x <= 346 && y >= 180 && y <= 181 && seg1[13] == 1)
                begin
                vga_next = 12'h000;
                end
            else if(x>=344 && x<=346 && y>=182 && y<=183 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 && x<=345 && y>=184 && y<=185 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 && x<=344 && y==186 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 && x<=344 && y>= 187 && y<=188 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 && x<= 343 && y>=189 && y<=190 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 && x<=342 && y==191 && seg1[13]==1)
                begin
                vga_next = 12'h000;
                end
            else if(x>= 340&& x<=342 && y>=192 && y<=193 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339 && x<=341 && y>=194 && y<=195 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339 && x<=340 && y==196 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338 && x<=340 && y>=197 && y<=198 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337 && x<=339 && y>=199 && y<=200 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337 && x<=338 && y==201 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336 && x<=338 && y>=202 && y<=203 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335 && x<=337 && y>=204 && y<=205 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335 && x<=336 && y==206 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 && x<=336 && y>=207 && y<=208 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333 && x<=335 && y>=209 && y<=210 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333 && x<=334 && y==211 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332 && x<=334 && y>=212 && y<=213 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331 && x<=333 && y>=214 && y<=215 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331 && x<=332 && y== 216 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330 && x<=332 && y>=217 && y<=218 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 && x<=331 && y>=219 && y<=220 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 && x<=330 && y==221 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328 && x<=330 && y>=222 && y<=223 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 && x<=329 && y>=224 && y<=225 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 && x<=328 && y== 226 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=326 && x<=328 && y>=227 && y<=228 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 && x<=327 && y>=229 && y<=230 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 && x<=326 && y==231 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=324 && x<=326 && y>=232 && y<=233 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 && x<=325 && y>=234 && y<=235 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 && x<=324 && y>=236 && y<=237 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=321 && x<=323 && y>=236 && y<=239 && seg1[13]==1 )
                begin
                vga_next = 12'h000;
                end
            else if (x  >= 293 &&  x<= 295 && y>= 298 && y<= 301 && seg1[14]==1 )  //seg15
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 295 &&  x<= 296 && y>= 298 && y<= 299 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 295 &&  x<= 297 && y>= 296 && y<= 297 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 296 &&  x<= 298 && y>= 294 && y<= 295 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 297 &&  x<= 298 && y == 293 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 297 &&  x<= 299 && y >= 291 && y<= 292 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 298 &&  x<= 300 && y >= 289 && y<= 290 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 299 &&  x<= 300 && y == 288 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 299 &&  x<= 301 && y >= 286 && y<= 287 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 300 &&  x<= 302 && y >= 284 && y<= 285 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 301 &&  x<= 302 && y == 283 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 301 &&  x<= 303 && y >= 281 && y<= 282 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 302 &&  x<= 304 && y >= 279 && y<= 280 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 303 &&  x<= 304 && y == 278 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 303 &&  x<= 305 && y >= 276 && y<= 277 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 304 &&  x<=306  && y >=274  && y<=275 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=305  &&  x<=306  && y ==273 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=305  &&  x<=307  && y >=271  && y<=272 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=306  &&  x<=308  && y >=269  && y<=270 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=307  &&  x<=308  && y ==268 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=307  &&  x<=309  && y >=266  && y<=267 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=308  &&  x<=310  && y >=264  && y<=265 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=309  &&  x<=310  && y == 263 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=309  &&  x<=311  && y >=261  && y<=262 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=310  &&  x<=312  && y >=259  && y<=260 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 311 &&  x<=312  && y ==258 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=311  &&  x<=313  && y >=256  && y<=257 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=312  &&  x<=314  && y >=254  && y<=255 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=313  &&  x<=314  && y ==253  && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 313 &&  x<=315  && y >=251  && y<=252 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=314  &&  x<=316  && y >=249  && y<=250 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=315  &&  x<= 316 && y ==248 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=315  &&  x<=317  && y >=246  && y<=247 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >=316  &&  x<=318  && y >=244  && y<=245 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 317 &&  x<=318  && y >=242  && y<=243 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if (x  >= 318 &&  x<=320  && y >=240  && y<=243 && seg1[14]==1 )
                begin
                vga_next = 12'h000; 
                end
            else if(x>=321 && x<=323 && y>=240 && y<=243 && seg1[15]==1  ) //seg16
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 && x<=324 && y>=242 && y<=243 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=323 && x<=325 && y>=244 && y<=245 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=324 && x<=326 && y>=246 && y<=247 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 && x<=326 && y==248 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=325 && x<=327 && y>=249 && y<=250 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=326 && x<=328 && y>= 251&& y<=252 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=327 && x<=328 && y==253 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>= 327 && x<=329 && y>=254 && y<=255 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328 && x<=329 && y==256 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=328 && x<=330 && y==257 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 && x<=330 && y==258 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=329 && x<=331 && y>=259 && y<=260 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330 && x<=331 && y== 261 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=330 && x<=332 && y==262 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331 && x<=332 && y==263 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=331 && x<=333 && y>=264 && y<=265 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332 && x<=333 && y==266 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=332 && x<=334 && y==267  && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333 && x<=334 && y==268 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=333 && x<=335 && y>=269 && y<=270 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 && x<=335 && y==271 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=334 && x<=336 && y==272 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335 && x<=336 && y==273 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=335 && x<=337 && y>=274 && y<=275 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336 && x<=337 && y==276 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=336 && x<=338 && y==277 && seg1[15]==1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337 && x<=338 && y==278  && seg1[15]== 1 )
                begin
                vga_next = 12'h000;
                end
            else if(x>=337 && x<=339 && y>=279 && y<=280 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338 && x<=339 && y==281 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=338 && x<=340 && y==282 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339 && x<=340 && y>=283 && y<=284 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=339 && x<=341 && y==285 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=340 && x<=341 && y==286 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=340 && x<=342 && y==287 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 && x<=342 && y>=288 && y<=289 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=341 && x<=343 && y== 290 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 && x<=343 && y==291 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=342 && x<=344 && y==292 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 && x<=344 && y>=293 && y<=294 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=343 && x<=345 && y== 295 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=344 && x<=345 && y==296 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=344 && x<=346 && y==297 && seg1[15]==1  )
                begin
                vga_next = 12'h000;
                end
            else if(x>=346 && x<=348 && y>=298 && y<=301 && seg1[15]==1  )
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
