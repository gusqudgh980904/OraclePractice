--table ���
set serveroutput on


declare
--1.���̺���)���ڿ��� ������ �� �ִ� ���̺� ����
type name_tab is table of varchar2(30) index by binary_integer;
type age_tab is table of number index by binary_integer;
--2.����� ���̺� ���������� ����Ͽ� ���� ����)
names name_tab;
ages age_tab;

cnt number:=0;

begin

--3.�� �Ҵ�:������(�ε���):=��;
names(1):='���μ�';
names(2):='������';
names(3):='�ڱ��';
names(4):='��ȣ��';
names(5):='������';
names(6):='������';
dbms_output.put_line('���̺��� ���� ��'||names.count);
--4.�����:������(�ε���)
--dbms_output.put_line(names(2));
for i in 1 ..names.count loop
 dbms_output.put_line(names(i));

-- if substr(names(i),1,1)='��%'  then
 if names(i) like '��%' then
 cnt:=cnt+1;
end if;

 end loop;

--'��'���� �ο����� ���
dbms_output.put_line('������ '||cnt||'��');


----------number�� ������ ���̺� ���
--�� �Ҵ�
ages(1):=26;
ages(2):=25;
ages(3):=28;
ages(4):=30;
ages(5):=24;

--�����
--������ �������
for i in 1..ages.count loop
dbms_output.put_line(ages(i)||'��');
end loop;


end;
/
