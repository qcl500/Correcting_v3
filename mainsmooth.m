function mainsmooth(finname,tname,num)
    smoothdata=xlsread(finname,tname);
    x=smoothdata(:,1);
    y=smoothdata(:,2);
    y1=smooth(y,num);
    out=[x,y,y1];
    s='smooth';
    tablename=strcat(s,num2str(num));
    xlswrite(finname,out,tablename);
    figure()
    plot(x,y,'k',x,y1,'r')
end