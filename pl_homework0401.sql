--	     ���� 1. �Ŵ��� ��ȣ�� �Է¹޾� �Ŵ����� �����ϴ� ��� ������ emp���̺���
--	       ��ȸ�ϴ� PL/SQL�� �ۼ��ϼ���.
--
--	     ��ȸ �÷��� �����ȣ,�����,�μ���ȣ, �Ի���, ������ ��ȸ�ϼ���.
--
--	     ��, ��ȸ�ϴ� �ڵ�� ����ó�� �ڵ带 �����Ͽ� �ڵ� �մϴ�.
--	        �ݺ��� �ϳ������� Ŀ������ ������ �����͸� table�� �����ϴ� �۾��� �����ϰ�,
--	        ���̺� ����� �����͸� ����ϱ� ���ؼ�  �ݺ����� �ϳ� �� �����մϴ�.
--	        table�� ����Ͽ� ����ϴ� �ڵ忡���� '�����ȣ,�����,�μ���ȣ, �μ���, �Ի���,����'��  ����մϴ�.
--	       �μ����� 10�� �μ����� �� ���ߺ�, 20 - ��������, 30 - ���� �� �ܴ� ����������� ����մϴ�.
set serveroutput on
set verify on

accept mgr prompt '�Ŵ�����ȣ �Է�:';

declare

--���ڵ弱��
type emp_rec is record(EMPNO emp.empno%type,ename emp.ename%type,deptno emp.deptno%type,hiredate emp.hiredate%type,sal emp.sal%type);

--���̺���
type emp_tab is table of emp_rec index by binary_integer;

--���̺� ���� ����
et emp_tab;

--Ŀ������
cursor cur_emp is
select empno, ENAME,deptno, hiredate, SAL
from emp
where mgr=&mgr;


--mgr_v emp.mgr%type:=&mgr ;
--empno_v  emp.empno%type;
--ename_V emp.ename%type;
--deptno_v emp.deptno%type;
--hiredate_v emp.hiredate%type;
--sal_v emp.sal%type;

begin

--2.����
if cur_emp%isopen then
	close cur_emp;
	end if;

	open cur_emp;

	--3.����
	loop

	fetch cur_emp into et(1);

	exit when(cur_emp%notfound);


	end loop;

	--4.�ݱ�
	close cur_emp;

  



end;
/
