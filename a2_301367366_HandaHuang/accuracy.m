function [precision, recall, F_score]=accuracy(matches, notConfidentMatches,features1,features2)
    [mr,mc,~]=size(matches);
    [rr,rc,~]=size(notConfidentMatches);
    [fr1,fc1,~]=size(features1);
    [fr2,fc2,~]=size(features2);
    

    
    
    diff=max(fr1,fr2);
    %{
    diff2=abs(min(fr1,fr2)-rr);

    TP=rr;
    FN=abs(diff2-rr);
    FP=diff2;
    TN=abs(diff-rr);


    disp(diff);
    disp(rr);

    precision=TP/(FP+TP);
    recall=TP/(TP+FN);

    F_score=2/((recall^-1)+(precision^-1));
    %}
    
   
    %precision=rr/diff;


    precision=mr/rr;

    diff=max(fr1,fr2);
    fn=abs(diff-mr);

    recall=mr/(mr+fn);

    F_score=2/((recall^-1)+(precision^-1));
    

end