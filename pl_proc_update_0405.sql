--사원번호,직무,부서번호를 입력받아 사원번호에 해당하는 사원의 정보를
--CP_EMP4테이블에서 변경하세요 update
create or replace procedure proc_update(i_empno number,i_job varchar2,i_deptno number,cnt out number,msg out varchar2)
is



begin

update cp_emp4
set    job=i_job,deptno=i_deptno
where  empno=i_empno;

cnt:=sql%rowcount;

if cnt=1 then
msg:=i_empno||'번 사원정보를 수정하였습니다';
commit;
else
msg:=i_empno||'번 사원은 존재하지 않습니다';
end if;

exception
when others then
msg:='사원정보 변경중 알수없는 오류';

end;
/
