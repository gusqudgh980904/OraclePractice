-----------문자열 함수
--문자열 길이
select  length('test'),length('오늘은 금요일')
from dual;

--사원테이블에서 사원명이 4글자인 사원의 사원명,사원번호ㅡ입사일 조회
select ename,empno,hiredate
from emp
where length(ename)=4;

--대문자,소문자 변환
select  upper('a'),upper('Abcd'),lower('ABCD'),LOWER('AbcD')
from dual;

--사원테이블에서 사원명이 'scott'인 사원의 사원번호,사원명,직무,연봉,입사일 조회
select   EMPNO, ENAME, JOB, SAL, HIREDATE
from emp
where lower(ename)='scott';
--where ename=upper('scott');

--첫글자를 대문자로
select initcap('java'),initcap('oracle')
from dual;

--첫글자를 대문자로,공백 이후의 첫글자도 대문자로 만든다
select initcap('java'),initcap('oracle'),initcap('i am a boy')
from dual;

--문자열 내에 특정 문자열의 인덱스 얻기
select instr('test','s'), instr('test','k')
from dual;

--사원테이블에서 사원명에 'A'가 있는 사원의 사원명,사원번호,연봉을 조회
select ENAME, EMPNO, SAL
from emp
where instr(ename,'A')<>0;


--문자열 자르기
--시작문자로 부터 자를 때에는 시작인덱스를 0또는 1로 사용할 수 있다
select substr('abcdefg',4,1),substr('abcdefg',3),substr('abcdefg',0,3)
from dual;

--문자열 합치기
select 'ABC'||'DEF'||'HIJ', concat(concat('ABC','DEF'),'HIJ')
from dual;

--공백제거
--앞뒤 공백 제거
select '['||trim('      A  BC             ')||']','['||ltrim('      A  BC             ')||']','['||rtrim('      A  BC             ')||']'
from dual;

select trim('a' from 'aaaaaaaaaaaaaaaaaaOracleaaaaaaaaaaaaa')
from dual;

--문자열 치환
select replace('abcabcabc','bc','a')
from dual;

--사원테이블에서 사원명을 조회
--단, 사원명에'A'를 'a'로 변경하여 조회
select replace(ename,'A','a'),initcap(ename)
from emp;

--동일 길이의 문자열 만들기
--왼쪽채우기
select lpad('test',10,'$'),lpad('test',15,' ')
from dual;
--오른쪽채우기
select rpad('test',10,'$'),lpad('test',15,' ')
from dual;

--사원테이블에서 사원번호,사원명,입사일을 조회
--단,사원번호 SIST_000001111의 형식으로 조회
select  concat('SIST_',lpad(EMPNO,10,0)) format_empno, ENAME, HIREDATE
from emp;

