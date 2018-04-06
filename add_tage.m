%add_tage
checkbox=0;
if isfield(handles,'depnum')
    checkbox_dn=1;
else
    checkbox_dn=0;
    disp('error:深度编号为空')
end
if isfield(handles,'agedata')
    checkbox_an=1;
else
    checkbox_an=0;
    disp('error:年龄标点为空')
end

if checkbox_dn==1&&checkbox_an==1
    if isnan(handles.depnum)||isnan(handles.agedata)
        disp('error:请检查深度编号或者年龄编号是否正确')
    else
        checkbox=1;
    end
end


if checkbox==1
    if exist('eventlog.mat','file')
        load eventlog.mat

    else

        eventlog.depnum=[];
        eventlog.agedata=[];
        eventlog.fname=handles.fname_read;

    end

    eventlog.depnum=[eventlog.depnum handles.depnum];
    eventlog.agedata=[eventlog.agedata handles.agedata];


    [eventlog.depnum, index]=sort(eventlog.depnum);
    eventlog.agedata=eventlog.agedata(index);
    save eventlog.mat eventlog;
    save eventlog_backup.mat eventlog;

    load a.mat;
    x=a(:,1);
    y=a(:,2);
    age=a(:,3);

    k=eventlog.depnum;
    n=length(k);
    for i=1:n
        age(k(i))=eventlog.agedata(i);
    end

    if n>1
        for i=1:(n-1)
            for ii=(k(i)+1):(k(i+1)-1)
                age(ii)=((eventlog.agedata(i+1)-eventlog.agedata(i))*(x(ii)-x(k(i)))/(x(k(i+1))-x(k(i))))+eventlog.agedata(i);
            end
        end
    end

    a=[x,y,age];
    save a.mat a
%     set(handles.uitable1,'data',a);
    
    data = a;
    
%     data = num2cell(data);
%     for i=1:n
%         data{k(i),1} = ['<html><FONT color=#ff0000">' num2str(data{k(i),1},'%10.4f') '</Font></html>'];
%         data{k(i),2} = ['<html><FONT color=#ff0000">' num2str(data{k(i),2},'%10.4f') '</Font></html>'];
%         data{k(i),3} = ['<html><FONT color=#ff0000">' num2str(data{k(i),3},'%10.4f') '</Font></html>'];
%     end
    set(handles.uitable1,'data',data);

    id=find(eventlog.depnum==handles.depnum);
    set(handles.listbox2,'value',id(1));
    set(handles.listbox2,'String',eventlog.depnum);
end

