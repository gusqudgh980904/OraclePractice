--숙제 3.
-- 사원테이블에서 근속년수가 35년 이상인 사원 들의 사원번호,사원명, 입사일, 근속년수, 연봉을 조회하세요.
-- 단, 입사일의 내림차순으로 정렬하여 출력하고, 입사일은 ‘월-일-년 요일’ 의 형식으로 출력하세요.
select EMPNO, ENAME,(to_char(HIREDATE,'mm-dd-yyyy-day')) as hiredate,
			trunc(months_between(sysdate,hiredate)/12,0) as service_life, SAL

from     emp
where  trunc(months_between(sysdate,hiredate)/12,0)>=35
order by hiredate desc;
