function [matches,notConfidentMatches]=matchFeatures(features1,features2,thresh)

    

    %thresh=0.96;
    matches=[];
    notConfidentMatches=[];
    overallDistance=[];
    for f1=1:size(features1,1)
    
        for f2=1:size(features2,1)
            dist(f2)=sqrt(sum((features1(f1,:)- features2(f2,:)) .^ 2));

            overallDistance=[overallDistance,dist];
        end
        distance=sort(dist,'ascend');
       
    
        notConfidentMatches=[notConfidentMatches;distance(1)];

        if (distance(1)/distance(2)<thresh)
            matches=[matches;[f1,find(dist==distance(1))]];
        end

    
    end


end