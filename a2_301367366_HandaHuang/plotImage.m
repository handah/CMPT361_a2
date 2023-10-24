function [ h ] = plotImage(imgA, imgB, X1, Y1, X2, Y2)

h = figure(3);


imgA=im2double(imgA);
imgB=im2double(imgB);


height=size(imgA,1);
width=size(imgA,2)+size(imgB,2);

newImage=imfuse(imgA,imgB,"montage");
imshow(newImage);



hold on

for i=1:size(X1,1)
    color=rand(3,1);
    plot([X1(i) size(imgA,2)+X2(i)],[Y1(i) Y2(i)],'*-','Color',color, 'LineWidth',2)
end
hold off;
