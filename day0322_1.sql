select * from emp;


--사원테이블에서 사원번호,사원명,부서번호,부서명 조회
--단,부서명은 아래표오 같이 한글로 된 부서명을 출력
select empno,ename,deptno,
			 case deptno when 10 then '개발부'
			             when 20 then '유지보수부'
			             when 30 then '운영부'
			 else '축구부'
			 end  h_dname
from   emp;


--사원테이블에서 사원번호,사원명,연봉,총 수령액,직무별 보너스를 조회
--단,직무별 보너스는 아래와 같다.
--ClERK-연봉에 10%, SALESMAN-연봉+comm합한 금액의 20%, MANAGER-연봉에 15%, ANANLYST-연봉에 30% PRESIDENT-연봉에 150%
select EMPNO, ENAME, SAL,sal+nvl(comm,0) total,
			 case job when 'CLERK' then sal*0.1
			      when 'SALESMAN' then (sal+nvl(comm,0))*0.2
            when 'MANAGER' then sal*0.15
						when 'ANALYST' then sal*0.3
						when 'PRESIDENT' then sal*1.5
						end job_bonus
from emp;


------------------Order by
--사원테이블에서 사원번호,사원명,연봉,입사일 조회
--단,가장마지막에 잆사한 사원부터 조회될 것
select EMPNO, ENAME, SAL, HIREDATE
from emp
order by hiredate desc;

--사원테이블에서 사원번호,사원명,연봉,입사일,부서번호를 조회
--단,부서번호의 오름차순으로 정렬하되,부서번호가 같다면 연봉의 오름차순으로 정렬
--동일 연봉인 경우 사원명의 오름차순으로 정렬
select EMPNO, ENAME, SAL, HIREDATE,DEPTNO
from emp
order by DEPTNO,SAl,ename;

--사원 테이블에서 사원번호,사원명,연봉,직무,부서번호,입사일을 조회
--단,직무의 내림차순으로 정렬하되, 직무가 같다면 연봉의 오름차순으로 정렬하고,
--연봉이 같다면 입사일의 내림차순으로 정렬
select EMPNO, ENAME, SAL, JOB, DEPTNO, HIREDATE
from emp
order by JOB desc,SAL,HIREDATE desc;



--------------------순위함수
--사원테이블에서 사원번호,사원명,연봉,연봉의 순위 조회
--동일 순위가 발생. 동일 순위가 발생하면 건너뜀
select EMPNO, ENAME, SAL,rank() over(order by sal)
from emp;

--동일순위가 발생하지 않는다
select EMPNO, ENAME, SAL,row_number() over(order by sal)
from emp;

--분류별 순위 설정.partition by 사용
--사원번호,사원명,부서번호,연봉,순위를 조회
--사원테이블에서 부서별로 낮은 연봉부터 순위를 조회
select EMPNO, ENAME, DEPTNO, SAL,
row_number() over(partition by deptno order by sal) rank
from emp;

--사원테이블에서 사원번호,사원명,부서번호,매니저번호,연봉을 조회
--단, 매니저별 높은 연봉부터 순위 조회(중복순위는 발생하지 않는다.)
select EMPNO, ENAME, DEPTNO, MGR, SAL,
row_number() over(partition by mgr order by sal desc) rank
from emp;


----------------집계함수(그룹함수)
--컬럼값을 모아 하나로 만드는 함수
--사원테이블에서 전체 사원수를 조회
select count(empno)/*ename 여러행이 조회되는 컬럼과같이 사용되면 에러 발생*/
from emp;

--count는 null인 컬럼에 대해서는 집계에 포함하지 않는다
select count(comm) ,count(mgr)
from emp;

--사원테이블에서 전체사원수,보너스를 받는 사원수, 보너스를 받지 않는 사원수 조회
select count(EMPNO),count(comm),count(EMPNO)-count(comm)
from emp;

--사원테이블에서 1년에 연봉을 지출되는 총액,보너스로 지출되는 총액,전체종액을 조회
--sum()은 숫자 컬럼만 넣을 수 있다.
select sum(sal),sum(comm),sum(sal)-sum(comm)
from emp;

--avg()는 숫자컬럼만 넣을 수 있다
--사원테이블에서 연봉평균을 조회
select avg(sal),trunc(avg(sal),0),avg(comm)
from emp;

--max(),min() 숫자컬럼만 넣을 수 있다.
--사원테이블에서 연봉의 최고값,연봉의 최저값을 조회
select max(sal),min(sal)
from emp;


-------
--사원테이블에서 평균연봉보다 많이 받는 사원의 사원번호,사원명 입사일,연봉을 조회
--집계함수는 조건절에서 직접 사용할 수 없다
select EMPNO, ENAME, HIREDATE, SAL
from emp
where avg(sal)<sal;
