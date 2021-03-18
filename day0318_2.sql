--사원테이블에서 10번 부서에 근무하는 사원들의 사원번호,사원명,매지너번호,연봉조회,부서번호
select  EMPNO , ENAME, MGR, SAL, DEPTNO
from  emp
where deptno=10;


--사원테이블에서 10번 부서가 아닌 부서사원들의 사원번호,사원명,매니저번호,입사일 조회
select EMPNO, ENAME, MGR, HIREDATE,DEPTNO
from   emp
where  deptno<>10;--<>는 !=와 같다
--where  deptno!=10;


--사원테이블에서 연봉이 1600이상인 사원들의 사원번호,연봉,사원명,직무,입사일 조회
select  EMPNO, SAL, ENAME, JOB, HIREDATE
from emp
where sal>=1600 ;
--where sal>1599;


--사원테이블에서 연봉이 1600이상 3000이하인 사원의 사원명,사원번호,연봉,직무
select   ENAME, EMPNO, SAL, JOB
from emp
where sal between 1600 and 3000;
--where sal>=1600 and sal<=3000 ;


--사원테이블에서 7902,7698,7566 매니저가 관리하는 사원의 사원번호,사원명,매니저 번호,입사일,직무 조회
select   EMPNO , ENAME, MGR, HIREDATE, JOB
from emp
where mgr in(7902,7698,7566);--포함하는
--where mgr not in(7902,7698,7566);--포함하지 않는
--where mgr=7902 or mgr=7698 or mgr=7566;


--사원테이블에서 보너스를 받는 사원들의 사원번호 ,연봉,보너스,사원명,직무
--null은 관계연산자로 비교할 수 없다
--is null,is not null
select EMPNO, SAL, COMM, ENAME, JOB
from emp
--where comm>=0
where comm is not null;


--사원테이블에서 사원명이 'allen'인 사원의 사원번호,사원명,입사일,직무,부서번호를 조회
select EMPNO, ENAME, HIREDATE, JOB, DEPTNO
from 		emp
--where ename='ALLEN';
where ename like 'ALLEN';

--사원테이블에서 사원명이 'A'로 시작하는 사원들의 사원명,연봉,직무,입사일 조회
select ENAME, SAL, JOB, HIREDATE
from	 emp
where	 ename like 'A%';

--사원테이블에서 사원명이 'S'로 끝나는 사원들의 사원명,연봉,사원번호,매니저번호,입사일을 조회
select ENAME, SAL, EMPNO, MGR, HIREDATE
from emp
where ename like '%S';

--사원테이블에서 사원명에 'A'가 들어있는 사원들의 사원명,연봉,사원번호, 입사일 조회
select ENAME, SAL, EMPNO, HIREDATE
from emp
where  ename like '%A%';

--사원테이블에서 사원명에 'L'이 두개 있는 사원들의 사원명,매니저번호,직무를 조회
select ENAME, MGR, JOB
from emp
where ename like '%L%L%';

--사원테이블에서 사원명이 5글자인 사원의 사원명을 조회
select ename
from emp
where ename like '_____';

--사원테이블에서 이름이 5글자이면서 두번째 글자가 'O'인 사원의 사원번호,사원명,입사일,연봉을 조회
select EMPNO, ENAME, HIREDATE, SAL
from emp
where ename like '_O___';
