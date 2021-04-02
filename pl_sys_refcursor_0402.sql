--sys_refcursor사용:커서의 선언과 쿼리문을 분리할 수 있다
--부서번호를 입력받아 emp테이블에서 사원정보를 조회
--조회컬럼:사원번호,사원명,부서번호,연봉을 조회
--단, 부서번호는 10,20,30만 사용할 수 있고 해당 번호가 아니면 '부서번호는
--10,20,30,번만 입력해 주세요'를 출력
set serveroutput on
set verify off

accept deptno prompt '부서번호 입력:';

declare

--여러개의 행을 담을 레코드
type emp_rec is record(empno number,ename varchar2(30),deptno number,sal number);
--레코드를 사용한 변수 선언
er emp_rec;

--부서번호
d_no number:=&deptno;

--sys_refcursor선언:커서의 선언과 쿼리문을 분리할 수 있다
emp_cur sys_refcursor;

begin

if d_no in (10,20,30) then
--2.open
open emp_cur for
	select empno,ename,deptno,sal
	from   emp
	where  deptno=d_no;

loop
fetch emp_cur into er;
exit when(emp_cur%notfound);

dbms_output.put_line(er.empno||'/'||er.ename||'/'||er.deptno||'/'||er.sal);


end loop;

--4.닫기
close emp_cur;

else
dbms_output.put_line('10,20,30번 부서만 입력해주세요');
end if;


exception
when invalid_cursor then
dbms_output.put_line('잘못된 커서 연산');
when others then
dbms_output.put_line('알수 없는 예외'||sqlerrm);
end;
/
