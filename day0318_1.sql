-----rollback����

--create table test1(
name varchar2(15),
age number(3)
);


insert into test1(name,age) values('����ȣ',24);
select*
from test1;
commit;

insert into test1(name,age) values('�����',25);
update test1
set    age=24
where  name='�����';

rollback;


-----------------savepoint ���
savepoint insert_a;
insert into test1(name,age) values('��ī��',150);

savepoint update_b;
update test1
set    age=26
where  name='��ī��';

savepoint delete_c;
delete from test1
where name='��ī��';

select *
from test1;

rollback to delete_c;




------------select--------------
--��� ���̺��� �����ȣ,�����,����,���ʽ�,�Ѽ��ɾ� ��ȸ
--��,�Ѽ��ɾ��� ����+���ʽ� �� �ݾ�

select empno,ename,sal,comm,sal+comm totalsal
from emp;


----------alias---------
--�÷��� alias,�÷��� as alias
--��ҹ��� ���� �÷��� "alias"]
--���� �÷��� ������ ��ȸ�ϸ� _1,_2,_3,,,���� alias�� �ڵ� �ο���
select   DEPTNO d_No, DNAME as dn, LOC "Loc",loc "��ġ",loc "L O C"
from dept;

--�÷����� alias�� where ������ ����� �� ����.
select deptno dno, DNAME
from dept
where deptno=10;


--�μ����̺��� �μ���ȣ,�μ���,��ġ ��ȸ
--��, �μ���ȣ�� ����μ���ȣ���� -3�� ������ ������ ��ȸ
select  DEPTNO,DEPTNO-3 new_deptno, DNAME, LOC
from dept;


--��������ڰ� �ƴ� �ٸ� �����ڴ� ��ȸ�ϴ� �÷����� �� �� ����
select empno>10
from emp;


--���������� ���
--������̺��� ����� '��'�� �ٿ��� ��ȸ
select   ename||'��','��'||ename ,empno||ename
from emp;

--������̺��� �����ȣ,�����,������ ��ȸ
--��,��ȸ������ �����(�����ȣ)���� ������ XX$�Դϴ�.�� ��ȸ�ϰ�
--�÷����� output���� ����
select   ename||'('||empno||') ���� ������'||sal||'%�Դϴ�' output
from emp;


--������̺��� �����ȣ,�����,����,����,������ ��ȸ
--��,������ �������� 3.3%�� ����Ͽ� ���
--���ݰ���� �÷����� alias�� ���
select   EMPNO, ENAME, JOB,sal,sal*0.033 "Tax"
from emp;


--������̺��� �����ȣ,�����ȣ���,����� ��ȸ
--��,�����ȣ����� ¦����0�� Ȧ���� 1�� ��ȸ
select EMPNO,mod(empno,2) empno_result,ENAME
from  EMP ;

