set serveroutput on
set verify off

accept mgr prompt '매니저번호:';

declare
--사원번호,사원명,부서번호,입사일,연봉
type emp_rec is record(EMPNO emp.empno%type,ename emp.ename%type,deptno emp.deptno%type,hiredate emp.hiredate%type,sal emp.sal%type);

--조되된 레코드를 저장할 수 있는 table을 선언(방하나가 조회된 레코드 1행 저장)
type emp_tab is table of emp_rec index by binary_integer;

--방하나가 조회된 행하나를 저장할 수 있는 emp_table을 사용하여 table변수를 선언
emp_data emp_tab;
--record 변수 선언
ed emp_rec;


--1.커서 선언
cursor cur_emp is
	select empno,ename,deptno,hiredate,sal
	from emp
	where mgr=&mgr;

--인덱스용
idx number:=0;

--부서명 저장용
dname varchar2(30):='기술지원';


begin
-------------------데이터처리 시작
--2.커서열기
if cur_emp%isopen then
close cur_emp;
end if;

open cur_emp;

--3.인출:인출된 레코드를 table의 방에 담는다
loop
  idx:=idx+1;
	fetch cur_emp into emp_data(idx);
	exit when(cur_emp%notfound);


end loop;



--4.닫기
close cur_emp;
-------------------데이터처리 끝

-------------------View처리 시작
if idx=1 then
dbms_output.put_line(&mgr||'번 매니저는 관리하는 사원이 없거나, 매니저가 없습니다');
end if;

for i in 1..emp_data.count loop
--레코드변수에 방하나가 조회된 테이블을 연속으로 넣기
ed:=emp_data(i);

--PL/SQL에서는 decode함수를 사용할 수 없다
--부서명은 10번 부서였을 때 개발부, 20 - 유지보수, 30 - 영업 그 외는 기술지원으로 출력합니다.
if ed.deptno=10 then
dname:='개발부';
elsif ed.deptno=20  then
dname:='유지보수';
elsif ed.deptno=20   then
dname:='영업부';
else
dname:='기술지원';
end if;

dbms_output.put_line(ed.empno||'/'||ed.ename||'/'||ed.deptno||'/'||to_char(ed.hiredate,'yyyy-mm-dd')||'/'||ed.sal||'/'||dname);

end loop;

-------------------View처리 끝
exception
when invalid_cursor then
dbms_output.put_line('커서가 잘못된 연산 수행');
when others then
dbms_output.put_line('인지하지 못한 예외:'||sqlerrm);

end;
/
