--�¾ �ظ� ������ �����ϰ�, ������ ����Ͽ� ���� ���ϱ�
set serveroutput on

declare
--��������
birthyear number(4);

begin
--���Ҵ�
birthyear:=1998;


dbms_output.put_line(2021-birthyear+1);

--Error:���迬���ڴ� ����� �� ����.
--dbms_output.put_line(2021>birthyear);
end;
/
