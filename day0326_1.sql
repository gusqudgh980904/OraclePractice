------------------join
--�μ��� ����� �����ϴ� ��쿡��
--�����ȣ,�����,�Ի���,�μ���ȣ,�μ���,��ġ ��ȸ
--ANSI
--�������̺� �����ϴ� �÷��� �÷����� ����� �� ���̺��.�÷����� ���
select EMPNO,ENAME,HIREDATE,emp.DEPTNO,dname,loc
from  dept
inner join emp
on emp.deptno=dept.deptno;

--Oracle
select EMPNO,ENAME,HIREDATE,e.DEPTNO,dname,loc
from dept d,emp e
where e.deptno=d.deptno;

--�÷��� � ���̺� �����ϴ��� �� �� �ֵ��� �÷��� �տ� ���̺���� ����Ͽ����
--��ȸ�÷��� �ۼ��ϴ� �ڵ����� ������
select emp.EMPNO,emp.ENAME,emp.HIREDATE,emp.DEPTNO,dept.dname,dept.loc
from  dept
inner join emp
on emp.deptno=dept.deptno;

--���̺�� alias�� �ο��Ͽ� �÷��� ���� ���̺��� ����ϰ�,ª���ڵ�� ��밡��
--���̺�� alias�� �ο�:���̺�� alias
select e.EMPNO,e.ENAME,e.HIREDATE,e.DEPTNO,d.dname,d.loc
from  dept d
inner join emp e
on e.deptno=d.deptno;


--������ 1000�̻� 3000������ ������� �����ȣ,�����,����,�Ի���,�μ���ȣ,�μ���,��ġ�� ��ȸ
--ANSI
select  e.EMPNO, e.ENAME, e.SAL, e.HIREDATE, d.DEPTNO, d.DNAME, d.LOC
from 			emp e
inner join dept d
on  			e.deptno=d.deptno
where     e.sal between 1000 and 3000
order by sal;

--Oracle
select  e.EMPNO, e.ENAME, e.SAL, e.HIREDATE, d.DEPTNO, d.DNAME, d.LOC
from emp e,dept d
where (e.deptno=d.deptno) and e.sal between 1000 and 3000
order by e.sal;


--�������� �������� ��ⷮ�� 1600�̻� 3000������
--������ ������,�𵨸�,���,��ⷮ,������ ��ȸ
--ANSI
select  k.MAKER, k.MODEL, CAR_YEAR, CC, PRICE
from car_maker k
inner join car_model m
on    k.model=m.model
where  cc between 1600 and 3000;
--order by price desc;

--Oracle
select k.MAKER, k.MODEL, CAR_YEAR, CC, PRICE
from  car_maker k,car_model m
where k.model=m.model and m.cc between 1600 and 3000;

--���̺� 3�� join
--�����ȣ,�����,����,�μ���ȣ,�μ���,��ġ,�����ȣ,�õ�,����,��
--������̺��� �����ȣ�� �����ȣ���̺��� seq�� ������������ ���

--ANSI
select      e.empno,e.ename,e.sal,d.deptno,d.dname,d.loc,
				    z.zipcode,z.sido,z.gugun,z.dong
from    		dept d
inner join  emp  e
on          e.deptno=d.deptno
inner join  zipcode z
on          z.seq=e.empno;

--Oracle
select   e.empno,z.seq,e.ename,e.sal,d.deptno,d.dname,d.loc,
				z.zipcode,z.sido,z.gugun,z.dong
from     dept d,emp e,zipcode z --inner join
where    (e.deptno=d.deptno and z.seq=e.empno); --on
