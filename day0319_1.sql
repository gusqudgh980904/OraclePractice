select '현병호' name,20 age
from dual;

------수치함수
------절대값
select abs(-3),abs(3)
from dual;

------반올림 round(값,반올림 했을 때 볼 자릿수)
--매개변수를 넣지 않으면 소숫점 첫째자리에서 반올림을 함,'.'은 0
--정수에서는 해당 자리에서 반올림됨
select round(555.555,2),round(555.554,2),round(555.554),round(555.554,-1),round(555.554,-2)
from dual;

--올림 ceil(값)
select ceil(10.1),ceil(10.0)
from dual;

--내림 floor(값)
select floor(10.1),floor(10.8)
from dual;

--절사 trunc()
select trunc(555.555,2),trunc(555.555,-1),trunc(555.555)
from dual;


--사원테이블에서 사원번호,사원명,연봉,세금을 조회
--단,세금은 연봉에 3.3% 계산하여 원단위 절사하여 조회한다.
select EMPNO, ENAME, SAL,trunc(sal*0.033,-1) tax
from emp;


-------------null변환
select nvl('','널'),nvl(null,'변환값')
from dual;

--사원테이블에서 사원번호,사원명,연봉,보너스를 조회
--단, 보너스가 없다면 100으로 출력
select  EMPNO, ENAME, SAL, nvl(COMM,100) comm
from emp;

--사원테이블에서 사원번호,사원명,연봉,보너스,총수령액
--총수령액은
select EMPNO, ENAME, SAL,comm,sal+nvl(comm,0) total
from emp;

--null이 아닐 때 제공할 값과 null일 때 제공할 값을 설정
select nvl2('','null아님','null임'),nvl2('a','null아님','null임')
from dual;

--사원 테이블에서 사원번호,사원명,매니저 존재여부를 조회
--매니저가 존재하면 0,매니저가 존재하지 않으면 1을 조회
select empno,ename,nvl2(mgr,0,1)
from emp;

---insert 컬럼에 null이 입력되는 상황
--number나 date는 컬럼이 생략된 경우에 null이 입력됨
alter table test1 add input_date date;

insert into test1(name) values('테스트');
select *from test1;
commit;

--varchar2나 char는 컬럼이 생략된 경우와 ''가 입력되는 경우에 null이 입력
--컬럼이 생략된  경우
insert into test1(age,input_date) values (20,sysdate);
--''입력된 경우
insert into test1(name,age,input_date) values ('',30,sysdate);
select *from test1;

--test1테이블에서 이름 나이를 조회
--단,이름이 null인 경우 '없음'으로 나이가 null인 경우 0으로 출력
select nvl(name,'없음') name,nvl(age,0)
from test1;
