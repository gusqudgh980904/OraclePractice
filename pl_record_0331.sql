--사원번호,사원명,직무,입사일을 저장할 수 있는 record생성, 사용하는 예제
set serveroutput on

declare
--1.record 선언: type 레코드명 is record(레코드에 포함될 변수,,,,);
type emp_rec is record(empno number(4),ename emp.ename%type,job varchar2(30),hiredate emp.hiredate%type);
--2.선언된 record를 사용하여 변수를 선언:변수명 record명
kang emp_rec;
begin
--3.선언된 record변수를 사용
--값할당:record변수명.변수명:=값;
kang.empno:=1111;
kang.ename:='강인섭';
kang.job:='개발자';
kang.hiredate:=sysdate;

--값사용
dbms_output.put_line('사원명:'||kang.ename||',사원번호:'||kang.empno||',직무:'||kang.job||',입사일:'||kang.hiredate);





end;
/
