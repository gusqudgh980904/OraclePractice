--union: ���� �ٸ� ���̺� ��,�Ʒ��� �����Ͽ� ��ȸ
--emp:�ѱ����� �������,cp_emp1:�̱����� �������
--����� ���� ��������� ��ȸ
--��ȸ�÷��� �����ȣ,�����,����,����

--union:�ߺ������͸� ��ȸ���� �ʴ´�
select EMPNO, ENAME, JOB, SAL
from emp
union
select EMPNO, ENAME, JOB, SAL
from cp_emp1;

--union all:�ߺ������͸� ��ȸ�Ѵ�
select EMPNO, ENAME, JOB, SAL
from emp
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1;

--����
--�÷��� ���������� ��ġ���� �ʴ°��
--union:�ߺ������͸� ��ȸ���� �ʴ´�
select EMPNO, ENAME, sal, job
from emp
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1;

--�÷��� ������ ��ġ���� �ʴ� ���
--union:�ߺ������͸� ��ȸ���� �ʴ´�
select EMPNO, ENAME, JOB, SAL
from emp
union all
select EMPNO, ENAME, JOB
from cp_emp1;

--������ȸ
--union:�ߺ������͸� ��ȸ���� �ʴ´�
select EMPNO, ENAME, JOB, SAL
from emp
where deptno=10
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1
order by sal desc;
