close all
clear 
clc


difficulty=input("Please choose image difficulty 1, 2,or 3 (type in a number): ");

if difficulty==1


img=imread("card2.jpg"); %change photo
imgg=imread("card1.jpg");%change photo



[corners1,row1,cols1,img1]=harrisDectection(imgg,512,512,0.01);
[corners2,rows2,cols2,img2]=harrisDectection(img,512,512,0.01);


[features1,dir1]=descriptor(corners1,img1);
[features2,dir2]=descriptor(corners2,img2);

%[features1,dirf]=betterDescriptor(corners1,img1);
%[features2,dirff]=betterDescriptor(corners2,img2);



[y1,x1]=find(corners1>0);
[y2,x2]=find(corners2>0);



[matches,notConfidentMatches]=matchFeatures(features1,features2,0.88);

%num=min(1,size(matches,1));

plotImage(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)));
%plotImage(img1,img2,x1(matches(1:num,1)),y1(matches(1:num,1)),x2(matches(1:num,2)),y2(matches(1:num,2)));
[precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2);



elseif difficulty==2

img=imread("card3.jpg");%change photo
imgg=imread("card1.jpg");%change photo

[dim2r,dim2c,~]=size(img);


[corners1,row1,cols1,img1]=harrisDectection(imgg,512,512,0.01);
[corners2,rows2,cols2,img2]=harrisDectection(img,512,512,0.01);

[features1,dir1]=descriptor(corners1,img1);
[features2,dir2]=descriptor(corners2,img2);

%[features1,dirf]=betterDescriptor(corners1,img1);
%[features2,dirff]=betterDescriptor(corners2,img2);

[y1,x1]=find(corners1>0);
[y2,x2]=find(corners2>0);

[matches,notConfidentMatches]=matchFeatures(features1,features2,0.88);


plotImage(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)));

 [precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2);   




elseif difficulty==3
    
img=imread("card4.jpg");%change photo
imgg=imread("card1.jpg");%change photo

[dim2r,dim2c,~]=size(img);


[corners1,row1,cols1,img1]=harrisDectection(imgg,512,512,0.01);
[corners2,rows2,cols2,img2]=harrisDectection(img,512,512,0.01);

[features1,dir1]=descriptor(corners1,img1);
[features2,dir2]=descriptor(corners2,img2);

%[features1,dirf]=betterDescriptor(corners1,img1);
%[features2,dirff]=betterDescriptor(corners2,img2);

[y1,x1]=find(corners1>0);
[y2,x2]=find(corners2>0);

[matches,notConfidentMatches]=matchFeatures(features1,features2,0.88);


plotImage(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)));

 [precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2);   









end

