function showHarris(rows2,cols2,corners2,img2)

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


end

