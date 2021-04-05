--2. cp_emp3���̺��� ��� ������ �����ϴ� Procedure�� �ۼ��ϰ� �����غ�����.
--  �Է����� : �����ȣ, �����, ����, ����
--  ������� : �߰��� ���Ǽ�, �߰��۾��� ���
--
--  -�����ȣ�� 1~9999���� �ΰ�쿡�� �Է��ϴ� �� �����ȣ�� �ش� ��ȣ�� �ƴ϶�� ������
--    9999�� �ԷµǾ���Ѵ�.
--
--   -������ 'CLERK,SALESMAN,MANAGER,ANALUST, PRESIDENT' �� �ϳ��� �ԷµǾ���ϰ�
--    �ƴ϶�� ������ 'CLERK'�� �ԷµǾ���Ѵ�.
--
--  - ������ 2400~ 3000 ���̰��̶�� �Է°����� �ԷµǾ���ϰ� �׷��� �ʴٸ� ������
--    2400���� �Է��� �����ؾ��Ѵ�.
--
-- �߰��۾��� ����� �߰����� �� "xxx���(�����ȣ) xxx������ �Ի�"�� ����� �����ϰ�
-- �����ϸ� "xxx����Է½���"�� ����� �����Ѵ�.
create or replace procedure emp_ins(empno cp_emp3.empno%type, ename cp_emp3.ename%type, job cp_emp3.job%type, sal cp_emp3.sal%type,
																		row_cnt out number,msg out varchar2)

is




begin
insert into CP_EMP3(empno, ENAME, JOB, SAL)
values(EMPNO, ENAME, JOB, SAL); 

row_cnt:=sql%rowcount;

if empno>9999 then
empno:=9999;

end if;

if ename not in('CLERK','SALESMAN','MANAGER','ANALYST', 'PRESIDENT') then
ename:='CLERK';

end if;

if sal not between 2400 and 3000 then
sal:=2400;
end if;


if row_cnt=1 then
msg:=empno||'���'||sal||'�� �Ի�';
commit;
end if;

exception
when others then
msg:=empno||'�� ����Է½���';






end;
/



