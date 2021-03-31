--숙제.
--1.  사원번호, 사원명,직무,매니저번호, 연봉을 입력 받아 CP_EMP3테이블에 insert 하는 PL/SQL을 작성하세요.
--
--  제약사항
--  -입력된 사원번호가 1000~2000 사이가 아니라면 999번으로만 추가합니다.
--  -연봉의 상한선은 5000입니다. 5000 이상이 입력되었다면 5000으로 추가합니다.
--  -직무는 'CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT' 로 만 추가될 수
--   있습니다. 입력된 직무가 해당 직무가 아니라면 'CLERK' 으로만 추가됩니다.
--
--  추가 성공하면 추가 성공한 row의 갯수와 메시지를 출력한 후 transaction을 완료 합니다.
set serveroutput on
set verify off

accept empno prompt '사원번호 입력:';
accept ename prompt '사원명 입력:';
accept job prompt '직무 입력:';
accept mgr prompt '매니저번호 입력:';
accept sal prompt '연봉 입력:';



declare

empno cp_emp3.empno%type:=&empno;
ename cp_emp3.ename%type:='&ename';
job cp_emp3.job%type:='&job';
mgr cp_emp3.mgr%type:=&mgr;
sal cp_emp3.sal%type:=&sal;

row_cnt number;

begin


if &empno between 1000 and 2000 then
empno:=&empno;
else
empno:=999;
end if;

if &sal>=5000 then
sal:=5000;
end if;

if job in ('CLERK') then
job:='CLERK';
elsif job in('SALESMAN') then
job:='SALESMAN';
elsif job in('MANAGER')  then
job:='MANAGER';
elsif job in('ANALYST')  then
job:='ANALYST';
elsif job in('PRESIDENT')  then
job:='PRESIDENT';
else
job:='CLERK';
end if;

insert into cp_emp3(EMPNO, ENAME, JOB, MGR, SAL )
values             (empno, ENAME, JOB, MGR, SAL );


row_cnt:=sql%rowcount;

if row_cnt=1 then
dbms_output.put_line(sql%rowcount||'건 추가됨');
commit;
end if;

end;
/

