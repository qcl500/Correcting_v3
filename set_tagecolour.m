%set_tagecolour
function set_tagecolour(filespec_user,m2,depnum,m)%�ļ���,�������,�����,�ܳ���
    %filespec_user = handles.fname_read;
    try
        % ��Excel�������Ѿ��򿪣���������Excel
        Excel = actxGetRunningServer('Excel.Application');
    catch
        % ����һ��Microsoft Excel�����������ؾ��Excel
        Excel = actxserver('Excel.Application'); 
    end;

    % ����Excel������Ϊ���ɼ�״̬
    Excel.Visible = 0;    % set(Excel, 'Visible', 1); 

    % ��filespec_user�ļ����ڣ��򿪸ò����ļ��������½�һ���������������棬�ļ���Ϊfilespec_user.Excel
    if exist(filespec_user)
        Workbook = Excel.Workbooks.Open(filespec_user);
        % Workbook = invoke(Excel.Workbooks,'Open',filespec_user);
    else
        Workbook = Excel.Workbooks.Add;
        % Workbook = invoke(Excel.Workbooks, 'Add');
        Workbook.SaveAs(filespec_user);
    end

    % ���ص�ǰ��������
    Sheets = Excel.ActiveWorkbook.Sheets;    % Sheets = Workbook.Sheets;
    Sheet1 = Sheets.Item(m2);    % �����ض������
    Sheet1.Activate;    % �����ض����

    %��ɫ��ʼ��
    n=length(depnum);
    s1=strcat('A',num2str(m));
    s2=strcat('B',num2str(m));
    sall_a=strcat('A1:',s1);
    sall_b=strcat('B1:',s2);
    Sheet1.Range(sall_a).Interior.ColorIndex=0;
    Sheet1.Range(sall_b).Interior.ColorIndex=0;

    %��ɫ����
    for i=1:n
        sa=strcat('A',num2str(depnum(i)));
        sb=strcat('B',num2str(depnum(i)));
    %     sc=strcat('C',num2str(depnum(i)));
    %     sd=strcat('D',num2str(depnum(i)));
        Sheet1.Range(sa).Interior.ColorIndex = 37;%37����
        Sheet1.Range(sb).Interior.ColorIndex = 37;
    %     Sheet1.Range(sc).Interior.ColorIndex = 37;
    %     Sheet1.Range(sd).Interior.ColorIndex = 37;
    end


    Workbook.Save   % �����ĵ�
    Excel.Quit   % �˳��ĵ�
    Excel.delete
end