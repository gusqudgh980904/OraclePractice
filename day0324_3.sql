--unuque 사용
--번호,이름,전화번호를 저장


--컬럼단위 제약사항
create table unique_column(
num number,
name varchar2(30),
phone varchar2(13) constraint uk_phone unique
);

--제약사항확인
select * from user_constraints;
--생성된 인덱스 확인
select * from user_indexes;

--추가성공
--최초입력
insert into unique_column(num,name,phone)
values(1,'테스트','010-1234-1234');
--다른 전화번호가 입력
insert into unique_column(num,name,phone)
values(2,'테스트','010-1234-5678');
--전화번호에 null이 입력된 경우
insert into unique_column(num,name,phone)
values(3,'테스트','');


insert into unique_column(num,name)
values(4,'테스트');

--에러발생
--같은 전화번호가 입력되면 error
insert into unique_column(num,name,phone)
values(5,'이하늘','010-1234-1234');

select * from unique_column;


--테이블단위 제약사항
create table unique_table(
num number,
name varchar2(30),
email varchar2(50),
card_num char(4),
constraint uk_email unique(email),
constraint uk_card_num unique(card_num)
);

select * from user_constraints
where constraint_type='U';

select * from user_constraints
where table_name='UNIQUE_TABLE';
