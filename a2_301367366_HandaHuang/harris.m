close all
clear 
clc


difficulty=input("Please choose image set 1, 2 or 3 (type in a number): ");

if difficulty==1


img=imread("set22.jpg");
imgg=imread("set21.jpg");



[corners1,row1,cols1,img1]=harrisDectection(imgg,512,512,0.05);
[corners2,rows2,cols2,img2]=harrisDectection(img,512,512,0.05);


%{
imshow(img2);
hold on;
for i=2:rows2-1
    for j=2:cols2-1
        if corners2(i,j)==1
            plot(j,i,'x','Color','red')
        end
    end
end
hold off;  
%}


[features1,dir1]=descriptor(corners1,img1);
[features2,dir2]=descriptor(corners2,img2);

%[features1,dirf]=betterDescriptor(corners1,img1);
%[features2,dirff]=betterDescriptor(corners2,img2);



[y1,x1]=find(corners1>0);
[y2,x2]=find(corners2>0);



[matches,notConfidentMatches]=matchFeatures(features1,features2);


%show_correspondence(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)),'arrows');

plotImage(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)));
[precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2);



elseif difficulty==2

img=imread("tower2.jpg");
imgg=imread("tower1.jpg");

[dim2r,dim2c,~]=size(img);


[corners1,row1,cols1,img1]=harrisDectection(imgg,dim2r/2,dim2c/2,0.1);
[corners2,rows2,cols2,img2]=harrisDectection(img,dim2r/2,dim2c/2,0.1);

[features1,dir1]=descriptor(corners1,img1);
[features2,dir2]=descriptor(corners2,img2);

%[features1,dirf]=betterDescriptor(corners1,img1);
%[features2,dirff]=betterDescriptor(corners2,img2);

[y1,x1]=find(corners1>0);
[y2,x2]=find(corners2>0);

[matches,notConfidentMatches]=matchFeatures(features1,features2);


plotImage(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)));

 [precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2);   



elseif difficulty==3
    
img=imread("me2.jpg");
imgg=imread("me1.jpg");

[dim2r,dim2c,~]=size(img);


[corners1,row1,cols1,img1]=harrisDectection(imgg,dim2r/2,dim2c/2,0.1);
[corners2,rows2,cols2,img2]=harrisDectection(img,dim2r/2,dim2c/2,0.1);

[features1,dir1]=descriptor(corners1,img1);
[features2,dir2]=descriptor(corners2,img2);

%[features1,dirf]=betterDescriptor(corners1,img1);
%[features2,dirff]=betterDescriptor(corners2,img2);

[y1,x1]=find(corners1>0);
[y2,x2]=find(corners2>0);

[matches,notConfidentMatches]=matchFeatures(features1,features2);


plotImage(img1,img2,x1(matches(:,1)),y1(matches(:,1)),x2(matches(:,2)),y2(matches(:,2)));

 [precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2);   
end






%////////////////////////////////////////////////////////////////////////////////////////////////////









