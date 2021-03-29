select * from dba_sys_privs
where grantee='SCOTT';

--scott������ �ó�� ���� �ο�
grant create synonym to scott;

--scott������ �ó�� ���� ȸ��
revoke create synonym from scott;

--synonym ����
--car_model ���̺��� 'cmo'��� �̸��� synonym�� �ο�
create synonym cmo for car_model;

--synonym�� ��ȸ�ϴ� Data Dictionary
select * from user_synonyms;

--synonym����
select * from cmo;

--���� ���̺�� ���
select * from car_model;



----------------------view
select * from user_views;

grant create view to scott;
revoke create view from scott;

select * from dba_sys_privs
where grantee='SCOTT';

--�ܼ���/CP_EMP4���̺��� ����� �ܼ� �� ����:view�̸�-view_test
create view view_emp
as select * from CP_EMP4;

select * from user_views;

--view�� ����� ��ȸ
select * from view_emp;
--���� ���̺� ��ȸ
select * from cp_emp4;

--�������̺� �۾��� �ϸ� view�� �ٷ� �ݿ� �ȴ�
insert into cp_emp4(empno,ename,deptno,job,hiredate)
values (1234,'����ȣ',10,'���',sysdate);

update cp_emp4
set    deptno=20,job='�븮'
where  empno=1234;

--�ܼ� View �۾�
insert into view_emp(empno,ename,deptno,job,hiredate)
values (1234,'����ȣ',10,'���',sysdate);

update view_emp
set    deptno=20,job='�븮'
where  empno=1234;

select * from cp_emp4;
																														
--view ����
drop view view_emp;

select * from user_views;

--���պ�:�������� ���̺�� ���� �� ��
create table cp_dept as select * from dept;
--cp_dept ���̺��� �μ���ȣ �÷� pk  ����
alter table cp_dept add constraint pk_cp_dept primary key(deptno);
--cp_emp4���̺��� deptno�÷��� FK�� ����
alter table cp_emp4 add constraint fk_cp_emp4 foreign key(deptno) references cp_dept(deptno);

select * from user_constraints
where table_name in ('CP_DEPT','CP_EMP4');

create view emp_date as
select cd.deptno,cd.dname,loc,ce4.empno,ce4.ename,ce4.job,ce4.hiredate
from  cp_emp4 ce4,cp_dept cd
where ce4.deptno(+)=cd.deptno;

--view��ȸ:�ܼ������� join�� ����� ����� �� �ִ�
select * from emp_date;

--�������̺� �μ����� �߰�
insert into cp_dept(deptno,dname,loc) values(50,'���ߺ�','����');
commit;

--�������̺� �μ����� �߰�
insert into cp_emp4(empno,ename,deptno,job,hiredate)
values (1111,'������',50,'�븮',sysdate);

--����View���� insert,update,delete �� �ȵ�
insert into emp_date(deptno,dname,loc) values(50,'���ߺ�','����');

--view����
