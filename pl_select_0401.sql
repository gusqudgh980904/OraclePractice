--사원번호를 입력받아 CP_EMP1테이블에서 사원정보를 조회하는 PL/SQL
--조회 컬럼은 사원명,부서번호,직무,연봉을 조회하여 출력
set serveroutput on
set verify  off

accept empno prompt '사원번호 입력';

declare

i_empno cp_emp1.empno%type:= &empno;--where절에서 사용할 변수

--into절에서 사용할 변수
ename cp_emp1.ename%type;
deptno cp_emp1.deptno%type;
job cp_emp1.job%type;
sal cp_emp1.sal%type;

--암시적 커서가 가지고 있는 값
row_cnt number;

begin

select ename,deptno,job,sal --조회된결과를 가진 컬럼을
into   ename,deptno,job,sal --변수에 넣는다.(변수의 갯수와 형에 대한 주의)
from  cp_emp1
where empno=i_empno;

row_cnt:=sql%rowcount;

dbms_output.put_line(row_cnt||'행 조회');

dbms_output.put_line(i_empno||'번 사원정보  조회');
dbms_output.put_line('사원명:'||ename||',부서번호:'||DEPTNO||',직무:'||JOB||',연봉'||SAL);

exception
when no_data_found then
	dbms_output.put_line(i_empno||'번 사원은 존재하지 않습니다.');
	dbms_output.put_line('에러코드:'||sqlcode||',에러메시지:'||sqlerrm);
when too_many_rows then
	dbms_output.put_line(i_empno||'번으로 여러명이 검색되었습니다.');
	dbms_output.put_line('에러코드:'||sqlcode||',에러메시지:'||sqlerrm);
when others then
	dbms_output.put_line('개발자가 인지하지 못한 예외.');
	dbms_output.put_line('에러코드:'||sqlcode||',에러미시지:'||sqlerrm);






end;
/
