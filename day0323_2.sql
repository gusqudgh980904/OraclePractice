----------select subquery
--단수행
--emp 테이블에서 사원번호가 '7369'번 사원이 근무하는 부서번호를 조회하여,
--cp_emp1 테이블에 같은 부서사원의 정보를 모두 조회
select * from emp;
select *from cp_emp1;

select empno ,ename,deptno,job,sal
from cp_emp1
where deptno=(select deptno from emp where empno=7369);

--모델명이 '그랜저'인 차량의 제조국 조회
select *from car_MAKER;
select country
from car_country
WHERE maker=(select maker from car_maker where model='아반테');
--제조사가 '현대'인 차량의 모델명,연식 가격,옵션을 조회
select model,car_year,price
from car_model
where model in(select model from car_maker where maker='현대');


--------------scalar subquery
--조회된 값을 사용하여 다른 컬럼의 값을 보여줄 때
--사원번호,사원명,부서번호,부서명 조회
select empno,ename,deptno,(select dname from dept where dept.deptno=emp.deptno) dname
from emp;

--car_model,car_maker 사용
--년식이2012년 모델명,년식,가격,옵션,입력일 이미지,제조사를 조회
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, CAR_IMG,
(select  MAKER from car_maker where car_maker.model=car_model.model) maker
from car_model
where car_year='2012';


--select 다중행 subquery (검색된 결과를 가지고 재조회 : inline view를 사용한 조회)
select empno,ename,job,sal,hi   --inline view에 존재하는 컬럼과 레코드를 검색
--alias가 실제 컬럼명처럼 사용
from (select EMPNO, ENAME, SAL, JOB, HIREDATE hi from emp where job='CLERK')
where to_char(hi,'yyyy')=1980;


----rownum
--사원테이블에서 입사년도가 '1981'년도인 사원들의 순차번호,사원번호,사원명,입사일을 조회
--조회결과에 가상번호를 사용
select rownum EMPNO, ENAME, HIREDATE
from emp
where to_char(hiredate,'yyyy')='1981';

--rownum은 order by보다 먼저 생성되므로 정렬하면 번호가 섞인다-
--사원테이블에서 순차번호,사원번호,사원명,직무를 조회
--단,사원명의 오름차순으로 정렬하여 조회
select rownum, EMPNO, ENAME, JOB
from emp
order by ename;

--1번부터는 조회가되나 이후 번호 부터는 조회되지 않는다
--사원테이블에서 번호,사원번호,사원명을 조회
--단, 번호가 1번~5번까지의 레코드만 출력
select rownum, EMPNO, ENAME
from emp
where rownum between 1 and 5;
--where rownum>=1 and rownum<6;

--select 마다 같은 이름으로 따로 사용된다
select rownum,rn,ename,empno
from (select rownum rn,ename,empno from emp order by ename);

--사원테이블에서 가장 마지막에 입사한 이전사원부터 5건의 사원정보를 조회
--(2~6까지 조회)
--가장 마지막에 입사한 사원에게 1번을 부여
--많은 양의 레코드에서 특정 부분만 추출하여 조회
select rn, EMPNO, ENAME, JOB, HIREDATE
from  (select rownum rn,empno,ename,job,hiredate
from  (select empno,ename,job,hiredate
			from   emp
			order by hiredate desc,empno))
where rn between 2 and 6;

select empno,ename,job,hiredate,rnum
from(select empno,ename,job,hiredate,
			row_number() over(order by hiredate desc) rnum
from emp)
where rnum between 2 and 6;

--우편번호테이블에서 시도가 '서울'인 레코드를 dong의 내림차순으로
--정렬했을 때 150번~100번 사이의 레코드를 조회
--단,번지가 없으면 '번지없음'으로 출력
--조회컬럼:우편번호,시도,구군,동,번디
select * from zipcode;
select ZIPCODE, SIDO, GUGUN,nvl(BUNJI,'번지없음') BUNJI,dong_num
from (select ZIPCODE, SIDO, GUGUN,BUNJI,
				row_number() over(order by dong desc) dong_num
				from zipcode
				where sido='서울' )
where dong_num between 150 and 200  ;


select *
from user_tab_cols;
