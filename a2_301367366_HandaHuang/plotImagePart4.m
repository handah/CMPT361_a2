function h=plotImagePart4(imgA, imgB, X1, Y1,X2,Y2)

h=0;

imgA=im2double(imgA);
imgB=im2double(imgB);


height=size(imgA,1);
width=size(imgA,2)+size(imgB,2);

newImage=imfuse(imgA,imgB,"montage");
imshow(newImage);



hold on

for i=2:size(X1,1)

   
    plot([X1(i-1) Y1(i-1)],[X1(i) Y1(i-1)],'*-','Color','black', 'LineWidth',2)
    plot([X2(i-1) Y2(i-1)],[X2(i) Y2(i-1)],'*-','Color','black', 'LineWidth',2)


    %plot([X1(i) size(imgA,2)+X2(i)],[Y1(i) Y2(i)],'*-','Color',color, 'LineWidth',2)
end
hold off;
end