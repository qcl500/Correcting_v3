%savedata

set(handles.text9,'String','running');
set(handles.text9,'backgroundcolor','y');
pause(0.5);

load a.mat
load eventlog.mat
[m,n]=size(a);
m1=length(eventlog.depnum);
if m>max(eventlog.depnum)
    for i=eventlog.depnum(m1)+1:1:m
        a(i,3)=(eventlog.agedata(m1)-eventlog.agedata(m1-1))*(a(i,1)-a(eventlog.depnum(m1-1)))/(a(eventlog.depnum(m1))-a(eventlog.depnum(m1-1)))+eventlog.agedata(m1-1);
    end
    set(handles.uitable1,'data',a);
    save a.mat a
end
%添加沉积速率记录
%matlab2010b不支持末尾function？
v=vdif(a);
v_out=[a(:,1),a(:,3),v];
xlswrite(handles.fname_read,v_out,'rate');


b=[a,a(:,2)];
xlswrite(handles.fname_read,b,'revise');
%------------------------------------------------------
[status,sheets,xlFormat] = xlsfinfo(handles.fname_read);
if max(strcmp(sheets, 'revise'))>0
    m2=find(strcmp(sheets, 'revise')==1);
    set_tagecolour(handles.fname_read,m2,eventlog.depnum,m);%文件名,表名编号,填充编号,总长度
end

%------------------------------------------------------
x=a(:,3);%数据表第一列为x值
y=a(:,2);%数据表第二列为y值

x1=ceil(min(x)):1:max(x);%制作新的x1等间隔列数据
y1=interp1(x,y,x1,'linear');%制作新的y1等间隔列数据.方法:线性插值
out1=[x1;y1]';%输出的两列数据
xlswrite(handles.fname_read,out1,'interp_tomac');

%------------------------------------------------------
%写入日志记录

dm='depth(m)';
dcm='depth(cm)';
% t=date();
t=datestr(now);
fid=fopen('log.txt','a');
fprintf(fid,'%s \r\n',eventlog.fname);
fprintf(fid,'%s \r\n',t);
fprintf(fid,'%s\t%s\t%s \r\n','num','age(ky)',dm);
for i=1:m1
    fprintf(fid,'%d\t%f\t%f \r\n',eventlog.depnum(i),eventlog.agedata(i),a(eventlog.depnum(i),1));
end
fprintf(fid,'%s \r\n','-----------------------------');
fclose(fid);


set(handles.text9,'String','Done');

set(handles.text9,'backgroundcolor','g');



function v=vdif(a)
yy=a(:,1);
zz=a(:,3);
v=diff(yy*100)./diff(zz);
v=[v(1);v];
end