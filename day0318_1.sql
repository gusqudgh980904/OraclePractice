-----rollback연습

--create table test1(
name varchar2(15),
age number(3)
);


insert into test1(name,age) values('현병호',24);
select*
from test1;
commit;

insert into test1(name,age) values('김민준',25);
update test1
set    age=24
where  name='김민준';

rollback;


-----------------savepoint 사용
savepoint insert_a;
insert into test1(name,age) values('아카자',150);

savepoint update_b;
update test1
set    age=26
where  name='아카자';

savepoint delete_c;
delete from test1
where name='아카자';

select *
from test1;

rollback to delete_c;




------------select--------------
--사원 테이블에서 사원번호,사원명,연봉,보너스,총수령액 조회
--단,총수령액은 연봉+보너스 한 금액

select empno,ename,sal,comm,sal+comm totalsal
from emp;


----------alias---------
--컬럼명 alias,컬럼명 as alias
--대소문자 구분 컬럼명 "alias"]
--같은 컬럼을 여러개 조회하면 _1,_2,_3,,,으로 alias가 자동 부여됨
select   DEPTNO d_No, DNAME as dn, LOC "Loc",loc "위치",loc "L O C"
from dept;

--컬럼명의 alias는 where 절에서 사용할 수 없다.
select deptno dno, DNAME
from dept
where deptno=10;


--부서테이블에서 부서번호,부서명,위치 조회
--단, 부서번호는 현재부서번호에서 -3을 연산함 값으로 조회
select  DEPTNO,DEPTNO-3 new_deptno, DNAME, LOC
from dept;


--산술연산자가 아닌 다른 연산자는 조회하는 컬럼명에서 쓸 수 없다
select empno>10
from emp;


--문장형식의 출력
--사원테이블에서 사원명에 '님'을 붙여서 조회
select   ename||'님','님'||ename ,empno||ename
from emp;

--사원테이블에서 사원번호,사원명,연봉으 조회
--단,조회형식은 사원명(사원번호)님의 연봉은 XX$입니다.로 조회하고
--컬럼명은 output으로 설정
select   ename||'('||empno||') 님의 연봉은'||sal||'%입니다' output
from emp;


--사원테이블에서 사원번호,사원명,직무,연봉,세금을 조회
--단,세금은 연봉에서 3.3%로 계산하여 출력
--세금계산한 컬럼에는 alias로 사용
select   EMPNO, ENAME, JOB,sal,sal*0.033 "Tax"
from emp;


--사원테이블에서 사원번호,사원번호결과,사원명 조회
--단,사원번호결과는 짝수면0을 홀수면 1을 조회
select EMPNO,mod(empno,2) empno_result,ENAME
from  EMP ;

