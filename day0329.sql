----------------------증가하는 번호를 관리하는 개체
--Data Dictionary:user_sequences
select *
from user_sequences;

--1~9999999까지 1씩 증가하는 시퀀스 생성
create sequence seq_test
increment by 1
start with 1
maxvalue 9999999;

--nextval을 사용하지 않으면 접속자 세션에 sequence객체가 올라오지 않는다
--nextval이 사용되기 전에 currval 사용하면 Error발생
select seq_test.currval
from dual;

--번호얻기:설정한 cache의 번호를 소진할 때까지는 HDD를 접속하지 않음
--cache가 20으로 설정되어 있다면 20개를 모두 사용하면 HDD를 변경한다
select seq_test.nextval
from dual;

--시퀀스삭제
drop sequence seq_test;

--번호,이름,나이를 저장하는 테이블을 생성
--번호는 레코드를 insert할 때마다  1씩 자동증가해야하는 번호로 추가되어야 한다
create table use_seq(
num number,
name varchar2(30),
age number(3)
);

alter table use_seq add num1 char(10);

--시퀀스를 사용한 번호 추가
insert into use_seq(num,name,age)values(seq_test.nextval,'현병호',24);
insert into use_seq(num,name,age)values(seq_test.nextval,'이하늘',20);
insert into use_seq(num,name,age)values(seq_test.nextval,'이학민',22);

--쿼리문이 실패하면 시퀀스의 번호는 사라진다
insert into use_seq(num,name,age)values(seq_test.nextval,'진재혁',2300);
select * from use_seq;

--시퀀스를 사용하지 않고, 가장 마지막 번호 다음번호를 사용하여 레코드를 추가
--이름:진재혁,나이:26
insert into use_seq(num,name,age) values ((select max(num)+1 from use_seq),'진재혁',26);


--10~9000000까지 10씩 증가하는 시퀀스를 생성
create sequence seq_test1
increment by 10
start with   10
maxvalue 9000000
cache 100
cycle;

select * from user_sequences;

select seq_test1.nextval from dual;

--num1컬럼에는 insert 할때마다 'I_0000001','I_0000002'처럼 고정길이에
--1씩증가하는 문자열 값으로 추가
--concat은 insert문 안에서 select의 subquery로 사용할 수 없다
insert into use_seq(num,name,age,num1) values ((select max(num)+1 from use_seq),'강인섭',26,
concat('I_',lpad(seq_test.nextval,8,0)));

select * from use_seq;


drop sequence seq_test;

select *from user_sequences;
select * from user_objects;
