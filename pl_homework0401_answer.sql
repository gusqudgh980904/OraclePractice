set serveroutput on
set verify off

accept mgr prompt '�Ŵ�����ȣ:';

declare
--�����ȣ,�����,�μ���ȣ,�Ի���,����
type emp_rec is record(EMPNO emp.empno%type,ename emp.ename%type,deptno emp.deptno%type,hiredate emp.hiredate%type,sal emp.sal%type);

--���ǵ� ���ڵ带 ������ �� �ִ� table�� ����(���ϳ��� ��ȸ�� ���ڵ� 1�� ����)
type emp_tab is table of emp_rec index by binary_integer;

--���ϳ��� ��ȸ�� ���ϳ��� ������ �� �ִ� emp_table�� ����Ͽ� table������ ����
emp_data emp_tab;
--record ���� ����
ed emp_rec;


--1.Ŀ�� ����
cursor cur_emp is
	select empno,ename,deptno,hiredate,sal
	from emp
	where mgr=&mgr;

--�ε�����
idx number:=0;

--�μ��� �����
dname varchar2(30):='�������';


begin
-------------------������ó�� ����
--2.Ŀ������
if cur_emp%isopen then
close cur_emp;
end if;

open cur_emp;

--3.����:����� ���ڵ带 table�� �濡 ��´�
loop
  idx:=idx+1;
	fetch cur_emp into emp_data(idx);
	exit when(cur_emp%notfound);


end loop;



--4.�ݱ�
close cur_emp;
-------------------������ó�� ��

-------------------Viewó�� ����
if idx=1 then
dbms_output.put_line(&mgr||'�� �Ŵ����� �����ϴ� ����� ���ų�, �Ŵ����� �����ϴ�');
end if;

for i in 1..emp_data.count loop
--���ڵ庯���� ���ϳ��� ��ȸ�� ���̺��� �������� �ֱ�
ed:=emp_data(i);

--PL/SQL������ decode�Լ��� ����� �� ����
--�μ����� 10�� �μ����� �� ���ߺ�, 20 - ��������, 30 - ���� �� �ܴ� ����������� ����մϴ�.
if ed.deptno=10 then
dname:='���ߺ�';
elsif ed.deptno=20  then
dname:='��������';
elsif ed.deptno=20   then
dname:='������';
else
dname:='�������';
end if;

dbms_output.put_line(ed.empno||'/'||ed.ename||'/'||ed.deptno||'/'||to_char(ed.hiredate,'yyyy-mm-dd')||'/'||ed.sal||'/'||dname);

end loop;

-------------------Viewó�� ��
exception
when invalid_cursor then
dbms_output.put_line('Ŀ���� �߸��� ���� ����');
when others then
dbms_output.put_line('�������� ���� ����:'||sqlerrm);

end;
/
