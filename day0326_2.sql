--outer join(�������̺��� ���ڵ尡 �����ϴ��� ��ȸ����)
--�����ϴ� ��� �μ��� �μ���ȣ,�μ���,��ġ,�����ȣ,������� ��ȸ

--ANSI
select d.deptno,d.dname,d.loc,e.empno,e.ename
from  dept d
left outer join emp e
on e.deptno=d.deptno;

--Oracle
--(+)��ȣ�� ���ڵ尡 ���� Ȥ�� �ڽ����̺� ���δ�
select  d.deptno,d.dname,d.loc,e.empno,e.ename
from  	dept d,emp e
where   d.deptno=e.deptno(+);

--���ڵ尡 �������� �ʴ� ���̺��� �����ϸ� ��ȸ����� ������ ����
select d.deptno,d.dname,d.loc,e.empno,e.ename
from  dept d
right outer join emp e
on e.deptno=d.deptno;

--Oracle
--���ڵ尡 �����ϴ� �÷��� (+)��ȣ�� ���̸� inner join�� ����
select  d.deptno,d.dname,d.loc,e.empno,e.ename
from  	dept d,emp e
where   d.deptno(+)=e.deptno;

--���ڵ��� ������ �� ������ ��� ���ڵ带 ��ȸ�ؾ��Ѵٸ� full outer join
select d.deptno,d.dname,d.loc,e.empno,e.ename
from  dept d
full join emp e
on e.deptno=d.deptno;

--Oracle
--(+)��ȣ�� ���ʿ� ���� �� ����
select  d.deptno,d.dname,d.loc,e.empno,e.ename
from  	dept d,emp e
where   d.deptno(+)=e.deptno(+);


--��� �μ��� �ٹ��ϴ� ������� �μ���ȣ,�μ���, �����ȣ,�����,�����ȣ,�õ�,����,��,������ ��ȸ
--��,�μ��� �ٹ��ϴ� ����� �������� ������ �����ȣ�� '0'���� �����'����'�� ��� ��ȸ�Ѵ�
--ANSI
select  d.DEPTNO, d.DNAME, nvl(e.empNO,0) empno,seq,nvl(e.ENAME,'����') ename, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from            dept d
left outer join emp e
on  			d.deptno=e.deptno
left outer join zipcode z
on 				e.empno=z.seq;

--Oracle
select d.DEPTNO, d.DNAME, nvl(e.empNO,0) empno,nvl(e.ENAME,'����') ename, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from  dept d,emp e,zipcode z
where (d.deptno=e.deptno(+) and e.empno=z.seq(+));



-- -------------------------------------------------------
--������̺��� ������� 'WARD'�� ������� ������ ���� �����ϴ� �����
--�����ȣ,�����,����,����,�Ի���
--�ܼ��� ��������
select EMPNO, ENAME, SAL, JOB , HIREDATE
from emp
where (select sal from emp where ename='WARD')<sal
order by sal desc;

--self join:��ȸ�� ���̺�� ���ǿ� ���̺��� �� �����Ͽ� ����
select e1.EMPNO, e1.ENAME, e1.SAL, e1.JOB , e1.HIREDATE ,e2.ename
from emp e1,emp e2
where (e1.sal>e2.sal) and e2.ename='WARD';

--���������� �߸� �����ϸ� ��� ���ڵ��� ���� ��ȸ�Ǿ� ������ Cartisian Product�� �߻�
select  e.empno,e.ename,d.deptno,d.dname
from dept d,emp e;
