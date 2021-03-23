--사원테이블에서 입사일이 23일인 사원의 사원번호,사원명,직무,매니저번호,입사일 연봉을 조회하여 cp_emp3테이블에 추가하세요
insert into cp_emp3
(select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from emp
where to_char(hiredate,'dd')='23');
commit;

select *from car_country;--제조국
select * from car_maker;--제조사
select * from car_model;--차량정보

--5초와 6초에 판매된 차량의 모델명,총가격,평균연식 조회
select model,sum(PRICE) total_price, ceil(avg(CAR_YEAR)) avg_car_year
from car_model
where to_char(hiredate,'ss') in ('05','06')
group by model;

--차량의 판매정보를 추가하는 테이블
create table car_sales(
model varchar2(30),
total_price number,
avg_car_year number,
input_date date);

--5초와 6초에 판매된 차량의 모델명,총가격,평균연식 조회
--테이블에 추가
insert into car_sales
(select model,sum(PRICE) total_price, ceil(avg(CAR_YEAR)) avg_car_year,sysdate
from car_model
where to_char(hiredate,'ss') in ('05','06')
group by model);

select * from car_sales;


-----------------update subquery
select *from cp_emp1;
--사원번호가 '1213'이면서 사원명이 '이학민'인 사원의 연봉을
--사원번호가 '1212'인 사원의 연봉과 같도록 변경
update cp_emp1
set    sal=(select sal from cp_emp1 where empno=1212)
where  EMPNO=1213 and ename='이학민';

commit;

select * from cp_emp2;
--cp_emp2테이블에서 7698 매니저가 관리하는 사원의 연봉을 cp_emp1 테이블의
--사원번호가 1213사원의 연봉으로 변경
--(5명의 연봉을 변경-복수행 subquery:where절에 in을 사용하는 경우 가능)
update cp_emp2
set sal=(select sal from cp_emp1 where empno=1213)
where empno in (select empno from cp_emp2 where mgr=7698);


-------------delete subquery
create table cp_emp4 as (select empno,ename,deptno,job,hiredate from emp);
select * from cp_emp4;
--cp_emp1테이블에 사원번호가 '7566'인 사원이 근무하는 부서번호를 조회하여,
--cp_emp4테이블에서 해당 부서의 근무하는 사원을 모두 삭제하세요
delete from cp_emp4
 where deptno=(select deptno from cp_emp1 where empno=7566);
commit;

--cp_emp1 테이블에서 10번부서에 근무하는 사원번호를 조회하여,
--cp_emp4 테이블에 일치하는 부서 사원 정보를 삭제하세요
delete from cp_emp4
where empno in (select empno from cp_emp1 where deptno=10);
