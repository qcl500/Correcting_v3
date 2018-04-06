%vplot

newwin=get(handles.radiobutton1, 'Value');
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
yy=a(:,1);
zz=a(:,3);
v=diff(yy*100)./diff(zz);
if newwin==0
    plot(handles.axes1,v,yy(2:end));
    set(handles.axes1,'YDir','reverse');
    set(handles.axes1,'Ylim',[min(yy),max(yy)]);
else
    figure('Name','Correcting','NumberTitle','off')
    plot(v,yy(2:end));
        xlabel('沉积速率 [cm/ky]')
        ylabel('深度[m]')
end





