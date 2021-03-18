--1. ��� ���̺��� '10' �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
--��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from emp
where deptno!=10 and sal between 1600 and 3000 ;
--2. ��� ���̺��� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
--����,���ʽ�, �Ѽ��ɾ�, ������ ��ȸ �ϼ���.
--������ ������ 12������ ���� �����մϴ�.
select EMPNO, ENAME, SAL, COMM,sal+comm total,sal/12 "MONTHLY_PAYCHECK"
from emp
where comm is not null;

--3.��� ���̺��� �μ���ȣ�� 10,30��  ������� �����, �����ȣ
--�Ի���, ������ ��ȸ �ϼ���.
--��, �����  xxxx�� xxxx����� xxxx�⿡ �Ի��Ͽ��� ������ xxx$�Դϴ�.
-- �� �������� �ϰ�, �÷����� output ���� �����Ұ�.
select EMPNO||'�� '||ENAME||'��'||HIREDATE||'�� �Ի��Ͽ��� ������ '||SAL||'$�Դϴ�' output
from emp
where deptNO in(10,30);




--4. ��� ���̺��� ������ 3000 �̸��� ������� �����ȣ, �����,
--   �Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from emp
where sal<3000;

--5. �Ʒ��� �����͸� �����Ͽ� test_like ���̺��� �÷��� �����ϰ�
--    ���ڵ带�߰��Ұ�.
--   �÷��� : ��ȣ, �̸�,�ּ�,��Ű���ϱ�
--    1, ����������,����� ���۱� �󵵵�,'�����'
--    2, ���븸,����� ���빮�� ���빮1��,'��Ÿ��'
--    3, ���¼�,����� ���빮�� ���빮2��,'�����'
--    4, �ڱ��,����� ���۱� �󵵵�,'������'
create table test_like(
num number(1),
name varchar2(15),
adress varchar2(50),
highschool varchar2(12)
);
select * from test_like;
insert into test_like values(1, '����������','����� ���۱� �󵵵�','�����');
insert into test_like values(2, '���븸','����� ���빮�� ���빮1��','��Ÿ��');
insert into test_like values(3, '���¼�','����� ���빮�� ���빮2��','�����');
insert into test_like values(4, '�ڱ��','����� ���۱� �󵵵�','������');

--6. test_like ���̺��� '�����'�� �����ϴ� �л���  ��ȣ,�л���,
--    �ּ�, �б������� �Ʒ���  ���� �������� ����ϰ�
--     �÷����� ��ҹ��� �����Ͽ� Output����  �Ұ�.
--    ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx
select '��ȣ'||NUM||',�̸�:'||name||', �ּ�:'||adress||', �б�'||highschool
from test_like
where adress like '�����%';

--7. ������̺��� ������� 4�����̰ų� ������ 3000�̻��� �����
--   �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ �Ұ�.
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from emp
where ename='____' or sal>=3000;

--8. ��� ���̺��� �����ȣ, �����, �Ի���, ����, ���⿬����
--    ��ȸ �ϼ���.
--    ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����Ұ�.
select EMPNO, ENAME, HIREDATE, SAL,sal+SAL*0.07 nextyearsal
from emp;

--9. ��� ���̺��� ������� 5�����̸鼭 ����° ���ڿ� 'A'�� ���
--    �� ����� �����, �����ȣ, �Ի���, ����,  �� ���ɾ�, ���ļ��ɾ��� ��ȸ�ϼ���.
--   ��, �� ���ɾ��� ����+���ʽ��� �ջ� �ݾ��̰�, ���ļ��ɾ��� �� ���ɾ׿���
--    3.3%�� ������ �Ǽ��ɾ��� ����Ѵ�.
select ENAME, EMPNO, HIREDATE, SAL, SAL+comm total,(sal+comm)-(sal+comm)*0.033 "���ļ��ɾ�"
from emp
where ename like '__A__';


--10. ��� ���̺��� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
--     ����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �Ұ�.
select ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600;
select * from  emp;
