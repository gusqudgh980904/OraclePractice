--loop ���:�ּ� 1�� ���� �ִ� ���Ǳ��� �ݺ��ؾ� �� ��
set serveroutput on

declare
 i number;
begin

i:=1;
loop
dbms_output.put_line(i||'  ');
--Ż�������� �������� ������ ���� loop�� ����
exit when(i=5);
i:=i+1;
end loop;





end;
/
