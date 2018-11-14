function [child2, child1] = ApplyPMX(father, mother)
    
    n=numel(mother);
    
    I=randsample(n,2);
    child1=zeros(1,n);
    child2=zeros(1,n);
    
    i1=min(I);
    i2=max(I);
    
    child1([i1:i2])=father([i1:i2]);
    child2([i1:i2])=mother([i1:i2]);
    
    Aux1=mother(i1:i2);
    Aux2=father(i1:i2);

    n2=numel(Aux1);
    for j=1:n2
	[a,~]=ismember(Aux1(j),Aux2);
	[b,~]=ismember(Aux2(j),Aux1);
      
        k=j+i1-1;
        l=j+i1-1;
        para1=0;
        para2=0;
        while (para1==0 || para2==0)
	    if (a==0)
              [~,p]=find(father(k)==mother);
               if (para1==0)
                    if (p>=i1 && p<=i2)
                        k=p;
                    else
                        child1(p)=mother(j+i1-1);
                       para1=1;
                    endif
               endif   
            else
               para1=1;           
            endif
            if (b==0)
               [~,q]=find(mother(l)==father);
               if (para2==0)
                   if (q>=i1 && q<=i2)
                      l=q;
                   else
                       child2(q)=father(j+i1-1);
                       para2=1;
                   endif
               endif
            else 
              para2=1;
            endif
        endwhile
      
    endfor
    

    [~,loc1]=find(0==child1);
    child1([loc1])=mother([loc1]);
    
    [~,loc2]=find(0==child2);
    child2([loc2])=father([loc2]);


end
