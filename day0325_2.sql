----alter 사용
create table test_alter(
num number,
name varchar2(30),
age number(2),
addr number
);

--컬럼명 변경
--neam->name으로 변경
alter table test_alter rename column neam to name;

--컬럼의 데이터형 변경
--addr컬럼의 데이터형을 number->varchar2(300) 변경
--레코드가 존재하면 동일 데이터형에서 크기만 변경되고, 레코드가 존재하지 않으면
--데이터형 자체도 변경가능
alter table test_alter modify addr varchar2(300);

--레코드 삽입
insert into test_alter(num,name,age,addr)
values(1,'박기범',27,'서울시 강남구 역삼동');

select * from test_alter;
commit;

--레코드가 존재하면 데이터형을 변경할 수 없다
alter table test_alter modify addr number;

--age를 numer(2) -> number(22)로 변경
alter table test_alter modify age number(22);


--컬럼삭제
--age컬럼 삭제
alter table test_alter drop column age;


truncate table test_alter;
--컬럼추가(컬럼단위 제약사항을 추가할 수 있다
--id 컬럼추가(primary key)

alter table test_alter add id varchar2(20) constraint pk_test_alter primary key;

--DD에서 위의 쿼리문에서 부여된 제약 사항을 조회
select *  from user_constraints
where table_name='TEST_ALTER';

--컬럼을 변경할때에도 제약사항을 설정할 수 있다
--name varchar2(15)로 필수입력 제약 설정
alter table test_alter modify name varchar2(15) not null;


--제약사항변경
--PK가 활성화 되어있으므로 같은 id는 추가될 수 없다.
insert into test_alter (ID, NAME)
values ('kim','김덕영');


--제약사항의 비활성화
alter table test_alter disable constraint pk_test_alter;


insert into test_alter (ID, NAME)
values ('kim','곽범수');

--제약사항을 활성화(제약사항에 위배되는 레코드가 존재하면 제약사항이 활성화되지 않는다)
delete from test_alter
where name='곽범수';
commit;

alter table test_alter enable constraint pk_test_alter;


select* from test_alter;

--제약사항 삭제
--Primary key를 삭제하면 not null은 삭제되지 않는다
--DBA(개발자)가 부여한 제약사항명으로 삭제
alter table test_alter drop constraint pk_test_alter;
--자동으로 부여된 제약사항명으로 삭제
alter table test_alter drop constraint SYS_C007518;

--제약사항 추가(테이블단위 제약사항 문법)
--id 컬럼에 PK제약을 추가
alter table test_alter add constraint pk_id, ID primary key(id);
