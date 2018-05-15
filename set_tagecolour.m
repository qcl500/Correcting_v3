%set_tagecolour
function set_tagecolour(filespec_user,m2,depnum,m)%文件名,表名编号,填充编号,总长度
    %filespec_user = handles.fname_read;
    try
        % 若Excel服务器已经打开，返回其句柄Excel
        Excel = actxGetRunningServer('Excel.Application');
    catch
        % 创建一个Microsoft Excel服务器，返回句柄Excel
        Excel = actxserver('Excel.Application'); 
    end;

    % 设置Excel服务器为不可见状态
    Excel.Visible = 0;    % set(Excel, 'Visible', 1); 

    % 若filespec_user文件存在，打开该测试文件，否则，新建一个工作簿，并保存，文件名为filespec_user.Excel
    if exist(filespec_user)
        Workbook = Excel.Workbooks.Open(filespec_user);
        % Workbook = invoke(Excel.Workbooks,'Open',filespec_user);
    else
        Workbook = Excel.Workbooks.Add;
        % Workbook = invoke(Excel.Workbooks, 'Add');
        Workbook.SaveAs(filespec_user);
    end

    % 返回当前工作表句柄
    Sheets = Excel.ActiveWorkbook.Sheets;    % Sheets = Workbook.Sheets;
    Sheet1 = Sheets.Item(m2);    % 返回特定表格句柄
    Sheet1.Activate;    % 激活特定表格

    %颜色初始化
    n=length(depnum);
    s1=strcat('A',num2str(m));
    s2=strcat('B',num2str(m));
    sall_a=strcat('A1:',s1);
    sall_b=strcat('B1:',s2);
    Sheet1.Range(sall_a).Interior.ColorIndex=0;
    Sheet1.Range(sall_b).Interior.ColorIndex=0;

    %颜色充填
    for i=1:n
        sa=strcat('A',num2str(depnum(i)));
        sb=strcat('B',num2str(depnum(i)));
    %     sc=strcat('C',num2str(depnum(i)));
    %     sd=strcat('D',num2str(depnum(i)));
        Sheet1.Range(sa).Interior.ColorIndex = 37;%37淡蓝
        Sheet1.Range(sb).Interior.ColorIndex = 37;
    %     Sheet1.Range(sc).Interior.ColorIndex = 37;
    %     Sheet1.Range(sd).Interior.ColorIndex = 37;
    end


    Workbook.Save   % 保存文档
    Excel.Quit   % 退出文档
    Excel.delete
end