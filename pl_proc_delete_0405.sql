--�����ȣ�� �Է¹޾�,�����ȣ�� �ش��ϴ� CP_EMP4���̺��� ������� ����
create or replace procedure proc_delete(i_empno number,cnt out number,msg out varchar2)
is

begin

delete from cp_emp4 where empno=i_empno;

cnt:=sql%rowcount;

if cnt=1 then
	msg:=i_empno||'�� ������� ��������';
	commit;
else
    msg:=i_empno||'�� ����� �������� �ʽ��ϴ�';
end if;

exception
when others then
msg:='���� �� ���� �߻�';


end;
/
