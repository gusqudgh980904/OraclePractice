--������̺��� 10�� �μ��� �ٹ��ϴ� ������� �����ȣ,�����,�����ʹ�ȣ,������ȸ,�μ���ȣ
select  EMPNO , ENAME, MGR, SAL, DEPTNO
from  emp
where deptno=10;


--������̺��� 10�� �μ��� �ƴ� �μ�������� �����ȣ,�����,�Ŵ�����ȣ,�Ի��� ��ȸ
select EMPNO, ENAME, MGR, HIREDATE,DEPTNO
from   emp
where  deptno<>10;--<>�� !=�� ����
--where  deptno!=10;


--������̺��� ������ 1600�̻��� ������� �����ȣ,����,�����,����,�Ի��� ��ȸ
select  EMPNO, SAL, ENAME, JOB, HIREDATE
from emp
where sal>=1600 ;
--where sal>1599;


--������̺��� ������ 1600�̻� 3000������ ����� �����,�����ȣ,����,����
select   ENAME, EMPNO, SAL, JOB
from emp
where sal between 1600 and 3000;
--where sal>=1600 and sal<=3000 ;


--������̺��� 7902,7698,7566 �Ŵ����� �����ϴ� ����� �����ȣ,�����,�Ŵ��� ��ȣ,�Ի���,���� ��ȸ
select   EMPNO , ENAME, MGR, HIREDATE, JOB
from emp
where mgr in(7902,7698,7566);--�����ϴ�
--where mgr not in(7902,7698,7566);--�������� �ʴ�
--where mgr=7902 or mgr=7698 or mgr=7566;


--������̺��� ���ʽ��� �޴� ������� �����ȣ ,����,���ʽ�,�����,����
--null�� ���迬���ڷ� ���� �� ����
--is null,is not null
select EMPNO, SAL, COMM, ENAME, JOB
from emp
--where comm>=0
where comm is not null;


--������̺��� ������� 'allen'�� ����� �����ȣ,�����,�Ի���,����,�μ���ȣ�� ��ȸ
select EMPNO, ENAME, HIREDATE, JOB, DEPTNO
from 		emp
--where ename='ALLEN';
where ename like 'ALLEN';

--������̺��� ������� 'A'�� �����ϴ� ������� �����,����,����,�Ի��� ��ȸ
select ENAME, SAL, JOB, HIREDATE
from	 emp
where	 ename like 'A%';

--������̺��� ������� 'S'�� ������ ������� �����,����,�����ȣ,�Ŵ�����ȣ,�Ի����� ��ȸ
select ENAME, SAL, EMPNO, MGR, HIREDATE
from emp
where ename like '%S';

--������̺��� ����� 'A'�� ����ִ� ������� �����,����,�����ȣ, �Ի��� ��ȸ
select ENAME, SAL, EMPNO, HIREDATE
from emp
where  ename like '%A%';

--������̺��� ����� 'L'�� �ΰ� �ִ� ������� �����,�Ŵ�����ȣ,������ ��ȸ
select ENAME, MGR, JOB
from emp
where ename like '%L%L%';

--������̺��� ������� 5������ ����� ������� ��ȸ
select ename
from emp
where ename like '_____';

--������̺��� �̸��� 5�����̸鼭 �ι�° ���ڰ� 'O'�� ����� �����ȣ,�����,�Ի���,������ ��ȸ
select EMPNO, ENAME, HIREDATE, SAL
from emp
where ename like '_O___';
