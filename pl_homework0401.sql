--	     숙제 1. 매니저 번호를 입력받아 매니저가 관리하는 사원 정보를 emp테이블에서
--	       조회하는 PL/SQL을 작성하세요.
--
--	     조회 컬럼은 사원번호,사원명,부서번호, 입사일, 연봉을 조회하세요.
--
--	     단, 조회하는 코드와 업무처리 코드를 구분하여 코딩 합니다.
--	        반복문 하나에서는 커서에서 인출한 데이터를 table에 저장하는 작업을 수행하고,
--	        테이블에 저장된 데이터를 사용하기 위해서  반복문을 하나 더 실행합니다.
--	        table을 사용하여 출력하는 코드에서는 '사원번호,사원명,부서번호, 부서명, 입사일,연봉'을  출력합니다.
--	       부서명은 10번 부서였을 때 개발부, 20 - 유지보수, 30 - 영업 그 외는 기술지원으로 출력합니다.
set serveroutput on
set verify on

accept mgr prompt '매니저번호 입력:';

declare

--레코드선언
type emp_rec is record(EMPNO emp.empno%type,ename emp.ename%type,deptno emp.deptno%type,hiredate emp.hiredate%type,sal emp.sal%type);

--테이블선언
type emp_tab is table of emp_rec index by binary_integer;

--테이블 변수 선언
et emp_tab;

--커서선언
cursor cur_emp is
select empno, ENAME,deptno, hiredate, SAL
from emp
where mgr=&mgr;


--mgr_v emp.mgr%type:=&mgr ;
--empno_v  emp.empno%type;
--ename_V emp.ename%type;
--deptno_v emp.deptno%type;
--hiredate_v emp.hiredate%type;
--sal_v emp.sal%type;

begin

--2.열기
if cur_emp%isopen then
	close cur_emp;
	end if;

	open cur_emp;

	--3.인출
	loop

	fetch cur_emp into et(1);

	exit when(cur_emp%notfound);


	end loop;

	--4.닫기
	close cur_emp;

  



end;
/
