%read_tage
checkbox=0;
if isfield(handles,'fname_read')
    checkbox_fn=1;
else
    checkbox_fn=0;
    disp('error:�ļ���Ϊ��')
end
if isfield(handles,'tname_read')
    checkbox_tn=1;
else
    checkbox_tn=0;
    disp('error:����Ϊ��')
end

if checkbox_fn==1&&checkbox_tn==1
    if exist(handles.fname_read,'file')
        [status,sheets,xlFormat] = xlsfinfo(handles.fname_read);   
        if max(strcmp(sheets, handles.tname_read))>0
            checkbox=1;
        else

            disp('error:�ļ����Ҳ����ñ��')
        end
    else

        disp('error���ļ������ڣ���ȡʧ��')
    end
    
end


if checkbox==1
    b=xlsread(handles.fname_read,handles.tname_read);
    [m,n]=size(b);
    b(:,3)=-1;
    a=b(:,1:3);

%     [status,sheets,xlFormat] = xlsfinfo(handles.fname_read);
    if max(strcmp(sheets, 'revise'))>0
        c=xlsread(handles.fname_read,'revise');
        a(:,3)=c(:,3);
    end
    if exist('eventlog.mat')
        load eventlog.mat
        if strcmp(eventlog.fname,handles.fname_read)
            set(handles.listbox2,'String',eventlog.depnum);
        else
            clear eventlog
            eventlog.depnum=[];
            eventlog.agedata=[];
            eventlog.fname=handles.fname_read;
            set(handles.listbox2,'String','');
        end
    else
        eventlog.depnum=[];
        eventlog.agedata=[];
        eventlog.fname=handles.fname_read;
    end

    set(handles.uitable1,'data',a);
    save a.mat a
    save eventlog.mat eventlog
end
