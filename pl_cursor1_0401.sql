--dept���̺��� ��� �μ������� ��ȸ
set serveroutput on

declare
	--Ŀ������ ����� ���� ������ ����
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc		 dept.loc%type;

	dept_row dept%rowtype;

	--1.Ŀ���� ����:cursor Ŀ���� is select,,,;
cursor cur_dept
 is select DEPTNO, DNAME, LOC  from dept;



begin

	open cur_dept;

 if cur_dept%isopen then
 --Ŀ���� �����ִٸ� �ݱ�
     close cur_dept;

 end if;

 --2.Ŀ������:open Ŀ����;
 open cur_dept;

 --3.����:Ŀ���� ��ġ�� ���� �÷����� ��� ��:fetch Ŀ���� into �÷���,,,;
	loop
--	fetch cur_dept into DEPTNO, DNAME, LOC;
	fetch cur_dept into dept_row;
	--����� ���ڵ尡 ���� ���� ������ �ݺ����� ����������
	exit when(cur_dept%notfound);
	--����� ���ڵ尡 �����ϸ�
--	if cur_dept%found  then
--	dbms_output.put_line(DEPTNO||'/'||DNAME||'/'||LOC);
--	end if;
    dbms_output.put_line(dept_row.DEPTNO||'/'||dept_row.DNAME||'/'||dept_row.LOC);
	end loop;

	--4.Ŀ���ݱ�
	close cur_dept;

	exception
	when invalid_cursor then
		dbms_output.put_line('Ŀ���� �߸��� ������ ����');
	when others then
		dbms_output.put_line('��������');




end;
/
