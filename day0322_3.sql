--------------create subquery
--���̺��� ������ ��(��ȸ�� ����� ����Ͽ� ���̺��� ������ ��)
--��õ�����Ϳ��� �ʿ��� �����͸� �����Ͽ� ������ ��

--������̺��� �μ���ȣ�� 10�� 30���� �μ������ �����ȣ�ѻ����, �μ���ȣ, ����,������ ��ȸ�ϰ�
--cp_emp1���̺��� �����Ͽ� �߰��ϼ���
create table cp_emp1 as
(select empno,ename,deptno,job,sal
from emp
where deptno in(10,20));


--DBMS���� ��ϱ� ���� ������ �����ϴ� ���̺��� Data Dictionary��� �Ѵ�
--DD�� ����ڰ� ���� insert,update,delete�� �Ҽ� ����, �۾��ϴ� ������ ���� �ڵ�����
--insert,update,delete�� ����ȴ�
--DD�� ����ڰ� select�� �����ϴ�
--��������� Ȯ���� �� �ִ� DD�� user_constraints�̴�
select * from user_constraints
where table_name='EMP';

select *from cp_emp1;
--cp_emp1���̺��� �÷���,��������,ũ��,���ڵ�� dmp���� �״�� ����Ǿ����� ��������� ������� ����
select *from user_constraints;

--������̺��� �����ȣ,�����,����,����,�Ŵ�����ȣ,�Ի����� ��ȸ�ϰ�
--inline view�� ����Ͽ� cp_emp2���̺��� �����ϼ���
create table cp_emp2 as
(select EMPNO, ENAME, JOB, SAL, MGR, HIREDATE
from emp);

select *from cp_emp2;

--������̺��� �����ȣ,�����,����,�Ŵ�����ȣ,�Ի���,������ �÷���,��������
--ũ�⸦ �״�� ���� cp_emp3���̺��� ������ ������(���ڵ� ���� ���̺��� ������ ����)
create table cp_emp3 as
(select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from emp
where 1=0);

select *from cp_emp3;

------------insert subquery
--�ܼ���:�ٸ��÷��� ���� ����Ͽ� ���ڵ带 �߰��Ҷ�
--cp_emp1 ���̺� �Ʒ��� ���� ��������� �߰�
--�����ȣ:1212,�����:����ȣ,�μ���ȣ:15
--job(����):�븮,����:emp���̺��� �����ȣ�� 7788�� ����� ������ ����
insert into cp_emp1(empno,ename,deptno,job,sal)
values(1212,'����ȣ',15,'�븮',(select sal from emp where empno=7788));

commit;



----cp_emp1 ���̺� �Ʒ��� ���� ��������� �߰�
--�����ȣ:1213,�����:���й�,�μ���ȣ:emp���̺��� �����ȣ�� 7369�� ����� ������ �μ���ȣ�� �߰�
--job(����):emp���̺��� ������� JONES�� ����� ���� ���� ,����:emp���̺��� �����ȣ�� 7521�� ������� 100���� ����
insert into cp_emp1(empno,ename,deptno,job,sal)
values(1213,'���й�',(select deptno from emp where empno=7369),(select job from emp where ename='JONES')
 ,(select sal+100 from emp where empno=7521));
 commit;
select * from cp_emp1;