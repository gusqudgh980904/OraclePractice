--delete:�÷���� �������� ����
--�����ȣ�� �Է¹޾� CP_emp4���� ����
set serveroutput on

accept empno prompt '�����ȣ �Է�:';

declare

i_empno cp_emp4.empno%type:=&empno;

begin

delete from cp_emp4 where empno=i_empno;

if sql%rowcount>0 then

dbms_output.put_line(sql%rowcount||'�� ���� �Ǿ����ϴ�');
commit;
else
dbms_output.put_line(i_empno||'�� ����� �������� �ʽ��ϴ�. �����ȣ�� Ȯ���ϼ���');
end if;



end;
/
