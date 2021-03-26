--outer join(한쪽테이블에만 레코드가 존재하더라도 조회가능)
--존재하는 모든 부서의 부서번호,부서명,위치,사원번호,사원명을 조회

--ANSI
select d.deptno,d.dname,d.loc,e.empno,e.ename
from  dept d
left outer join emp e
on e.deptno=d.deptno;

--Oracle
--(+)기호를 레코드가 없는 혹은 자식테이블에 붙인다
select  d.deptno,d.dname,d.loc,e.empno,e.ename
from  	dept d,emp e
where   d.deptno=e.deptno(+);

--레코드가 존재하지 않는 테이블을 선택하면 조회결과가 나오지 않음
select d.deptno,d.dname,d.loc,e.empno,e.ename
from  dept d
right outer join emp e
on e.deptno=d.deptno;

--Oracle
--레코드가 존재하는 컬럼에 (+)기호를 붙이면 inner join과 같다
select  d.deptno,d.dname,d.loc,e.empno,e.ename
from  	dept d,emp e
where   d.deptno(+)=e.deptno;

--레코드의 구성을 잘 모르지만 모든 레코드를 조회해야한다면 full outer join
select d.deptno,d.dname,d.loc,e.empno,e.ename
from  dept d
full join emp e
on e.deptno=d.deptno;

--Oracle
--(+)기호는 양쪽에 붙일 수 없다
select  d.deptno,d.dname,d.loc,e.empno,e.ename
from  	dept d,emp e
where   d.deptno(+)=e.deptno(+);


--모든 부서에 근무하는 사원들의 부서번호,부서명, 사원번호,사원명,우편번호,시도,구군,동,번지를 조회
--단,부서에 근무하는 사원이 존재하지 않으면 사원번호에 '0'번을 사원명'없음'을 대신 조회한다
--ANSI
select  d.DEPTNO, d.DNAME, nvl(e.empNO,0) empno,seq,nvl(e.ENAME,'없음') ename, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from            dept d
left outer join emp e
on  			d.deptno=e.deptno
left outer join zipcode z
on 				e.empno=z.seq;

--Oracle
select d.DEPTNO, d.DNAME, nvl(e.empNO,0) empno,nvl(e.ENAME,'없음') ename, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from  dept d,emp e,zipcode z
where (d.deptno=e.deptno(+) and e.empno=z.seq(+));



-- -------------------------------------------------------
--사원테이블에서 사원명이 'WARD'인 사원보다 연봉을 많이 수령하는 사원의
--사원번호,사원명,연봉,직무,입사일
--단수행 서브쿼리
select EMPNO, ENAME, SAL, JOB , HIREDATE
from emp
where (select sal from emp where ename='WARD')<sal
order by sal desc;

--self join:조회용 테이블과 조건용 테이블을 잘 구분하여 쓴다
select e1.EMPNO, e1.ENAME, e1.SAL, e1.JOB , e1.HIREDATE ,e2.ename
from emp e1,emp e2
where (e1.sal>e2.sal) and e2.ename='WARD';

--조인조건을 잘못 설정하면 모든 레코드의 합이 조회되어 나오는 Cartisian Product이 발생
select  e.empno,e.ename,d.deptno,d.dname
from dept d,emp e;
