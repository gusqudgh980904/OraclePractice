--����1.
-- ��� ���̺��� ������ 1500~3000������ �����
--  �����ȣ, �����, ����, �Ի���, �μ���ȣ, ����,�Ŵ�����ȣ�� ��ȸ�Ͽ�
--  emp_work���̺� �����Ͽ� �߰��մϴ�.
create table emp_work as
(select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB,mgr
from emp
where sal between 1500 and 3000);




--����2.
--  emp���̺��� 10�� 30�� �μ��� ��� ������ ��ȸ�Ͽ� emp_work���̺�
--  ��ȸ ����� �߰��մϴ�.
--   ��, �����ȣ�� ��ȸ�� �����ȣ�� 1000�� ���� ������ �߰��� ��.
insert into emp_work
(select EMPNO+1000 empno, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from emp
where deptno in (select deptno from emp where deptno in (10,30)));


--���� 3.
-- emp_work ���̺��� 10�� �μ��� �ٹ��ϴ� ������� ������  emp���̺���
--  �����ȣ�� 7369�� ��� ������ 7782�� ����� ������ ���� �ݾ����� �����ϼ���.
update  emp_work
set     sal=(select sal from emp where empno=7369)+(select sal from emp where empno=7782)
where deptno=10;
select * from emp_work;
select sal from emp where empno in (7369,7782);
--����4.
-- �����簡 '����'���� ���� ������ �𵨸�, ����, ����, �ɼ�, �Է����� ��ȸ�ϼ���.
--   ��, ������ ������������ ���� ���� �� 2~5��° ���ڵ常 ��� �մϴ�.
select rn,MODEL, CAR_YEAR, PRICE, CAR_OPTION,HIREDATE
from (select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE,row_number() over (order by price desc) rn from car_model
where model in(select model from car_maker where maker='����'))
where rn between 2 and 5
;




select*from car_maker;
select*from car_model;
