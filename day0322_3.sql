--------------create subquery
--테이블을 복사할 때(조회된 결과를 사용하여 테이블을 생성할 때)
--원천데이터에서 필요한 데이터를 추출하여 저장할 떄

--사원테이블에서 부서번호가 10번 30번인 부서사원의 사원번호ㅡ사원명, 부서번호, 직무,연봉을 조회하고
--cp_emp1테이블을 생성하여 추가하세요
create table cp_emp1 as
(select empno,ename,deptno,job,sal
from emp
where deptno in(10,20));


--DBMS에서 운영하기 위한 정보를 저장하는 테이블을 Data Dictionary라고 한다
--DD는 사용자가 직접 insert,update,delete를 할수 없고, 작업하는 쿼리에 따라 자동으로
--insert,update,delete가 수행된다
--DD는 사용자가 select만 가능하다
--제약사항을 확인할 수 있는 DD는 user_constraints이다
select * from user_constraints
where table_name='EMP';

select *from cp_emp1;
--cp_emp1테이블은 컬럼명,데이터형,크기,레코드는 dmp에서 그대로 복사되었으나 제약사항은 복사되지 않음
select *from user_constraints;

--사원테이블에서 사원번호,사원명,직무,연봉,매니저번호,입사일을 조회하고
--inline view를 사용하여 cp_emp2테이블을 생성하세요
create table cp_emp2 as
(select EMPNO, ENAME, JOB, SAL, MGR, HIREDATE
from emp);

select *from cp_emp2;

--사원테이블에서 사원번호,사원명,직무,매니저번호,입사일,연봉의 컬럼명,데이터형
--크기를 그대로 가진 cp_emp3테이블을 생성해 보세요(레코드 없이 테이블의 구조만 복사)
create table cp_emp3 as
(select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from emp
where 1=0);

select *from cp_emp3;

------------insert subquery
--단수행:다른컬럼의 값을 사용하여 레코드를 추가할때
--cp_emp1 테이블에 아래와 같은 사원정보를 추가
--사원번호:1212,사원명:현병호,부서번호:15
--job(직급):대리,연봉:emp테이블의 사원번호가 7788인 사원과 동일한 연봉
insert into cp_emp1(empno,ename,deptno,job,sal)
values(1212,'현병호',15,'대리',(select sal from emp where empno=7788));

commit;



----cp_emp1 테이블에 아래와 같은 사원정보를 추가
--사원번호:1213,사원명:이학민,부서번호:emp테이블의 사원번호가 7369인 사원과 동일한 부서번호로 추가
--job(직급):emp테이블의 사원명이 JONES인 사원과 동일 직무 ,연봉:emp테이블의 사원번호가 7521인 사원보다 100많은 연봉
insert into cp_emp1(empno,ename,deptno,job,sal)
values(1213,'이학민',(select deptno from emp where empno=7369),(select job from emp where ename='JONES')
 ,(select sal+100 from emp where empno=7521));
 commit;
select * from cp_emp1;