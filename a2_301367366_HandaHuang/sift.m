close all
clear 
clc

close all
clear 
clc


img=imread("checkboard.png");

[corners,rows,cols,img2]=harrisDectection(img);