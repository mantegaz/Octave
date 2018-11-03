function [child2, child1] = ApplyOX(father, mother)
    
    n=numel(mother);
    
    I=randsample(n,2);
    
    i1=min(I);
    i2=max(I);
    
    y1=father([i1:i2]);
    [~,loc1]=ismember(y1,mother);
    loc1=sort(loc1);
    child1=[father(1:i1-1) mother(loc1) father(i2+1:end)];
    
    y2=mother([i1:i2]);
    [~,loc2]=ismember(y2,father);
    loc2=sort(loc2);
    child2=[mother(1:i1-1) father(loc2) mother(i2+1:end)];

endfunction