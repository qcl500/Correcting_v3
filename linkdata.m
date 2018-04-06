function linkdata(a,c,ns,nn)
    k=2;
    for i=1:nn-ns+1
         b=num2str(ns);
         filename=strcat(a,b,c);
        [ndata,text,alldata]=xlsread(filename);
        [m,n]=size(alldata);
        findata(1,:)=text(1,:);
        findata(k:k+m-2,1:end)=alldata(2:end,:);
        k=k+m-1;
        ns=ns+1;
    end
    d='link';
    finname=strcat(a,d,c);
    tablename='linkdata';
    xlswrite(finname,findata,tablename);
end