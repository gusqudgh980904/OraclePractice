--������ ���
set serveroutput on

declare
--���� ���� ����
name varchar2(15);
age number(3):=25;
--��¥�� ������ �� �ִ� ���� ����
input_date date;

--���� ���̺� �����ϴ� �÷��� ��������,ũ�⸦ �����Ͽ� ���� ����
ename emp.ename%type:='�ڱ��';
sal emp.sal%type;

--rowtype�� ���� ���� �÷��� �ϳ��� ������ �����ϱ� ������ �ʱ�ȭ�� �� �� ����
dept_row dept%rowtype;

begin
--���Ҵ�
name:='����ȣ'||'��';
--���� ��¥ �Է�
input_date:=sysdate;
--���� ���
--���:dbms_output.put(); �Լ��θ� �����ϸ� ����� ���� ����
	--�������� put_line();�� ����ؾ� ����� �Ϸ�ȴ�
dbms_output.put(name);
dbms_output.put_line(age+1);
--���糯¥�� ���
dbms_output.put_line(to_char(input_date,'yyyy-mm-dd dy'));

--%type�� ����� ������ �� �Ҵ�
sal:=2021;
--ename:='����ȣ��';--�����÷��� ũ�⺸�� ū ���������� �Է��Ͽ� Error
dbms_output.put_line(ename || ' / ' || sal);

--%rowtype�� ����� ������ �� �Ҵ�
dept_row.deptno:=10;
dept_row.dname:='���ߺ�';
dept_row.loc:='����';

dbms_output.put_line(dept_row.deptno || ' / ' ||dept_row.dname||'/'||dept_row.loc);

end;
/
