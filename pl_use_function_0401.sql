select * from user_procedures
where object_type='FUNCTION';


--간접실행
select plus(1,2)
from dual;


select repare(500,501)
from dual;

--1에서부터 999999999999까지 1씩 증가하는 시퀀스 생성
create sequence seq_func
increment by 1
start with 1
maxvalue 999999999999
cache 25
nocycle;

--매개변수가 없는 함수는 호출할 때 함수명만 써도 되고 ,함수명()를 붙여도 된다
select sist_num
from dual;

--코드값을 반환하는 함수는 insert할 때 주로 사용한다
create table function_insert(
num char(15) constraint pk_function_insert primary key,
name varchar2(15)
);

--함수에 ()넣고 테스트
insert into function_insert(num,name) values(sist_num(),'강인섭');

--함수에 ()빼고 테스트
insert into function_insert(num,name) values(sist_num,'조혜원');

select *from FUNCTION_INSERT;

--함수 삭제
drop function plus;
drop function repare;

select chk_ssn('123212-1234567')
from dual;

--난수뽑기:패키지를 사용한 함수 DBMS_RANDOM.value