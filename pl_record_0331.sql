--�����ȣ,�����,����,�Ի����� ������ �� �ִ� record����, ����ϴ� ����
set serveroutput on

declare
--1.record ����: type ���ڵ�� is record(���ڵ忡 ���Ե� ����,,,,);
type emp_rec is record(empno number(4),ename emp.ename%type,job varchar2(30),hiredate emp.hiredate%type);
--2.����� record�� ����Ͽ� ������ ����:������ record��
kang emp_rec;
begin
--3.����� record������ ���
--���Ҵ�:record������.������:=��;
kang.empno:=1111;
kang.ename:='���μ�';
kang.job:='������';
kang.hiredate:=sysdate;

--�����
dbms_output.put_line('�����:'||kang.ename||',�����ȣ:'||kang.empno||',����:'||kang.job||',�Ի���:'||kang.hiredate);





end;
/
