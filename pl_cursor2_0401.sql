--부서번호를입력받아 cp_emp1테이블에서 사원정보 조회
--조회는 사원번호,사원명,직무,연봉을 조회
set serveroutput on
set verify off

accept deptno prompt '부서번호:';

declare

empno cp_emp1.empno%type;
ename cp_emp1.ename%type;
job cp_emp1.job%type;
sal cp_emp1.sal%type;

cursor cur_emp is
select empno, ENAME, JOB, SAL from cp_emp1
where deptno=&deptno;



cnt number:=0;

begin

--2.열기
if cur_emp%isopen then
	close cur_emp;
	end if;

	open cur_emp;

	--3.인출
	loop

	fetch cur_emp into EMPNO, ENAME, JOB, SAL;

	exit when(cur_emp%notfound);

	dbms_output.put_line(empno||'/'||ENAME||'/'||JOB||'/'||SAL);
	--인출이 한번이라도 된다면 cnt변수를 증가
	cnt:=cnt+1;
	end loop;

	--4.닫기
	close cur_emp;

	if cnt=0 then
	dbms_output.put_line(&deptno||'번 부서의 사원은 존재하지 않습니다');
	end if;




end;
/
]
