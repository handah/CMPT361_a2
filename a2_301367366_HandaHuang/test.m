close all
clear 
clc

imgg=imread("card1.jpg"); %change images


[corners1,rows1,cols1,img1]=testHarris(imgg,512,512,0.01);

showHarris(rows1,cols1,corners1,img1);