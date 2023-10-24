

function [corners,rows,cols,img2]=testHarris(img,dim1,dim2,thresh)


img2=imresize(img,[dim1,dim2]);

image=rgb2gray(im2double(img2));
gaus = fspecial('gaussian', 7, 1);
[deriv_gaus_x, deriv_gaus_y] = gradient(gaus);

ix = imfilter(image, deriv_gaus_x);
iy = imfilter(image, deriv_gaus_y);
ix2 = ix.*ix;
iy2 = iy.*iy;
ixiy = ix.*iy;

ix2g = imfilter(ix2, gaus);
iy2g = imfilter(iy2, gaus);
ixiyg = imfilter(ixiy, gaus);




[rows,cols]=size(image);
C=zeros(rows,cols);
temp=0;
for i=8:rows-8
    for j=8:cols-8
        M=[ix2g(i,j),ixiy(i,j); ixiyg(i,j),iy2g(i,j)];
        C(i,j)=det(M)-0.05*(trace(M))^2;
        if C(i,j)>temp
            temp=C(i,j);
        end
    end
end

%0.05
%thresh=0.05;%adjustable threshld



corners=zeros(rows,cols);


for i=2:rows-1
    for j=2:cols-1
        if C(i,j)>thresh*temp
            startX=i-1;
            startY=j-1;
            endX=i+1;
            endY=j+1;
            window=C(startY:endY,startX:endX);
            
            windowToVec=reshape(window',1,[]);
            
            for indexx=1:length(windowToVec)
                
                if C(i,j)<windowToVec(indexx)
                    break;
                end
            
            end
            if indexx==9
                disp(indexx);
                corners(i,j)=1;
            end
        end
    end
end




%{
corners=zeros(rows,cols);
neighbours=[-1,-1;-1,0;-1,1;0,-1;0,1;1,-1;1,0;1,1];
for i=2:rows-1
    for j=2:cols-1
        if C(i,j)>thresh*temp
            ne=[];
            for k=1:8
                if C(i,j)<C(i+neighbours(k,1),j+neighbours(k,2))
                    break;
                end
            end
            if k==8
                corners(i,j)=1;
            end
        end
    end
end

%}


end