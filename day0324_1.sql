--컬럼단위 제약사항 Primary key를 설정
--이름,전화번호,아이디를 저장하는 테이블 생성

--컬럼명 데이터형(크기) primary key ->제약사항명이 자동으로 생성됨(권장X)
--예)sysc_000988,제약사항명으로 어떤 제약을 위배하였는지 알 수 없다
drop table primary_column;

create table primary_column(
name varchar2(20),
phone varchar2(13),
id varchar2(20) constraint pk_primary_column primary key
);

--제약사항을 조회
select * from user_constraints
where table_name='PRIMARY_COLUMN';

--추가성공
--최초입력
insert into primary_column(name,phone,id) values('현병호','010-1234-5678','hyun');
--아이디가 다를 때
insert into primary_column(name,phone,id) values('현병호','010-1234-5678','hyeon');

--추가실패
--null이 입력될 때
--컬럼명이 생략되는 경우
insert into primary_column(name,phone) values('현병호','010-1234-5678');
--''가 입력되는경우
insert into primary_column(name,phone,id) values('현병호','010-1234-5678','');
--같은값이 입력되는 경우
insert into primary_column(name,phone,id) values('한상민','010-1224-5638','hyun');

select * from primary_column;


--테이블단위 제약사항
--컬럼의 정의와 제약사항의 정의를 분리하여 작성 할 수 있다
create table primary_table(
name varchar2(20),
phone varchar2(13),
id varchar2(20),
constraint pk_primary_table primary key(id)
);

--추가성공
insert into primary_table(name,phone,id) values ('현병호','010-1234-5678','hyun');

select * from primary_table;

select * from user_constraints;


--------여러개의 컬럼이 하나의 PK로 구성
--아이템번호,아이템명,생산일자,설명
--(아이템은 하루에 한번만 생산가능)
create table primary_multi(
item_num number(6),
item_name varchar(60),
item_date char(8),
item_info clob,
constraint pk_primary_multi primary key(item_num,item_date)
);

select *from user_constraints
where table_name='PRIMARY_MULTI';

--추가성공하는 경우
--최초데이터 입력
insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'키보드','20210301','멤브레인 방식으로저렴한키보드.반발력이 떨어짐');

insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'키보드','20210302','멤브레인 방식으로저렴한키보드.반발력이 떨어짐');

insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'키보드','20210303','멤브레인 방식으로저렴한키보드.반발력이 떨어짐');
--아이템 번호와 날짜가 다르면 입력가능
insert into primary_multi(item_num,item_name,item_date,item_info)
values(1002,'키보드','20210301','기계식 키보드로 청축,흑축,적축,갈축이 있으며.취향에 따라 원하는 축을 선택할 수 있다');


--에러
--아이템번호와 생산일자가 같은 경우 에러가 남
insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'마우스','20210301','손목을 보호하기 ㅜ이해 손의 각도를 계산하여 제작한 제품으로 어차피 insert 안됨');
--null이 입력되면 error
insert into primary_multi(item_name,item_date,item_info)
values('키보드','20210303','멤브레인 방식으로저렴한키보드.반발력이 떨어짐');

insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'키보드','','멤브레인 방식으로저렴한키보드.반발력이 떨어짐');

select * from primary_multi;

--primary key를 설정하면 unique index가 자동설정됨
--index를 확인하는 Data Dictionary는 user_indexes
select * from user_indexes;
