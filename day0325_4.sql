--union: 서로 다른 테이블 위,아래로 조합하여 조회
--emp:한국본사 사원정보,cp_emp1:미국지사 사원정보
--본사와 지사 사원정보를 조회
--조회컬럼은 사원번호,사원명,직무,연봉

--union:중복데이터를 조회하지 않는다
select EMPNO, ENAME, JOB, SAL
from emp
union
select EMPNO, ENAME, JOB, SAL
from cp_emp1;

--union all:중복데이터를 조회한다
select EMPNO, ENAME, JOB, SAL
from emp
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1;

--에러
--컬럼의 데이터형이 일치하지 않는경우
--union:중복데이터를 조회하지 않는다
select EMPNO, ENAME, sal, job
from emp
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1;

--컬럼의 갯수가 일치하지 않는 경우
--union:중복데이터를 조회하지 않는다
select EMPNO, ENAME, JOB, SAL
from emp
union all
select EMPNO, ENAME, JOB
from cp_emp1;

--정상조회
--union:중복데이터를 조회하지 않는다
select EMPNO, ENAME, JOB, SAL
from emp
where deptno=10
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1
order by sal desc;
