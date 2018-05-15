%del_tage

if exist('eventlog.mat','file')
    load eventlog.mat   
    id=find(eventlog.depnum==handles.depnum);
    if ~isempty(id)
        eventlog.depnum(id)=[];
        eventlog.agedata(id)=[];
    else
        disp('error:找不到该深度编号')
    end
else

    eventlog.depnum=[];
    eventlog.agedata=[];

end
save eventlog.mat eventlog
set(handles.listbox2,'value',1);
set(handles.listbox2,'String',eventlog.depnum);
