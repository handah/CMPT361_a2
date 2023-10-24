close all
clear 
clc


difficulty=input("Please choose basic image 1, 2 or 3 (type in a number): ");

if difficulty==1


imgg=imread("card1.jpg"); %change images


[corners1,rows1,cols1,img1]=harrisDectection(imgg,512,512,0.01);

showHarris(rows1,cols1,corners1,img1);



elseif difficulty==2

imgg=imread("mask1.jpg");%change images

[dim2r,dim2c,~]=size(imgg);


[corners1,rows1,cols1,img1]=harrisDectection(imgg,dim2r/2,dim2c/2,0.1);

showHarris(rows1,cols1,corners1,img1);


elseif difficulty==3
    
imgg=imread("me1.jpg");%change images

[dim2r,dim2c,~]=size(imgg);


[corners1,rows1,cols1,img1]=harrisDectection(imgg,dim2r/2,dim2c/2,0.05);
showHarris(rows1,cols1,corners1,img1);
 
end





