dtmc
const st1 = 0;
const st_B1 = 5;
const st2 = 34;
const st_B2 = 86;
const st3 = 133;
const st_B3 = 158;
const st4 = 148;
const st_B4 = 206;
const alpha = 2;

module timer
 t : [0..720];
 [tick] t < 720 -> (t' = t + 1);
 [tick] t = 720 -> (t' = t);
endmodule

module train_A1
 loc1 : [0..720] init 0;
 delay1 : [0..1250];
 dl1 : [0..1250] init 0;
 dwl_1 : [0..2] init 0;
 [tick] t <= st1 & loc1 = 0 -> (delay1' = 0);
 [tick] t >= st1 & loc1 = 0 & cond_R1   -> (loc1' = 1);
 [tick] t >= st1 & loc1 = 0 & !cond_R1   -> (dl1' = min(dl1 + 1 , 1250));

 [tick] loc1 >= 1 & loc1 < 15 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 1 & loc1 < 15 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 15 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 15 & dwl_1 = 2 & cond_R2 -> (loc1' = 16) & (dwl_1' = 0);
 [tick] loc1 = 15 & dwl_1 = 2 & !cond_R2   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 16 & loc1 < 39 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 16 & loc1 < 39 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 39 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 39 & dwl_1 = 2 & cond_R3 -> (loc1' = 40) & (dwl_1' = 0);
 [tick] loc1 = 39 & dwl_1 = 2 & !cond_R3   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 40 & loc1 < 54 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 40 & loc1 < 54 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 54 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 54 & dwl_1 = 2 & cond_R4 -> (loc1' = 55) & (dwl_1' = 0);
 [tick] loc1 = 54 & dwl_1 = 2 & !cond_R4   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 55 & loc1 < 87 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 55 & loc1 < 87 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 87 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 87 & dwl_1 = 2 & cond_R5 -> (loc1' = 88) & (dwl_1' = 0);
 [tick] loc1 = 87 & dwl_1 = 2 & !cond_R5   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 88 & loc1 < 111 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 88 & loc1 < 111 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 111 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 111 & dwl_1 = 2 & cond_R6 -> (loc1' = 112) & (dwl_1' = 0);
 [tick] loc1 = 111 & dwl_1 = 2 & !cond_R6   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 112 & loc1 < 131 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 112 & loc1 < 131 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 131 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 131 & dwl_1 = 2 & cond_R7 -> (loc1' = 132) & (dwl_1' = 0);
 [tick] loc1 = 131 & dwl_1 = 2 & !cond_R7   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 132 & loc1 < 149 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 132 & loc1 < 149 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 149 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 149 & dwl_1 = 2 & cond_R8 -> (loc1' = 150) & (dwl_1' = 0);
 [tick] loc1 = 149 & dwl_1 = 2 & !cond_R8   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 150 & loc1 < 182 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 150 & loc1 < 182 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 182 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 182 & dwl_1 = 2 & cond_R9 -> (loc1' = 183) & (dwl_1' = 0);
 [tick] loc1 = 182 & dwl_1 = 2 & !cond_R9   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 183 & loc1 < 210 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 183 & loc1 < 210 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 210 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 210 & dwl_1 = 2 & cond_R10 -> (loc1' = 211) & (dwl_1' = 0);
 [tick] loc1 = 210 & dwl_1 = 2 & !cond_R10   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 211 & loc1 < 238 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 211 & loc1 < 238 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 238 & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);
 [tick] loc1 = 238 & dwl_1 = 2 & cond_R11 -> (loc1' = 239) & (dwl_1' = 0);
 [tick] loc1 = 238 & dwl_1 = 2 & !cond_R11   -> (dl1' = min(dl1 + 1 , 1250)); 

 [tick] loc1 >= 239 & loc1 < 250 & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);
 [tick] loc1 >= 239 & loc1 < 250 & delay1 = 1250 -> (loc1' = loc1 + 1);
 [tick] loc1 = 250 -> (loc1' = 250);
endmodule

module train_A2
 loc2 : [0..720] init 0;
 delay2 : [0..1250];
 dl2 : [0..1250];
 dwl_2 : [0..2];
 [tick] t < st2 & loc2 = 0 -> (delay2' = 0);
 [tick] t >= st2 & loc2 = 0 & loc1 > 1 & cond_R1 -> (loc2' = 1);
 [tick] t >= st2 & loc2 = 0 & (loc1 <= 1 | !cond_R1) -> (loc2' = 0);

 [tick] loc2 >= 1 & loc2 < 14 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 1 & loc2 < 14 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 1 & loc2 < 14 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 1 & loc2 < 14 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 15 & loc2 = 14 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 15 & loc2 = 14 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 15 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 16 & loc2 = 15 & dwl_2 = 2 & cond_R2 -> (loc2' = 16) & (dwl_2' = 0);
 [tick] (loc1 <= 16 | !cond_R2) & dwl_2 = 2 & loc2 = 15 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 16 & loc2 < 38 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 16 & loc2 < 38 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 16 & loc2 < 38 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 16 & loc2 < 38 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 39 & loc2 = 38 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 39 & loc2 = 38 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 39 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 40 & loc2 = 39 & dwl_2 = 2 & cond_R3 -> (loc2' = 40) & (dwl_2' = 0);
 [tick] (loc1 <= 40 | !cond_R3) & dwl_2 = 2 & loc2 = 39 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 40 & loc2 < 53 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 40 & loc2 < 53 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 40 & loc2 < 53 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 40 & loc2 < 53 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 54 & loc2 = 53 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 54 & loc2 = 53 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 54 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 55 & loc2 = 54 & dwl_2 = 2 & cond_R4 -> (loc2' = 55) & (dwl_2' = 0);
 [tick] (loc1 <= 55 | !cond_R4) & dwl_2 = 2 & loc2 = 54 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 55 & loc2 < 86 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 55 & loc2 < 86 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 55 & loc2 < 86 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 55 & loc2 < 86 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 87 & loc2 = 86 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 87 & loc2 = 86 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 87 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 88 & loc2 = 87 & dwl_2 = 2 & cond_R5 -> (loc2' = 88) & (dwl_2' = 0);
 [tick] (loc1 <= 88 | !cond_R5) & dwl_2 = 2 & loc2 = 87 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 88 & loc2 < 110 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 88 & loc2 < 110 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 88 & loc2 < 110 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 88 & loc2 < 110 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 111 & loc2 = 110 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 111 & loc2 = 110 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 111 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 112 & loc2 = 111 & dwl_2 = 2 & cond_R6 -> (loc2' = 112) & (dwl_2' = 0);
 [tick] (loc1 <= 112 | !cond_R6) & dwl_2 = 2 & loc2 = 111 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 112 & loc2 < 130 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 112 & loc2 < 130 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 112 & loc2 < 130 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 112 & loc2 < 130 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 131 & loc2 = 130 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 131 & loc2 = 130 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 131 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 132 & loc2 = 131 & dwl_2 = 2 & cond_R7 -> (loc2' = 132) & (dwl_2' = 0);
 [tick] (loc1 <= 132 | !cond_R7) & dwl_2 = 2 & loc2 = 131 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 132 & loc2 < 148 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 132 & loc2 < 148 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 132 & loc2 < 148 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 132 & loc2 < 148 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 149 & loc2 = 148 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 149 & loc2 = 148 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 149 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 150 & loc2 = 149 & dwl_2 = 2 & cond_R8 -> (loc2' = 150) & (dwl_2' = 0);
 [tick] (loc1 <= 150 | !cond_R8) & dwl_2 = 2 & loc2 = 149 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 150 & loc2 < 181 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 150 & loc2 < 181 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 150 & loc2 < 181 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 150 & loc2 < 181 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 182 & loc2 = 181 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 182 & loc2 = 181 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 182 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 183 & loc2 = 182 & dwl_2 = 2 & cond_R9 -> (loc2' = 183) & (dwl_2' = 0);
 [tick] (loc1 <= 183 | !cond_R9) & dwl_2 = 2 & loc2 = 182 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 183 & loc2 < 209 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 183 & loc2 < 209 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 183 & loc2 < 209 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 183 & loc2 < 209 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 210 & loc2 = 209 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 210 & loc2 = 209 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 210 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 211 & loc2 = 210 & dwl_2 = 2 & cond_R10 -> (loc2' = 211) & (dwl_2' = 0);
 [tick] (loc1 <= 211 | !cond_R10) & dwl_2 = 2 & loc2 = 210 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 211 & loc2 < 237 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 211 & loc2 < 237 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 < 1250 -> (dl2' = dl2 + 1);
 [tick] loc2 >= 211 & loc2 < 237 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 = 1250 -> (dl2' = dl2);
 [tick] loc2 >= 211 & loc2 < 237 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 238 & loc2 = 237 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 238 & loc2 = 237 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 238 & dwl_2 < 2 -> (dwl_2' = dwl_2 + 1);
 [tick] loc1 > 239 & loc2 = 238 & dwl_2 = 2 & cond_R11 -> (loc2' = 239) & (dwl_2' = 0);
 [tick] (loc1 <= 239 | !cond_R11) & dwl_2 = 2 & loc2 = 238 & dl2 <= 1250 -> (dl2' = min(1250,dl2+1));

 [tick] loc2 >= 239 & loc2 < 249 & loc1-loc2 >= 2 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc2 >= 239 & loc2 < 249 & loc1-loc2 < 2 & delay2 <= 1250 & dl2 <= 1250 -> (dl2' = min(1250, dl2 + 1));
 [tick] loc2 >= 239 & loc2 < 249 & loc1-loc2 >= 2 & delay2 = 1250 -> (loc2' = loc2+1);
 [tick] loc1 >= 250 & loc2 = 249 & delay2 < 1250 -> (1 - alpha/100):(loc2' = loc2 + 1) + alpha/100:(delay2' = delay2+1);
 [tick] loc1 >= 250 & loc2 = 249 & delay2 = 1250 -> (loc2' = loc2 + 1);
 [tick] loc2 = 250 -> (loc2' = loc2);
endmodule


module train_A3
 loc3 : [0..720] init 0;
 delay3 : [0..1250];
 dl3 : [0..1250];
 dwl_3 : [0..2];
 [tick] t < st3 & loc3 = 0 -> (delay3' = 0);
 [tick] t >= st3 & loc3 = 0 & loc2 > 1 & cond_R1 -> (loc3' = 1);
 [tick] t >= st3 & loc3 = 0 & (loc2 <= 1 | !cond_R1) -> (loc3' = 0);

 [tick] loc3 >= 1 & loc3 < 14 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 1 & loc3 < 14 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 1 & loc3 < 14 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 1 & loc3 < 14 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 15 & loc3 = 14 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 15 & loc3 = 14 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 15 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 16 & loc3 = 15 & dwl_3 = 2 & cond_R2 -> (loc3' = 16) & (dwl_3' = 0);
 [tick] (loc2 <= 16 | !cond_R2) & dwl_3 = 2 & loc3 = 15 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 16 & loc3 < 38 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 16 & loc3 < 38 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 16 & loc3 < 38 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 16 & loc3 < 38 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 39 & loc3 = 38 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 39 & loc3 = 38 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 39 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 40 & loc3 = 39 & dwl_3 = 2 & cond_R3 -> (loc3' = 40) & (dwl_3' = 0);
 [tick] (loc2 <= 40 | !cond_R3) & dwl_3 = 2 & loc3 = 39 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 40 & loc3 < 53 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 40 & loc3 < 53 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 40 & loc3 < 53 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 40 & loc3 < 53 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 54 & loc3 = 53 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 54 & loc3 = 53 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 54 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 55 & loc3 = 54 & dwl_3 = 2 & cond_R4 -> (loc3' = 55) & (dwl_3' = 0);
 [tick] (loc2 <= 55 | !cond_R4) & dwl_3 = 2 & loc3 = 54 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 55 & loc3 < 86 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 55 & loc3 < 86 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 55 & loc3 < 86 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 55 & loc3 < 86 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 87 & loc3 = 86 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 87 & loc3 = 86 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 87 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 88 & loc3 = 87 & dwl_3 = 2 & cond_R5 -> (loc3' = 88) & (dwl_3' = 0);
 [tick] (loc2 <= 88 | !cond_R5) & dwl_3 = 2 & loc3 = 87 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 88 & loc3 < 110 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 88 & loc3 < 110 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 88 & loc3 < 110 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 88 & loc3 < 110 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 111 & loc3 = 110 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 111 & loc3 = 110 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 111 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 112 & loc3 = 111 & dwl_3 = 2 & cond_R6 -> (loc3' = 112) & (dwl_3' = 0);
 [tick] (loc2 <= 112 | !cond_R6) & dwl_3 = 2 & loc3 = 111 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 112 & loc3 < 130 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 112 & loc3 < 130 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 112 & loc3 < 130 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 112 & loc3 < 130 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 131 & loc3 = 130 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 131 & loc3 = 130 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 131 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 132 & loc3 = 131 & dwl_3 = 2 & cond_R7 -> (loc3' = 132) & (dwl_3' = 0);
 [tick] (loc2 <= 132 | !cond_R7) & dwl_3 = 2 & loc3 = 131 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 132 & loc3 < 148 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 132 & loc3 < 148 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 132 & loc3 < 148 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 132 & loc3 < 148 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 149 & loc3 = 148 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 149 & loc3 = 148 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 149 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 150 & loc3 = 149 & dwl_3 = 2 & cond_R8 -> (loc3' = 150) & (dwl_3' = 0);
 [tick] (loc2 <= 150 | !cond_R8) & dwl_3 = 2 & loc3 = 149 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 150 & loc3 < 181 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 150 & loc3 < 181 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 150 & loc3 < 181 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 150 & loc3 < 181 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 182 & loc3 = 181 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 182 & loc3 = 181 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 182 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 183 & loc3 = 182 & dwl_3 = 2 & cond_R9 -> (loc3' = 183) & (dwl_3' = 0);
 [tick] (loc2 <= 183 | !cond_R9) & dwl_3 = 2 & loc3 = 182 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 183 & loc3 < 209 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 183 & loc3 < 209 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 183 & loc3 < 209 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 183 & loc3 < 209 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 210 & loc3 = 209 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 210 & loc3 = 209 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 210 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 211 & loc3 = 210 & dwl_3 = 2 & cond_R10 -> (loc3' = 211) & (dwl_3' = 0);
 [tick] (loc2 <= 211 | !cond_R10) & dwl_3 = 2 & loc3 = 210 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 211 & loc3 < 237 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 211 & loc3 < 237 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 < 1250 -> (dl3' = dl3 + 1);
 [tick] loc3 >= 211 & loc3 < 237 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 = 1250 -> (dl3' = dl3);
 [tick] loc3 >= 211 & loc3 < 237 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 238 & loc3 = 237 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 238 & loc3 = 237 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 238 & dwl_3 < 2 -> (dwl_3' = dwl_3 + 1);
 [tick] loc2 > 239 & loc3 = 238 & dwl_3 = 2 & cond_R11 -> (loc3' = 239) & (dwl_3' = 0);
 [tick] (loc2 <= 239 | !cond_R11) & dwl_3 = 2 & loc3 = 238 & dl3 <= 1250 -> (dl3' = min(1250,dl3+1));

 [tick] loc3 >= 239 & loc3 < 249 & loc2-loc3 >= 2 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc3 >= 239 & loc3 < 249 & loc2-loc3 < 2 & delay3 <= 1250 & dl3 <= 1250 -> (dl3' = min(1250, dl3 + 1));
 [tick] loc3 >= 239 & loc3 < 249 & loc2-loc3 >= 2 & delay3 = 1250 -> (loc3' = loc3+1);
 [tick] loc2 >= 250 & loc3 = 249 & delay3 < 1250 -> (1 - alpha/100):(loc3' = loc3 + 1) + alpha/100:(delay3' = delay3+1);
 [tick] loc2 >= 250 & loc3 = 249 & delay3 = 1250 -> (loc3' = loc3 + 1);
 [tick] loc3 = 250 -> (loc3' = loc3);
endmodule


module train_A4
 loc4 : [0..720] init 0;
 delay4 : [0..1250];
 dl4 : [0..1250];
 dwl_4 : [0..2];
 [tick] t < st4 & loc4 = 0 -> (delay4' = 0);
 [tick] t >= st4 & loc4 = 0 & loc3 > 1 & cond_R1 -> (loc4' = 1);
 [tick] t >= st4 & loc4 = 0 & (loc3 <= 1 | !cond_R1) -> (loc4' = 0);

 [tick] loc4 >= 1 & loc4 < 14 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 1 & loc4 < 14 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 1 & loc4 < 14 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 1 & loc4 < 14 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 15 & loc4 = 14 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 15 & loc4 = 14 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 15 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 16 & loc4 = 15 & dwl_4 = 2 & cond_R2 -> (loc4' = 16) & (dwl_4' = 0);
 [tick] (loc3 <= 16 | !cond_R2) & dwl_4 = 2 & loc4 = 15 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 16 & loc4 < 38 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 16 & loc4 < 38 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 16 & loc4 < 38 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 16 & loc4 < 38 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 39 & loc4 = 38 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 39 & loc4 = 38 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 39 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 40 & loc4 = 39 & dwl_4 = 2 & cond_R3 -> (loc4' = 40) & (dwl_4' = 0);
 [tick] (loc3 <= 40 | !cond_R3) & dwl_4 = 2 & loc4 = 39 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 40 & loc4 < 53 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 40 & loc4 < 53 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 40 & loc4 < 53 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 40 & loc4 < 53 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 54 & loc4 = 53 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 54 & loc4 = 53 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 54 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 55 & loc4 = 54 & dwl_4 = 2 & cond_R4 -> (loc4' = 55) & (dwl_4' = 0);
 [tick] (loc3 <= 55 | !cond_R4) & dwl_4 = 2 & loc4 = 54 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 55 & loc4 < 86 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 55 & loc4 < 86 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 55 & loc4 < 86 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 55 & loc4 < 86 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 87 & loc4 = 86 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 87 & loc4 = 86 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 87 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 88 & loc4 = 87 & dwl_4 = 2 & cond_R5 -> (loc4' = 88) & (dwl_4' = 0);
 [tick] (loc3 <= 88 | !cond_R5) & dwl_4 = 2 & loc4 = 87 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 88 & loc4 < 110 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 88 & loc4 < 110 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 88 & loc4 < 110 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 88 & loc4 < 110 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 111 & loc4 = 110 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 111 & loc4 = 110 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 111 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 112 & loc4 = 111 & dwl_4 = 2 & cond_R6 -> (loc4' = 112) & (dwl_4' = 0);
 [tick] (loc3 <= 112 | !cond_R6) & dwl_4 = 2 & loc4 = 111 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 112 & loc4 < 130 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 112 & loc4 < 130 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 112 & loc4 < 130 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 112 & loc4 < 130 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 131 & loc4 = 130 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 131 & loc4 = 130 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 131 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 132 & loc4 = 131 & dwl_4 = 2 & cond_R7 -> (loc4' = 132) & (dwl_4' = 0);
 [tick] (loc3 <= 132 | !cond_R7) & dwl_4 = 2 & loc4 = 131 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 132 & loc4 < 148 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 132 & loc4 < 148 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 132 & loc4 < 148 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 132 & loc4 < 148 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 149 & loc4 = 148 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 149 & loc4 = 148 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 149 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 150 & loc4 = 149 & dwl_4 = 2 & cond_R8 -> (loc4' = 150) & (dwl_4' = 0);
 [tick] (loc3 <= 150 | !cond_R8) & dwl_4 = 2 & loc4 = 149 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 150 & loc4 < 181 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 150 & loc4 < 181 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 150 & loc4 < 181 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 150 & loc4 < 181 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 182 & loc4 = 181 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 182 & loc4 = 181 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 182 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 183 & loc4 = 182 & dwl_4 = 2 & cond_R9 -> (loc4' = 183) & (dwl_4' = 0);
 [tick] (loc3 <= 183 | !cond_R9) & dwl_4 = 2 & loc4 = 182 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 183 & loc4 < 209 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 183 & loc4 < 209 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 183 & loc4 < 209 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 183 & loc4 < 209 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 210 & loc4 = 209 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 210 & loc4 = 209 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 210 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 211 & loc4 = 210 & dwl_4 = 2 & cond_R10 -> (loc4' = 211) & (dwl_4' = 0);
 [tick] (loc3 <= 211 | !cond_R10) & dwl_4 = 2 & loc4 = 210 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 211 & loc4 < 237 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 211 & loc4 < 237 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 < 1250 -> (dl4' = dl4 + 1);
 [tick] loc4 >= 211 & loc4 < 237 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 = 1250 -> (dl4' = dl4);
 [tick] loc4 >= 211 & loc4 < 237 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 238 & loc4 = 237 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 238 & loc4 = 237 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 238 & dwl_4 < 2 -> (dwl_4' = dwl_4 + 1);
 [tick] loc3 > 239 & loc4 = 238 & dwl_4 = 2 & cond_R11 -> (loc4' = 239) & (dwl_4' = 0);
 [tick] (loc3 <= 239 | !cond_R11) & dwl_4 = 2 & loc4 = 238 & dl4 <= 1250 -> (dl4' = min(1250,dl4+1));

 [tick] loc4 >= 239 & loc4 < 249 & loc3-loc4 >= 2 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc4 >= 239 & loc4 < 249 & loc3-loc4 < 2 & delay4 <= 1250 & dl4 <= 1250 -> (dl4' = min(1250, dl4 + 1));
 [tick] loc4 >= 239 & loc4 < 249 & loc3-loc4 >= 2 & delay4 = 1250 -> (loc4' = loc4+1);
 [tick] loc3 >= 250 & loc4 = 249 & delay4 < 1250 -> (1 - alpha/100):(loc4' = loc4 + 1) + alpha/100:(delay4' = delay4+1);
 [tick] loc3 >= 250 & loc4 = 249 & delay4 = 1250 -> (loc4' = loc4 + 1);
 [tick] loc4 = 250 -> (loc4' = loc4);
endmodule

module train_B1
 loc_B1 : [0..720] init 250;
 delay_B1 : [0..1250];
 dl_B1 : [0..1250] init 0;
 dwl_B1 : [0..2] init 0;
 [tick] t < st_B1 & loc_B1 = 250 -> (delay_B1' = 0);
 [tick] t>= st_B1 & loc_B1 = 250 & cond_1 -> (loc_B1' = 250 - 1);
 [tick] t>= st_B1 & loc_B1 = 250 & !cond_1 -> (dl_B1' = min(dl_B1 + 1 , 1250));

 [tick] loc_B1 <= 249 & loc_B1 > 238 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 249 & loc_B1 > 238 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 238 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 238 & dwl_B1 = 2 & cond_2  -> (loc_B1' = 238-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 238 & dwl_B1 = 2 & !cond_2 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 237 & loc_B1 > 210 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 237 & loc_B1 > 210 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 210 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 210 & dwl_B1 = 2 & cond_3  -> (loc_B1' = 210-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 210 & dwl_B1 = 2 & !cond_3 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 209 & loc_B1 > 182 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 209 & loc_B1 > 182 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 182 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 182 & dwl_B1 = 2 & cond_4  -> (loc_B1' = 182-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 182 & dwl_B1 = 2 & !cond_4 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 181 & loc_B1 > 149 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 181 & loc_B1 > 149 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 149 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 149 & dwl_B1 = 2 & cond_5  -> (loc_B1' = 149-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 149 & dwl_B1 = 2 & !cond_5 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 148 & loc_B1 > 131 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 148 & loc_B1 > 131 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 131 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 131 & dwl_B1 = 2 & cond_6  -> (loc_B1' = 131-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 131 & dwl_B1 = 2 & !cond_6 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 130 & loc_B1 > 111 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 130 & loc_B1 > 111 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 111 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 111 & dwl_B1 = 2 & cond_7  -> (loc_B1' = 111-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 111 & dwl_B1 = 2 & !cond_7 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 110 & loc_B1 > 87 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 110 & loc_B1 > 87 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 87 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 87 & dwl_B1 = 2 & cond_8  -> (loc_B1' = 87-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 87 & dwl_B1 = 2 & !cond_8 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 86 & loc_B1 > 54 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 86 & loc_B1 > 54 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 54 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 54 & dwl_B1 = 2 & cond_9  -> (loc_B1' = 54-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 54 & dwl_B1 = 2 & !cond_9 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 53 & loc_B1 > 39 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 53 & loc_B1 > 39 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 39 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 39 & dwl_B1 = 2 & cond_10  -> (loc_B1' = 39-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 39 & dwl_B1 = 2 & !cond_10 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 38 & loc_B1 > 15 & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 38 & loc_B1 > 15 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 15 & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);
 [tick] loc_B1 = 15 & dwl_B1 = 2 & cond_11  -> (loc_B1' = 15-1) & (dwl_B1' = 0);
 [tick] loc_B1 = 15 & dwl_B1 = 2 & !cond_11 -> (dl_B1' = min(dl_B1 + 1 , 1250)); 

 [tick] loc_B1 <= 14 & loc_B1 > 0 & delay_B1 < 1250 -> (1 - alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);
 [tick] loc_B1 <= 14 & loc_B1 > 0 & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);
 [tick] loc_B1 = 0 -> (loc_B1' = 0);
endmodule


module train_B2
 loc_B2 : [0..720] init 250;
 delay_B2 : [0..1250] init 0;
 dl_B2 : [0..1250] init 0;
 dwl_B2 : [0..2] init 0;
 [tick] t < st_B2 & loc_B2 = 250 -> (delay_B2' = 0);
 [tick] t >= st_B2 & loc_B2 = 250 & loc_B1 < 250-1 & cond_1 -> (loc_B2' = 250 - 1);
 [tick] t >= st_B2 & loc_B2 =250&(loc_B1>=250-1|!cond_1) -> (loc_B2' = loc_B2);

 [tick] loc_B2 <=249& loc_B2 >238+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=249& loc_B2 >238+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=249& loc_B2 >238+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 249 & loc_B2 >238+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=238& loc_B2 =238+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=238& loc_B2 =238+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =238& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <238-1& loc_B2 =238& dwl_B2 = 2 & cond_2 -> (loc_B2' =238-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=238-1| !cond_2) & dwl_B2 = 2 & loc_B2 =238& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=237& loc_B2 >210+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=237& loc_B2 >210+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=237& loc_B2 >210+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 237 & loc_B2 >210+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=210& loc_B2 =210+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=210& loc_B2 =210+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =210& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <210-1& loc_B2 =210& dwl_B2 = 2 & cond_3 -> (loc_B2' =210-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=210-1| !cond_3) & dwl_B2 = 2 & loc_B2 =210& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=209& loc_B2 >182+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=209& loc_B2 >182+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=209& loc_B2 >182+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 209 & loc_B2 >182+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=182& loc_B2 =182+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=182& loc_B2 =182+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =182& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <182-1& loc_B2 =182& dwl_B2 = 2 & cond_4 -> (loc_B2' =182-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=182-1| !cond_4) & dwl_B2 = 2 & loc_B2 =182& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=181& loc_B2 >149+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=181& loc_B2 >149+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=181& loc_B2 >149+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 181 & loc_B2 >149+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=149& loc_B2 =149+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=149& loc_B2 =149+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =149& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <149-1& loc_B2 =149& dwl_B2 = 2 & cond_5 -> (loc_B2' =149-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=149-1| !cond_5) & dwl_B2 = 2 & loc_B2 =149& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=148& loc_B2 >131+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=148& loc_B2 >131+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=148& loc_B2 >131+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 148 & loc_B2 >131+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=131& loc_B2 =131+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=131& loc_B2 =131+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =131& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <131-1& loc_B2 =131& dwl_B2 = 2 & cond_6 -> (loc_B2' =131-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=131-1| !cond_6) & dwl_B2 = 2 & loc_B2 =131& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=130& loc_B2 >111+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=130& loc_B2 >111+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=130& loc_B2 >111+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 130 & loc_B2 >111+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=111& loc_B2 =111+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=111& loc_B2 =111+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =111& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <111-1& loc_B2 =111& dwl_B2 = 2 & cond_7 -> (loc_B2' =111-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=111-1| !cond_7) & dwl_B2 = 2 & loc_B2 =111& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=110& loc_B2 >87+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=110& loc_B2 >87+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=110& loc_B2 >87+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 110 & loc_B2 >87+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=87& loc_B2 =87+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=87& loc_B2 =87+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =87& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <87-1& loc_B2 =87& dwl_B2 = 2 & cond_8 -> (loc_B2' =87-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=87-1| !cond_8) & dwl_B2 = 2 & loc_B2 =87& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=86& loc_B2 >54+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=86& loc_B2 >54+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=86& loc_B2 >54+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 86 & loc_B2 >54+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=54& loc_B2 =54+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=54& loc_B2 =54+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =54& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <54-1& loc_B2 =54& dwl_B2 = 2 & cond_9 -> (loc_B2' =54-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=54-1| !cond_9) & dwl_B2 = 2 & loc_B2 =54& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=53& loc_B2 >39+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=53& loc_B2 >39+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=53& loc_B2 >39+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 53 & loc_B2 >39+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=39& loc_B2 =39+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=39& loc_B2 =39+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =39& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <39-1& loc_B2 =39& dwl_B2 = 2 & cond_10 -> (loc_B2' =39-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=39-1| !cond_10) & dwl_B2 = 2 & loc_B2 =39& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=38& loc_B2 >15+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=38& loc_B2 >15+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <=38& loc_B2 >15+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 = 1250 -> (dl_B2' = dl_B2);
 [tick] loc_B2 <= 38 & loc_B2 >15+1& loc_B2-loc_B1 >= 2 &delay_B2  = 1250 -> (loc_B2' = loc_B2 - 1);
  [tick] loc_B1 <=15& loc_B2 =15+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <=15& loc_B2 =15+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 =15& dwl_B2 < 2 -> (dwl_B2' = dwl_B2 + 1);
 [tick] loc_B1 <15-1& loc_B2 =15& dwl_B2 = 2 & cond_11 -> (loc_B2' =15-1) & (dwl_B2' = 0);
 [tick] (loc_B1 >=15-1| !cond_11) & dwl_B2 = 2 & loc_B2 =15& dl_B2 <= 1250 -> (dl_B2' = min(1250,dl_B2 + 1));

 [tick] loc_B2 <=14& loc_B2 >0+1& loc_B2-loc_B1 >= 2 & delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B2 <=14& loc_B2 >0+1& loc_B2-loc_B1 < 2 & delay_B2 <= 1250 & dl_B2 < 1250 -> (dl_B2' = dl_B2 + 1);
 [tick] loc_B2 <= 14 & loc_B2 >0+1& loc_B2-loc_B1 >= 2 &delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B1 <= 0 & loc_B2 =0+1& delay_B2 < 1250 -> (1 - alpha/100):(loc_B2' = loc_B2 - 1) + alpha/100:(delay_B2' = delay_B2 + 1);
 [tick] loc_B1 <= 0 & loc_B2 = 0+1& delay_B2 = 1250 -> (loc_B2' = loc_B2 - 1);
 [tick] loc_B2 = 0 -> (loc_B2' = loc_B2);
endmodule


module train_B3
 loc_B3 : [0..720] init 250;
 delay_B3 : [0..1250] init 0;
 dl_B3 : [0..1250] init 0;
 dwl_B3 : [0..2] init 0;
 [tick] t < st_B3 & loc_B3 = 250 -> (delay_B3' = 0);
 [tick] t >= st_B3 & loc_B3 = 250 & loc_B2 < 250-1 & cond_1 -> (loc_B3' = 250 - 1);
 [tick] t >= st_B3 & loc_B3 =250&(loc_B2>=250-1|!cond_1) -> (loc_B3' = loc_B3);

 [tick] loc_B3 <=249& loc_B3 >238+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=249& loc_B3 >238+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=249& loc_B3 >238+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 249 & loc_B3 >238+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=238& loc_B3 =238+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=238& loc_B3 =238+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =238& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <238-1& loc_B3 =238& dwl_B3 = 2 & cond_2 -> (loc_B3' =238-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=238-1| !cond_2) & dwl_B3 = 2 & loc_B3 =238& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=237& loc_B3 >210+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=237& loc_B3 >210+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=237& loc_B3 >210+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 237 & loc_B3 >210+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=210& loc_B3 =210+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=210& loc_B3 =210+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =210& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <210-1& loc_B3 =210& dwl_B3 = 2 & cond_3 -> (loc_B3' =210-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=210-1| !cond_3) & dwl_B3 = 2 & loc_B3 =210& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=209& loc_B3 >182+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=209& loc_B3 >182+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=209& loc_B3 >182+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 209 & loc_B3 >182+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=182& loc_B3 =182+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=182& loc_B3 =182+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =182& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <182-1& loc_B3 =182& dwl_B3 = 2 & cond_4 -> (loc_B3' =182-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=182-1| !cond_4) & dwl_B3 = 2 & loc_B3 =182& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=181& loc_B3 >149+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=181& loc_B3 >149+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=181& loc_B3 >149+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 181 & loc_B3 >149+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=149& loc_B3 =149+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=149& loc_B3 =149+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =149& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <149-1& loc_B3 =149& dwl_B3 = 2 & cond_5 -> (loc_B3' =149-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=149-1| !cond_5) & dwl_B3 = 2 & loc_B3 =149& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=148& loc_B3 >131+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=148& loc_B3 >131+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=148& loc_B3 >131+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 148 & loc_B3 >131+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=131& loc_B3 =131+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=131& loc_B3 =131+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =131& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <131-1& loc_B3 =131& dwl_B3 = 2 & cond_6 -> (loc_B3' =131-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=131-1| !cond_6) & dwl_B3 = 2 & loc_B3 =131& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=130& loc_B3 >111+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=130& loc_B3 >111+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=130& loc_B3 >111+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 130 & loc_B3 >111+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=111& loc_B3 =111+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=111& loc_B3 =111+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =111& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <111-1& loc_B3 =111& dwl_B3 = 2 & cond_7 -> (loc_B3' =111-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=111-1| !cond_7) & dwl_B3 = 2 & loc_B3 =111& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=110& loc_B3 >87+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=110& loc_B3 >87+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=110& loc_B3 >87+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 110 & loc_B3 >87+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=87& loc_B3 =87+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=87& loc_B3 =87+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =87& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <87-1& loc_B3 =87& dwl_B3 = 2 & cond_8 -> (loc_B3' =87-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=87-1| !cond_8) & dwl_B3 = 2 & loc_B3 =87& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=86& loc_B3 >54+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=86& loc_B3 >54+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=86& loc_B3 >54+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 86 & loc_B3 >54+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=54& loc_B3 =54+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=54& loc_B3 =54+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =54& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <54-1& loc_B3 =54& dwl_B3 = 2 & cond_9 -> (loc_B3' =54-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=54-1| !cond_9) & dwl_B3 = 2 & loc_B3 =54& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=53& loc_B3 >39+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=53& loc_B3 >39+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=53& loc_B3 >39+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 53 & loc_B3 >39+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=39& loc_B3 =39+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=39& loc_B3 =39+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =39& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <39-1& loc_B3 =39& dwl_B3 = 2 & cond_10 -> (loc_B3' =39-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=39-1| !cond_10) & dwl_B3 = 2 & loc_B3 =39& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=38& loc_B3 >15+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=38& loc_B3 >15+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <=38& loc_B3 >15+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 = 1250 -> (dl_B3' = dl_B3);
 [tick] loc_B3 <= 38 & loc_B3 >15+1& loc_B3-loc_B2 >= 2 &delay_B3  = 1250 -> (loc_B3' = loc_B3 - 1);
  [tick] loc_B2 <=15& loc_B3 =15+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <=15& loc_B3 =15+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 =15& dwl_B3 < 2 -> (dwl_B3' = dwl_B3 + 1);
 [tick] loc_B2 <15-1& loc_B3 =15& dwl_B3 = 2 & cond_11 -> (loc_B3' =15-1) & (dwl_B3' = 0);
 [tick] (loc_B2 >=15-1| !cond_11) & dwl_B3 = 2 & loc_B3 =15& dl_B3 <= 1250 -> (dl_B3' = min(1250,dl_B3 + 1));

 [tick] loc_B3 <=14& loc_B3 >0+1& loc_B3-loc_B2 >= 2 & delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B3 <=14& loc_B3 >0+1& loc_B3-loc_B2 < 2 & delay_B3 <= 1250 & dl_B3 < 1250 -> (dl_B3' = dl_B3 + 1);
 [tick] loc_B3 <= 14 & loc_B3 >0+1& loc_B3-loc_B2 >= 2 &delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B2 <= 0 & loc_B3 =0+1& delay_B3 < 1250 -> (1 - alpha/100):(loc_B3' = loc_B3 - 1) + alpha/100:(delay_B3' = delay_B3 + 1);
 [tick] loc_B2 <= 0 & loc_B3 = 0+1& delay_B3 = 1250 -> (loc_B3' = loc_B3 - 1);
 [tick] loc_B3 = 0 -> (loc_B3' = loc_B3);
endmodule


module train_B4
 loc_B4 : [0..720] init 250;
 delay_B4 : [0..1250] init 0;
 dl_B4 : [0..1250] init 0;
 dwl_B4 : [0..2] init 0;
 [tick] t < st_B4 & loc_B4 = 250 -> (delay_B4' = 0);
 [tick] t >= st_B4 & loc_B4 = 250 & loc_B3 < 250-1 & cond_1 -> (loc_B4' = 250 - 1);
 [tick] t >= st_B4 & loc_B4 =250&(loc_B3>=250-1|!cond_1) -> (loc_B4' = loc_B4);

 [tick] loc_B4 <=249& loc_B4 >238+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=249& loc_B4 >238+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=249& loc_B4 >238+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 249 & loc_B4 >238+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=238& loc_B4 =238+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=238& loc_B4 =238+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =238& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <238-1& loc_B4 =238& dwl_B4 = 2 & cond_2 -> (loc_B4' =238-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=238-1| !cond_2) & dwl_B4 = 2 & loc_B4 =238& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=237& loc_B4 >210+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=237& loc_B4 >210+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=237& loc_B4 >210+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 237 & loc_B4 >210+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=210& loc_B4 =210+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=210& loc_B4 =210+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =210& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <210-1& loc_B4 =210& dwl_B4 = 2 & cond_3 -> (loc_B4' =210-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=210-1| !cond_3) & dwl_B4 = 2 & loc_B4 =210& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=209& loc_B4 >182+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=209& loc_B4 >182+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=209& loc_B4 >182+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 209 & loc_B4 >182+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=182& loc_B4 =182+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=182& loc_B4 =182+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =182& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <182-1& loc_B4 =182& dwl_B4 = 2 & cond_4 -> (loc_B4' =182-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=182-1| !cond_4) & dwl_B4 = 2 & loc_B4 =182& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=181& loc_B4 >149+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=181& loc_B4 >149+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=181& loc_B4 >149+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 181 & loc_B4 >149+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=149& loc_B4 =149+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=149& loc_B4 =149+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =149& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <149-1& loc_B4 =149& dwl_B4 = 2 & cond_5 -> (loc_B4' =149-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=149-1| !cond_5) & dwl_B4 = 2 & loc_B4 =149& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=148& loc_B4 >131+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=148& loc_B4 >131+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=148& loc_B4 >131+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 148 & loc_B4 >131+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=131& loc_B4 =131+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=131& loc_B4 =131+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =131& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <131-1& loc_B4 =131& dwl_B4 = 2 & cond_6 -> (loc_B4' =131-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=131-1| !cond_6) & dwl_B4 = 2 & loc_B4 =131& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=130& loc_B4 >111+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=130& loc_B4 >111+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=130& loc_B4 >111+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 130 & loc_B4 >111+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=111& loc_B4 =111+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=111& loc_B4 =111+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =111& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <111-1& loc_B4 =111& dwl_B4 = 2 & cond_7 -> (loc_B4' =111-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=111-1| !cond_7) & dwl_B4 = 2 & loc_B4 =111& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=110& loc_B4 >87+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=110& loc_B4 >87+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=110& loc_B4 >87+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 110 & loc_B4 >87+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=87& loc_B4 =87+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=87& loc_B4 =87+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =87& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <87-1& loc_B4 =87& dwl_B4 = 2 & cond_8 -> (loc_B4' =87-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=87-1| !cond_8) & dwl_B4 = 2 & loc_B4 =87& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=86& loc_B4 >54+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=86& loc_B4 >54+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=86& loc_B4 >54+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 86 & loc_B4 >54+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=54& loc_B4 =54+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=54& loc_B4 =54+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =54& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <54-1& loc_B4 =54& dwl_B4 = 2 & cond_9 -> (loc_B4' =54-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=54-1| !cond_9) & dwl_B4 = 2 & loc_B4 =54& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=53& loc_B4 >39+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=53& loc_B4 >39+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=53& loc_B4 >39+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 53 & loc_B4 >39+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=39& loc_B4 =39+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=39& loc_B4 =39+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =39& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <39-1& loc_B4 =39& dwl_B4 = 2 & cond_10 -> (loc_B4' =39-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=39-1| !cond_10) & dwl_B4 = 2 & loc_B4 =39& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=38& loc_B4 >15+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=38& loc_B4 >15+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <=38& loc_B4 >15+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 = 1250 -> (dl_B4' = dl_B4);
 [tick] loc_B4 <= 38 & loc_B4 >15+1& loc_B4-loc_B3 >= 2 &delay_B4  = 1250 -> (loc_B4' = loc_B4 - 1);
  [tick] loc_B3 <=15& loc_B4 =15+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <=15& loc_B4 =15+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 =15& dwl_B4 < 2 -> (dwl_B4' = dwl_B4 + 1);
 [tick] loc_B3 <15-1& loc_B4 =15& dwl_B4 = 2 & cond_11 -> (loc_B4' =15-1) & (dwl_B4' = 0);
 [tick] (loc_B3 >=15-1| !cond_11) & dwl_B4 = 2 & loc_B4 =15& dl_B4 <= 1250 -> (dl_B4' = min(1250,dl_B4 + 1));

 [tick] loc_B4 <=14& loc_B4 >0+1& loc_B4-loc_B3 >= 2 & delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B4 <=14& loc_B4 >0+1& loc_B4-loc_B3 < 2 & delay_B4 <= 1250 & dl_B4 < 1250 -> (dl_B4' = dl_B4 + 1);
 [tick] loc_B4 <= 14 & loc_B4 >0+1& loc_B4-loc_B3 >= 2 &delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B3 <= 0 & loc_B4 =0+1& delay_B4 < 1250 -> (1 - alpha/100):(loc_B4' = loc_B4 - 1) + alpha/100:(delay_B4' = delay_B4 + 1);
 [tick] loc_B3 <= 0 & loc_B4 = 0+1& delay_B4 = 1250 -> (loc_B4' = loc_B4 - 1);
 [tick] loc_B4 = 0 -> (loc_B4' = loc_B4);
endmodule

module ckrew
 ck :[0..2] init 0;
 [tt] ck <= 1 & loc_B1 = 0  & loc1 = 250 & loc_B2 = 0  & loc2 = 250 & loc_B3 = 0  & loc3 = 250 & loc_B4 = 0  & loc4 = 250 -> (ck' = ck + 1);
endmodule

formula total_prpg_dl = dl1 + dl_B1 + dl2  + dl_B2  + dl3  + dl_B3  + dl4  + dl_B4 ;

rewards
 [tt] ck = 1 : total_prpg_dl; 
endrewards

formula cond_1 = (loc1 <238 | loc1 >=250 | (loc1 =238 & dwl_1 <= 2))
 & (loc2 <238 | loc2 >=250 | (loc2 =238 & dwl_2 <= 2))
 & (loc3 <238 | loc3 >=250 | (loc3 =238 & dwl_3 <= 2))
 & (loc4 <238 | loc4 >=250 | (loc4 =238 & dwl_4 <= 2));

formula cond_2 = (loc1 <210 | loc1 >=238 | (loc1 =210 & dwl_1 <= 2))
 & (loc2 <210 | loc2 >=238 | (loc2 =210 & dwl_2 <= 2))
 & (loc3 <210 | loc3 >=238 | (loc3 =210 & dwl_3 <= 2))
 & (loc4 <210 | loc4 >=238 | (loc4 =210 & dwl_4 <= 2));

formula cond_3 = (loc1 <182 | loc1 >=210 | (loc1 =182 & dwl_1 <= 2))
 & (loc2 <182 | loc2 >=210 | (loc2 =182 & dwl_2 <= 2))
 & (loc3 <182 | loc3 >=210 | (loc3 =182 & dwl_3 <= 2))
 & (loc4 <182 | loc4 >=210 | (loc4 =182 & dwl_4 <= 2));

formula cond_4 = (loc1 <149 | loc1 >=182 | (loc1 =149 & dwl_1 <= 2))
 & (loc2 <149 | loc2 >=182 | (loc2 =149 & dwl_2 <= 2))
 & (loc3 <149 | loc3 >=182 | (loc3 =149 & dwl_3 <= 2))
 & (loc4 <149 | loc4 >=182 | (loc4 =149 & dwl_4 <= 2));

formula cond_5 = (loc1 <131 | loc1 >=149 | (loc1 =131 & dwl_1 <= 2))
 & (loc2 <131 | loc2 >=149 | (loc2 =131 & dwl_2 <= 2))
 & (loc3 <131 | loc3 >=149 | (loc3 =131 & dwl_3 <= 2))
 & (loc4 <131 | loc4 >=149 | (loc4 =131 & dwl_4 <= 2));

formula cond_6 = (loc1 <111 | loc1 >=131 | (loc1 =111 & dwl_1 <= 2))
 & (loc2 <111 | loc2 >=131 | (loc2 =111 & dwl_2 <= 2))
 & (loc3 <111 | loc3 >=131 | (loc3 =111 & dwl_3 <= 2))
 & (loc4 <111 | loc4 >=131 | (loc4 =111 & dwl_4 <= 2));

formula cond_7 = (loc1 < 87 | loc1 >=111 | (loc1 = 87 & dwl_1 <= 2))
 & (loc2 < 87 | loc2 >=111 | (loc2 = 87 & dwl_2 <= 2))
 & (loc3 < 87 | loc3 >=111 | (loc3 = 87 & dwl_3 <= 2))
 & (loc4 < 87 | loc4 >=111 | (loc4 = 87 & dwl_4 <= 2));

formula cond_8 = (loc1 < 54 | loc1 >= 87 | (loc1 = 54 & dwl_1 <= 2))
 & (loc2 < 54 | loc2 >= 87 | (loc2 = 54 & dwl_2 <= 2))
 & (loc3 < 54 | loc3 >= 87 | (loc3 = 54 & dwl_3 <= 2))
 & (loc4 < 54 | loc4 >= 87 | (loc4 = 54 & dwl_4 <= 2));

formula cond_9 = (loc1 < 39 | loc1 >= 54 | (loc1 = 39 & dwl_1 <= 2))
 & (loc2 < 39 | loc2 >= 54 | (loc2 = 39 & dwl_2 <= 2))
 & (loc3 < 39 | loc3 >= 54 | (loc3 = 39 & dwl_3 <= 2))
 & (loc4 < 39 | loc4 >= 54 | (loc4 = 39 & dwl_4 <= 2));

formula cond_10 =(loc1 < 15 | loc1 >= 39 | (loc1 = 15 & dwl_1 <= 2))
 & (loc2 < 15 | loc2>= 39 | (loc2 = 15 & dwl_2 <= 2))
 & (loc3 < 15 | loc3>= 39 | (loc3 = 15 & dwl_3 <= 2))
 & (loc4 < 15 | loc4>= 39 | (loc4 = 15 & dwl_4 <= 2));

formula cond_11 =(loc1 < 00 | loc1 >= 15 | (loc1 = 00 & dwl_1 <= 2))
 & (loc2 < 00 | loc2>= 15 | (loc2 = 00 & dwl_2 <= 2))
 & (loc3 < 00 | loc3>= 15 | (loc3 = 00 & dwl_3 <= 2))
 & (loc4 < 00 | loc4>= 15 | (loc4 = 00 & dwl_4 <= 2));

formula cond_R1 = (loc_B1 >  15 | loc_B1<= 00 | (loc_B1 = 15 & dwl_B1 < 2))
 & (loc_B2 > 15 | loc_B2 <= 00| (loc_B2 = 15 & dwl_B2 < 2))
 & (loc_B3 > 15 | loc_B3 <= 00| (loc_B3 = 15 & dwl_B3 < 2))
 & (loc_B4 > 15 | loc_B4 <= 00| (loc_B4 = 15 & dwl_B4 < 2));
formula cond_R2 = (loc_B1 >  39 | loc_B1<= 15 | (loc_B1 = 39 & dwl_B1 < 2))
 & (loc_B2 > 39 | loc_B2 <= 15| (loc_B2 = 39 & dwl_B2 < 2))
 & (loc_B3 > 39 | loc_B3 <= 15| (loc_B3 = 39 & dwl_B3 < 2))
 & (loc_B4 > 39 | loc_B4 <= 15| (loc_B4 = 39 & dwl_B4 < 2));
formula cond_R3 = (loc_B1 >  54 | loc_B1<= 39 | (loc_B1 = 54 & dwl_B1 < 2))
 & (loc_B2 > 54 | loc_B2 <= 39| (loc_B2 = 54 & dwl_B2 < 2))
 & (loc_B3 > 54 | loc_B3 <= 39| (loc_B3 = 54 & dwl_B3 < 2))
 & (loc_B4 > 54 | loc_B4 <= 39| (loc_B4 = 54 & dwl_B4 < 2));
formula cond_R4 = (loc_B1 >  87 | loc_B1<= 54 | (loc_B1 = 87 & dwl_B1 < 2))
 & (loc_B2 > 87 | loc_B2 <= 54| (loc_B2 = 87 & dwl_B2 < 2))
 & (loc_B3 > 87 | loc_B3 <= 54| (loc_B3 = 87 & dwl_B3 < 2))
 & (loc_B4 > 87 | loc_B4 <= 54| (loc_B4 = 87 & dwl_B4 < 2));
formula cond_R5 = (loc_B1 > 111 | loc_B1<= 87 | (loc_B1 =111 & dwl_B1 < 2))
 & (loc_B2 >111 | loc_B2 <= 87| (loc_B2 =111 & dwl_B2 < 2))
 & (loc_B3 >111 | loc_B3 <= 87| (loc_B3 =111 & dwl_B3 < 2))
 & (loc_B4 >111 | loc_B4 <= 87| (loc_B4 =111 & dwl_B4 < 2));
formula cond_R6 = (loc_B1 > 131 | loc_B1<=111 | (loc_B1 =131 & dwl_B1 < 2))
 & (loc_B2 >131 | loc_B2 <=111| (loc_B2 =131 & dwl_B2 < 2))
 & (loc_B3 >131 | loc_B3 <=111| (loc_B3 =131 & dwl_B3 < 2))
 & (loc_B4 >131 | loc_B4 <=111| (loc_B4 =131 & dwl_B4 < 2));
formula cond_R7 = (loc_B1 > 149 | loc_B1<=131 | (loc_B1 =149 & dwl_B1 < 2))
 & (loc_B2 >149 | loc_B2 <=131| (loc_B2 =149 & dwl_B2 < 2))
 & (loc_B3 >149 | loc_B3 <=131| (loc_B3 =149 & dwl_B3 < 2))
 & (loc_B4 >149 | loc_B4 <=131| (loc_B4 =149 & dwl_B4 < 2));
formula cond_R8 = (loc_B1 > 182 | loc_B1<=149 | (loc_B1 =182 & dwl_B1 < 2))
 & (loc_B2 >182 | loc_B2 <=149| (loc_B2 =182 & dwl_B2 < 2))
 & (loc_B3 >182 | loc_B3 <=149| (loc_B3 =182 & dwl_B3 < 2))
 & (loc_B4 >182 | loc_B4 <=149| (loc_B4 =182 & dwl_B4 < 2));
formula cond_R9 = (loc_B1 > 210 | loc_B1<=182 | (loc_B1 =210 & dwl_B1 < 2))
 & (loc_B2 >210 | loc_B2 <=182| (loc_B2 =210 & dwl_B2 < 2))
 & (loc_B3 >210 | loc_B3 <=182| (loc_B3 =210 & dwl_B3 < 2))
 & (loc_B4 >210 | loc_B4 <=182| (loc_B4 =210 & dwl_B4 < 2));
formula cond_R10= (loc_B1 > 238 | loc_B1<=210 | (loc_B1 =238 & dwl_B1 < 2))
 & (loc_B2 >238 | loc_B2 <=210| (loc_B2 =238 & dwl_B2 < 2))
 & (loc_B3 >238 | loc_B3 <=210| (loc_B3 =238 & dwl_B3 < 2))
 & (loc_B4 >238 | loc_B4 <=210| (loc_B4 =238 & dwl_B4 < 2));
formula cond_R11= (loc_B1 > 250 | loc_B1<=238 | (loc_B1 =250 & dwl_B1 < 2))
 & (loc_B2 >250 | loc_B2 <=238| (loc_B2 =250 & dwl_B2 < 2))
 & (loc_B3 >250 | loc_B3 <=238| (loc_B3 =250 & dwl_B3 < 2))
 & (loc_B4 >250 | loc_B4 <=238| (loc_B4 =250 & dwl_B4 < 2));

label "fin" = ck = 2;
