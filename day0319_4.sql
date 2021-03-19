--truncate table test1;
--alter table test1 add ssn char(14);

insert into test1(name,age,ssn,input_date) values ('현병호',24,'980904-1234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('스티븐유',45,'880403-5234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('조혜원',26,'960812-2234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('곽범수',27,'950101-1234567',sysdate);
insert into test1(name,age,ssn,input_date) values ('송준희',24,'011103-4345367',sysdate);
insert into test1(name,age,ssn,input_date) values ('석지원',25,'911231-2234567',sysdate);
commit;
select *from test1;

--1. 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,
--   입사일을 조회하세요.
-- 단, 입사일은 월-일-년의 형식으로 출력하세요.
--    연봉은 3자리마다 ,를 넣어 출력하세요.
select EMPNO, ENAME, JOB, MGR, to_char(SAL,'9,999,999') sal,to_char(HIREDATE,'mm-dd-yyyy') hiredate
from emp;

--2. 사원테이블에서 3,4분기에 입사한 사원들의  사원번호,사원명,연봉,직무, 입사일을 조회하세요.
select EMPNO, ENAME, SAL, JOB, HIREDATE
from emp
where to_char(hiredate,'q') in (3,4);


--3. 사원테이블에서 부서번호, 사원번호, 연봉, 보너스, 총수령액,
-- 입사일을 조회하세요.
--   단. 총수령액은 '연봉+월급+보너스'를 합산한 금액으로
--   조회하세요.  월급은 연봉을 12로 나눈 값을 원단위 절사하여
--   계산하세요.
select DEPTNO, EMPNO, SAL, COMM,sal+nvl(comm,0)+trunc(sal/12,-1) total, HIREDATE
from emp;

--4. 사원 테이블에서 부서번호,부서명,연봉, 보너스, 인센티브를
--   조회하세요.
--   인센티브는  아래표와 같이 부서별로 차등 지급합니다.
--   10- 월급에 100%, 20- 월급에 150%, 30 - 월급에 300%
--   그외 월급에 50%
select DEPTNO, ENAME, SAL, nvl(COMM,0) comm,trunc(decode(deptno,10,(sal/12)*1,20,(sal/12)*1.5,30,(sal/12)*3,sal*0.5),1) insentive
from emp;

--5. test1 테이블에서 이름 ,나이,태어난해, 주민번호,  성별을 조회 하세요.
--   -성별은 주민번호의  8번째 자리로 구하고,
--   8번째 자리가 1,3이면 '남자', 2,4면 '여자' 5,6,7,8이면 '외국인'그렇지
--   않으면 "오류" 로 출력한다.
--   -태어난해는 나이를 사용하여 구한다.
select NAME, AGE,2022-age birth, INPUT_DATE,SSN,decode(substr(ssn,8,1),1,'남자',3,'남자',2,'여자',4,'여자',5,'외국인','오류') gender
from test1;
