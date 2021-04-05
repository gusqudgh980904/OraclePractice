--사원번호,사원명,부서번호,직무를 입력받아 CP_EMP4테이블에 레코드를 삽입하는
--Procedure작성
create or replace procedure proc_insert(empno cp_emp4.empno%type,ename cp_emp4.ename%type,
deptno cp_emp4.deptno%type,job cp_emp4.job%type,row_cnt out number,msg out varchar2)
is



begin

insert into cp_emp4(EMPNO, ENAME, DEPTNO, JOB, HIREDATE)
values( EMPNO, ENAME, DEPTNO, JOB, sysdate);

--insert한 행의 수
row_cnt:=sql%rowcount;

if row_cnt=1 then

msg:=empno||'번 사원정보가 추가되었습니다';

	commit;
end if;

exception
when dup_val_on_index then
msg:=empno||'번 사원번호는 이미 있습니다';
when others then
msg:='알 수 없는 예외';

end;
/
