function [features,dirRatio]=betterDescriptor(corners,img2)

image=rgb2gray(im2double(img2));
gaus = fspecial('gaussian', 7, 1);
[deriv_gaus_x, deriv_gaus_y] = gradient(gaus);

ix = imfilter(image, deriv_gaus_x);
iy = imfilter(image, deriv_gaus_y);

ixg = imfilter(ix, gaus);
iyg = imfilter(iy, gaus);


[mag,dir]=imgradient(iyg,ixg);



dir(dir<0) = dir(dir<0) +360;


[dirR,dirC,~]=size(dir);

dirRatio=[];
for i=1:dirR
    for j=1:dirC
        for k=1:8
            if dir(i,j)>=((k-1)*(45)) && dir(i,j)<=(k*45)
                dirRatio(i,j)=(dir(i,j)-((k-1)*45))/45;
            end
        end
    end

end

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
    ratioWindow=dirRatio(startY:endY,startX:endX);
    magWindow=mag(startY:endY,startX:endX);
    
    squareMatrix=mat2cell(window,[4,4,4,4],[4,4,4,4]);
    ratioMatrix=mat2cell(ratioWindow,[4,4,4,4],[4,4,4,4]);
    magMatrix=mat2cell(magWindow,[4,4,4,4],[4,4,4,4]);
  
    matAsVector=reshape(squareMatrix.',1,[]);
    ratioAsVector=reshape(ratioMatrix.',1,[]);
    magAsVector=reshape(magMatrix.',1,[]);

    featureOfSquare=[];
    for matIndex=1:length(matAsVector)
        hist=zeros(1,8);
        temp=reshape(cell2mat(matAsVector(matIndex)).',1,[]);
        ratioTemp=reshape(cell2mat(ratioAsVector(matIndex)).',1,[]);
        magTemp=reshape(cell2mat(magAsVector(matIndex)).',1,[]);

        for squareIndex=1:length(temp)
            pixelDir=temp(squareIndex);
            magInUpperBin=ratioTemp(squareIndex)*magTemp(squareIndex);
            magInLowerBin=(1-ratioTemp(squareIndex))*magTemp(squareIndex);

            hist(pixelDir)=hist(pixelDir)+magInUpperBin;
            if pixelDir-1>0
        
                hist(pixelDir-1)=hist(pixelDir)+magInLowerBin;
            end
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