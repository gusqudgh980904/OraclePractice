--update:�÷���� �������� �ٸ��� ����
--�����ȣ,�����,�μ���ȣ�� �Է¹޾� cp_emp4���̺��� �����ȣ�� ���� ���ڵ带 ����
set serveroutput on
set verify off

accept empno prompt '�����ȣ';
accept ename prompt '�����';
accept deptno prompt '�μ���ȣ';

declare
i_empno cp_emp4.empno%type:=&empno;
i_ename cp_emp4.ename%type:='&ename';
i_deptno cp_emp4.deptno%type:=&deptno;

row_cnt number;

begin
--update:�÷���� �������� ���� �ĺ��ǵ��� �������� �ٸ��� �����Ѵ�
update cp_emp4
set    ename=i_ename,deptno=i_deptno
where  empno=i_empno;

row_cnt:=sql%rowcount;
if row_cnt <>0 then
dbms_output.put_line(row_cnt||'�� ����');
commit;
--else
--rollback;
end if;

--commit�� ������ �� �Ͻ��� Ŀ�� (sql)�� �Ӽ���(rowcount)�� �������.
dbms_output.put_line(sql%rowcount);


end;
/

