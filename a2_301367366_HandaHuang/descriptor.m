function [features,dir]=descriptor(corners,img2)

image=rgb2gray(im2double(img2));
gaus = fspecial('gaussian', 7, 1);
[deriv_gaus_x, deriv_gaus_y] = gradient(gaus);

ix = imfilter(image, deriv_gaus_x);
iy = imfilter(image, deriv_gaus_y);

ixg = imfilter(ix, gaus);
iyg = imfilter(iy, gaus);


[mag,dir]=imgradient(iyg,ixg);



dir(dir<0) = dir(dir<0) +360;

for i = 1:8
    dir(dir>=(i-1)*(45) & dir<=(i*45) )= i; %% direction qunatize
end


[cornerY,cornerX]=find(corners>0);


features=[];
for cornerIndex=1:length(cornerX)
    
    startX=cornerX(cornerIndex)-7;
    startY=cornerY(cornerIndex)-7;
    endX=cornerX(cornerIndex)+8;
    endY=cornerY(cornerIndex)+8;

    window=dir(startY:endY,startX:endX);
    
    squareMatrix=mat2cell(window,[4,4,4,4],[4,4,4,4]);
  
    matAsVector=reshape(squareMatrix.',1,[]);

    featureOfSquare=[];
    for matIndex=1:length(matAsVector)
        hist=zeros(1,8);
        temp=reshape(cell2mat(matAsVector(matIndex)).',1,[]);
        for squareIndex=1:length(temp)
            pixelDir=temp(squareIndex);
            hist(pixelDir)=hist(pixelDir)+1;
        end
         featureOfSquare=[featureOfSquare hist];
   
    end
    featureOfSquare = normalize(featureOfSquare,'norm',1); % normalized
    % solve the Illumination probelm -> Th = 0.2
    featureOfSquare(featureOfSquare>=0.2) = 0.2;
    featureOfSquare = normalize(featureOfSquare,'norm',1); % normalized
    
    
    features=[features;featureOfSquare];
end

end