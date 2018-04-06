function [k,kwhere,knum]=checkdepth(filename,tablename)

    data=xlsread(filename,tablename);
    depth=data(:,1);
    depth(isnan(depth))=[];
    [m,n]=size(depth);
    k=zeros(1,m);knum=0;ii=1;
    kwhere(ii)=0;
    for i=2:m-1;
        if depth(i-1)<depth(i)&&depth(i)<depth(i+1)
            k(i)=0;
        
        else
            k(i)=1;
            kwhere(ii)=i;
            ii=ii+1;
            knum=knum+1;
        
        end
    end
end
        
