%del_tage

if exist('eventlog.mat','file')
    load eventlog.mat   
    id=find(eventlog.depnum==handles.depnum);
    if ~isempty(id)
        eventlog.depnum(id)=[];
        eventlog.agedata(id)=[];
    else
        disp('error:�Ҳ�������ȱ��')
    end
else

    eventlog.depnum=[];
    eventlog.agedata=[];

end
save eventlog.mat eventlog
set(handles.listbox2,'value',1);
set(handles.listbox2,'String',eventlog.depnum);
