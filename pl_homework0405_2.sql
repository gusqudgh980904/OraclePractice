--2. cp_emp3테이블의 사원 정보를 삽입하는 Procedure를 작성하고 실행해보세요.
--  입력정보 : 사원번호, 사원명, 직무, 연봉
--  출력정보 : 추가된 행의수, 추가작업의 결과
--
--  -사원번호는 1~9999사이 인경우에만 입력하는 데 사원번호가 해당 번호가 아니라면 무조건
--    9999로 입력되어야한다.
--
--   -직무는 'CLERK,SALESMAN,MANAGER,ANALUST, PRESIDENT' 중 하나만 입력되어야하고
--    아니라면 무조건 'CLERK'로 입력되어야한다.
--
--  - 연봉은 2400~ 3000 사이값이라면 입력값으로 입력되어야하고 그렇지 않다면 무조구
--    2400으로 입력을 수행해야한다.
--
-- 추가작업의 결과는 추가성공 시 "xxx사원(사원번호) xxx원으로 입사"로 결과를 설정하고
-- 실패하면 "xxx사원입력실패"로 결과를 설정한다.
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
msg:=empno||'사원'||sal||'로 입사';
commit;
end if;

exception
when others then
msg:=empno||'번 사원입력실패';






end;
/



