--1~100���� �ݺ� ����ϴ� while
set serveroutput on

declare

i number;


begin

i:=1;--�ʱⰪ

while i<11 loop--���ǽ�

dbms_output.put(i||' ');
i:=i+1;--��.���ҽ�

end loop;

dbms_output.put_line(' ');

--1~100���� ����ϰ� 3�� ������� '¦'�� ���
i:=1;

while i<100 loop

if (mod(i,3)=0) then
dbms_output.put('¦');
else
dbms_output.put(i||' ');
end if;
i:=i+1;
end loop;
dbms_output.put_line(' ');




end;
/
