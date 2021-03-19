--truncate table test1;
--alter table test1 add ssn char(14);

insert into test1(name,age,ssn,input_date) values ('����ȣ',24,'980904-1234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('��Ƽ����',45,'880403-5234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('������',26,'960812-2234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('������',27,'950101-1234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('������',24,'011103-4345367',sysdate);
insert into test1(name,age,ssn,input_date) values ('������',25,'911231-2234567',sysdate);
commit;
select *from test1;

--1. ������̺��� �����ȣ, �����,����, �Ŵ�����ȣ,����,
--   �Ի����� ��ȸ�ϼ���.
-- ��, �Ի����� ��-��-���� �������� ����ϼ���.
--    ������ 3�ڸ����� ,�� �־� ����ϼ���.
select EMPNO, ENAME, JOB, MGR, to_char(SAL,'9,999,999') sal,to_char(HIREDATE,'mm-dd-yyyy') hiredate
from emp;

--2. ������̺��� 3,4�б⿡ �Ի��� �������  �����ȣ,�����,����,����, �Ի����� ��ȸ�ϼ���.
select EMPNO, ENAME, SAL, JOB, HIREDATE
from emp
where to_char(hiredate,'q') in (3,4);


--3. ������̺��� �μ���ȣ, �����ȣ, ����, ���ʽ�, �Ѽ��ɾ�,
-- �Ի����� ��ȸ�ϼ���.
--   ��. �Ѽ��ɾ��� '����+����+���ʽ�'�� �ջ��� �ݾ�����
--   ��ȸ�ϼ���.  ������ ������ 12�� ���� ���� ������ �����Ͽ�
--   ����ϼ���.
select DEPTNO, EMPNO, SAL, COMM,sal+nvl(comm,0)+trunc(sal/12,-1) total, HIREDATE
from emp;

--4. ��� ���̺��� �μ���ȣ,�μ���,����, ���ʽ�, �μ�Ƽ�긦
--   ��ȸ�ϼ���.
--   �μ�Ƽ���  �Ʒ�ǥ�� ���� �μ����� ���� �����մϴ�.
--   10- ���޿� 100%, 20- ���޿� 150%, 30 - ���޿� 300%
--   �׿� ���޿� 50%
select DEPTNO, ENAME, SAL, nvl(COMM,0) comm,trunc(decode(deptno,10,(sal/12)*1,20,(sal/12)*1.5,30,(sal/12)*3,sal*0.5),1) insentive
from emp;

--5. test1 ���̺��� �̸� ,����,�¾��, �ֹι�ȣ,  ������ ��ȸ �ϼ���.
--   -������ �ֹι�ȣ��  8��° �ڸ��� ���ϰ�,
--   8��° �ڸ��� 1,3�̸� '����', 2,4�� '����' 5,6,7,8�̸� '�ܱ���'�׷���
--   ������ "����" �� ����Ѵ�.
--   -�¾�ش� ���̸� ����Ͽ� ���Ѵ�.
select NAME, AGE,2022-age birth, INPUT_DATE,SSN,decode(substr(ssn,8,1),1,'����',3,'����',2,'����',4,'����',5,'�ܱ���','����') gender
from test1;
