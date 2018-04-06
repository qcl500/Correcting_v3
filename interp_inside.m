function interp_inside(finname,tname,in)
    a=xlsread(finname,tname);
    x=a(:,1);%数据表第一列为x值
    y=a(:,2);%数据表第二列为y值

    x1=min(x):in:max(x);%制作新的x1等间隔列数据
    y1=interp1(x,y,x1,'linear');%制作新的y1等间隔列数据.方法:线性插值
    out=[x1;y1]';%输出的两列数据
    xlswrite(finname,out,'interp_out');
   
    figure %图像显示，原始数据黑色线条，插值后数据为红色点
    plot(x,y,'k',x1,y1,'r.')
end
