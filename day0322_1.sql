select * from emp;


--������̺��� �����ȣ,�����,�μ���ȣ,�μ��� ��ȸ
--��,�μ����� �Ʒ�ǥ�� ���� �ѱ۷� �� �μ����� ���
select empno,ename,deptno,
			 case deptno when 10 then '���ߺ�'
			             when 20 then '����������'
			             when 30 then '���'
			 else '�౸��'
			 end  h_dname
from   emp;


--������̺��� �����ȣ,�����,����,�� ���ɾ�,������ ���ʽ��� ��ȸ
--��,������ ���ʽ��� �Ʒ��� ����.
--ClERK-������ 10%, SALESMAN-����+comm���� �ݾ��� 20%, MANAGER-������ 15%, ANANLYST-������ 30% PRESIDENT-������ 150%
select EMPNO, ENAME, SAL,sal+nvl(comm,0) total,
			 case job when 'CLERK' then sal*0.1
			      when 'SALESMAN' then (sal+nvl(comm,0))*0.2
            when 'MANAGER' then sal*0.15
						when 'ANALYST' then sal*0.3
						when 'PRESIDENT' then sal*1.5
						end job_bonus
from emp;


------------------Order by
--������̺��� �����ȣ,�����,����,�Ի��� ��ȸ
--��,���帶������ ����� ������� ��ȸ�� ��
select EMPNO, ENAME, SAL, HIREDATE
from emp
order by hiredate desc;

--������̺��� �����ȣ,�����,����,�Ի���,�μ���ȣ�� ��ȸ
--��,�μ���ȣ�� ������������ �����ϵ�,�μ���ȣ�� ���ٸ� ������ ������������ ����
--���� ������ ��� ������� ������������ ����
select EMPNO, ENAME, SAL, HIREDATE,DEPTNO
from emp
order by DEPTNO,SAl,ename;

--��� ���̺��� �����ȣ,�����,����,����,�μ���ȣ,�Ի����� ��ȸ
--��,������ ������������ �����ϵ�, ������ ���ٸ� ������ ������������ �����ϰ�,
--������ ���ٸ� �Ի����� ������������ ����
select EMPNO, ENAME, SAL, JOB, DEPTNO, HIREDATE
from emp
order by JOB desc,SAL,HIREDATE desc;



--------------------�����Լ�
--������̺��� �����ȣ,�����,����,������ ���� ��ȸ
--���� ������ �߻�. ���� ������ �߻��ϸ� �ǳʶ�
select EMPNO, ENAME, SAL,rank() over(order by sal)
from emp;

--���ϼ����� �߻����� �ʴ´�
select EMPNO, ENAME, SAL,row_number() over(order by sal)
from emp;

--�з��� ���� ����.partition by ���
--�����ȣ,�����,�μ���ȣ,����,������ ��ȸ
--������̺��� �μ����� ���� �������� ������ ��ȸ
select EMPNO, ENAME, DEPTNO, SAL,
row_number() over(partition by deptno order by sal) rank
from emp;

--������̺��� �����ȣ,�����,�μ���ȣ,�Ŵ�����ȣ,������ ��ȸ
--��, �Ŵ����� ���� �������� ���� ��ȸ(�ߺ������� �߻����� �ʴ´�.)
select EMPNO, ENAME, DEPTNO, MGR, SAL,
row_number() over(partition by mgr order by sal desc) rank
from emp;


----------------�����Լ�(�׷��Լ�)
--�÷����� ��� �ϳ��� ����� �Լ�
--������̺��� ��ü ������� ��ȸ
select count(empno)/*ename �������� ��ȸ�Ǵ� �÷������� ���Ǹ� ���� �߻�*/
from emp;

--count�� null�� �÷��� ���ؼ��� ���迡 �������� �ʴ´�
select count(comm) ,count(mgr)
from emp;

--������̺��� ��ü�����,���ʽ��� �޴� �����, ���ʽ��� ���� �ʴ� ����� ��ȸ
select count(EMPNO),count(comm),count(EMPNO)-count(comm)
from emp;

--������̺��� 1�⿡ ������ ����Ǵ� �Ѿ�,���ʽ��� ����Ǵ� �Ѿ�,��ü������ ��ȸ
--sum()�� ���� �÷��� ���� �� �ִ�.
select sum(sal),sum(comm),sum(sal)-sum(comm)
from emp;

--avg()�� �����÷��� ���� �� �ִ�
--������̺��� ��������� ��ȸ
select avg(sal),trunc(avg(sal),0),avg(comm)
from emp;

--max(),min() �����÷��� ���� �� �ִ�.
--������̺��� ������ �ְ�,������ �������� ��ȸ
select max(sal),min(sal)
from emp;


-------
--������̺��� ��տ������� ���� �޴� ����� �����ȣ,����� �Ի���,������ ��ȸ
--�����Լ��� ���������� ���� ����� �� ����
select EMPNO, ENAME, HIREDATE, SAL
from emp
where avg(sal)<sal;
