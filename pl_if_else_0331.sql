--���� �Է¹޾� 'Ȧ��'���� '¦��'���� ����ϴ��ڵ�
set serveroutput on
set verify off

accept num prompt '���ڸ� �Է�:';
accept name prompt '�̸��� �Է�:';

declare

num number:=&num;
--�̸��� ������ ���� ����
name varchar2(30):='&name';

begin

dbms_output.put(num||'��(��)');

if mod(num,2)=0 then
dbms_output.put_line('¦��');
else
dbms_output.put_line('Ȧ��');
end if;

--�̸��� '������'��� '����'�� ����ϰ�,�׷��� ������ '���'�� ����� ��
--�̸��� ���

dbms_output.put(name||'��(��)');

if name='������' then
dbms_output.put_line('����');
else
dbms_output.put_line('���');
end if;

end;
/
