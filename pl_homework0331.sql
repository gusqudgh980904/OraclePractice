--����.
--1.  �����ȣ, �����,����,�Ŵ�����ȣ, ������ �Է� �޾� CP_EMP3���̺� insert �ϴ� PL/SQL�� �ۼ��ϼ���.
--
--  �������
--  -�Էµ� �����ȣ�� 1000~2000 ���̰� �ƴ϶�� 999�����θ� �߰��մϴ�.
--  -������ ���Ѽ��� 5000�Դϴ�. 5000 �̻��� �ԷµǾ��ٸ� 5000���� �߰��մϴ�.
--  -������ 'CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT' �� �� �߰��� ��
--   �ֽ��ϴ�. �Էµ� ������ �ش� ������ �ƴ϶�� 'CLERK' ���θ� �߰��˴ϴ�.
--
--  �߰� �����ϸ� �߰� ������ row�� ������ �޽����� ����� �� transaction�� �Ϸ� �մϴ�.
set serveroutput on
set verify off

accept empno prompt '�����ȣ �Է�:';
accept ename prompt '����� �Է�:';
accept job prompt '���� �Է�:';
accept mgr prompt '�Ŵ�����ȣ �Է�:';
accept sal prompt '���� �Է�:';



declare

empno cp_emp3.empno%type:=&empno;
ename cp_emp3.ename%type:='&ename';
job cp_emp3.job%type:='&job';
mgr cp_emp3.mgr%type:=&mgr;
sal cp_emp3.sal%type:=&sal;

row_cnt number;

begin


if &empno between 1000 and 2000 then
empno:=&empno;
else
empno:=999;
end if;

if &sal>=5000 then
sal:=5000;
end if;

if job in ('CLERK') then
job:='CLERK';
elsif job in('SALESMAN') then
job:='SALESMAN';
elsif job in('MANAGER')  then
job:='MANAGER';
elsif job in('ANALYST')  then
job:='ANALYST';
elsif job in('PRESIDENT')  then
job:='PRESIDENT';
else
job:='CLERK';
end if;

insert into cp_emp3(EMPNO, ENAME, JOB, MGR, SAL )
values             (empno, ENAME, JOB, MGR, SAL );


row_cnt:=sql%rowcount;

if row_cnt=1 then
dbms_output.put_line(sql%rowcount||'�� �߰���');
commit;
end if;

end;
/

