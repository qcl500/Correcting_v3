function interp_inside(finname,tname,in)
    a=xlsread(finname,tname);
    x=a(:,1);%���ݱ��һ��Ϊxֵ
    y=a(:,2);%���ݱ�ڶ���Ϊyֵ

    x1=min(x):in:max(x);%�����µ�x1�ȼ��������
    y1=interp1(x,y,x1,'linear');%�����µ�y1�ȼ��������.����:���Բ�ֵ
    out=[x1;y1]';%�������������
    xlswrite(finname,out,'interp_out');
   
    figure %ͼ����ʾ��ԭʼ���ݺ�ɫ��������ֵ������Ϊ��ɫ��
    plot(x,y,'k',x1,y1,'r.')
end
