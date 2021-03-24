--1.아래의 데이터를 입력 할 수 있는 테이블을 생성하고, 적합하다고 판단되는 컬럼에
-- primary key, foreign key, unique를  부여하세요.
--  foreign key : dept테이블을 참조하여 키를 설정
--
-- 테이블은 번호, 아이디, 이름, 나이, 부서번호, 전화번호, 우편번호, 주소를  저장할 수 있습니다.
create table Homework0324 (
num number(2),
id varchar(30),
name varchar(10),
age number(2),
deptno number(2) constraint fk_dept_deptno references dept(deptno) on delete cascade,
phone_num varchar2(13) constraint uk_phone_num unique,
zipcode char(7) constraint pk_zipcode primary key,
addres varchar2(60)
);

select * from Homework0324;
select * from zipcode;
select * from dept;


--2.위의 테이블을 사용하여 제약사항을 만족하는 쿼리와 제약사항을 만족하지 않는
--모든 쿼리를 만들어 보세요.
--추가성공
--최초입력
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','현병호',24,10,'010-1234-1234','123-123','경기도 동두천시');
--우편번호가 다를 때,핸드폰 번호가다를 때-PK,UK가 다름
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','현병호',24,10,'010-1234-1235','123-124','경기도 동두천시');
--deptno,phone_num에 null이 입력되거나 20,30,40 입력
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(2,'hyun','현병호',24,20,'010-1234-1236','123-125','경기도 동두천시');
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(3,'hyun','현병호',24,'','','123-126','경기도 동두천시');


--추가실패
--PK에 null이 입력될 때-zipcode
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','현병호',24,10,'010-1234-1234','','경기도 동두천시');
--PK에 컬럼명이 생략되는 경우
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM,ADDRES) values(1,'hyun','현병호',24,10,'010-1234-1234','123-123','경기도 동두천시');
--''가 입력되는경우
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','현병호',24,10,'010-1234-1234','','경기도 동두천시');
--같은값이 입력되는 경우
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','현병호',24,10,'010-1234-1234','123-123','경기도 동두천시');

select * from Homework0324;
