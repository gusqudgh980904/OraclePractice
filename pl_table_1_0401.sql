--���ϳ��� ��ȣ�� �̸��� ������ �� �ִ� table ����
set serveroutput on


declare
--record ����
type data_rec is record(num number,name varchar2(30));
--recodr�� ����Ͽ� ���̺� ����
type data_tab is table of data_rec index by binary_integer;
--table�� ����Ͽ� ���� ����
data data_tab;


begin

--�� �Ҵ�
data(1).num:=1;
data(1).name:='���μ�';

data(2).num:=2;
data(2).name:='������';

data(3).num:=3;
data(3).name:='�ڱ��';

dbms_output.put_line(data.count||'��');
--��� ���� �� ���
for i in 1..data.count loop
dbms_output.put_line('��ȣ:'||data(i).num||',�̸�:'||data(i).name);
end loop;


end;
/
