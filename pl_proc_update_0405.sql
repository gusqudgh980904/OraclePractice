--�����ȣ,����,�μ���ȣ�� �Է¹޾� �����ȣ�� �ش��ϴ� ����� ������
--CP_EMP4���̺��� �����ϼ��� update
create or replace procedure proc_update(i_empno number,i_job varchar2,i_deptno number,cnt out number,msg out varchar2)
is



begin

update cp_emp4
set    job=i_job,deptno=i_deptno
where  empno=i_empno;

cnt:=sql%rowcount;

if cnt=1 then
msg:=i_empno||'�� ��������� �����Ͽ����ϴ�';
commit;
else
msg:=i_empno||'�� ����� �������� �ʽ��ϴ�';
end if;

exception
when others then
msg:='������� ������ �˼����� ����';

end;
/
