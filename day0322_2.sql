--distinct�� ����� �ߺ�����
--������̺��� �μ���ȣ�� ��ȸ
--��,���� �μ���ȣ�� ��ȸ���� �ʴ´�
--�������� ��ȸ�Ǵ� �÷��� ���� ���Ǵ��� error�� �߻����� �ʴ´�
select distinct deptno
from emp;


--group by�� ����� �ߺ�����
--�������� ��ȸ�Ǵ� �÷��� ���� ���Ǹ� ������ �߻��Ѵ�
select deptno
from emp
group by deptno;


--������̺��� ������� 3���� �ʰ��ϴ� �μ��� �μ���ȣ
select deptno,count(deptno)
from emp
group by deptno
having count(deptno)>3;

--group by�� �����Լ��� ����ϸ� �׷캰 ���踦 ���� �� �ִ�
--������̺��� �μ��� �ο���,�ְ���,��������,��տ����� ��ȸ
select  deptno,count(empno),max(sal),min(sal),ceil(avg(sal))
from   emp
group by  deptno
order by deptno;

--������̺��� �Ŵ����� �����ϴ� ����� 2�� �̻��� �Ŵ�����
--������� ��, ��տ���,��������,�ְ����� ��ȸ
--�Ŵ�����ȣ�� ������������ �����Ͽ� ��ȸ
select mgr, count(EMPNO),ceil(avg(sal)),min(sal),max(sal)
from emp
group by mgr
having count(empno)>=2
order by mgr desc;



--�׷캰 ���� ���
--������̺��� �μ��� �����հ� ������ ��ȸ
--rollup:�׷캰 �հ踦 ����ϰ�, ������ ���߿� ����Ѵ�.
select deptno,sum(sal)
from emp
group by rollup(deptno);

--cube:������ ���� ����ϰ�, �׷캰 �հ踦 ����Ѵ�.
select deptno,sum(sal)
from emp
group by cube(deptno);

--�Ұ�� ���հ踦 ��ȸ�� ��
--������̺��� �μ��� ������ ��,�Ұ�� ������ ��ȸ
select  deptno,job,sum(sal)
from emp
group by cube(deptno,job);

select  deptno,job,sum(sal)
from emp
group by rollup(deptno,job);


--������̺��� �Ŵ����� �μ��� �հ� �Ұ�,������ cube,rollup�� ����Ͽ� ��ȸ
select deptno
from   emp
group by  cube(mgr,deptno);
