--chek,nut null,default
--나이는 20~30대만 입력,이름은 반드시 입력,입력일이 생략되면 레코드가 추가되는 시점에 날짜 정보로 추가
create table other_constraint(
num number(5),
name varchar2(30 byte) not null,
age number(2) check(age between 20 and 39),
input_date date default sysdate
);

--제약사항 확인
select * from user_constraints
where table_name='OTHER_CONSTRAINT';

--default 확인
select * from user_tab_cols
where table_name='OTHER_CONSTRAINT';

--추가성공
--이름이 입력되면서,나이가 20~30대, 입력일은 누락되도 된다
insert into OTHER_CONSTRAINT(num,name,age,input_date)
values(1,'박기범',25,sysdate);

--이름이 입력되면서,나이가20~30대, 입력일은 누락되도 된다-default
insert into OTHER_CONSTRAINT(num,name,age)
values(2,'강인섭',26);

--delete  from OTHER_CONSTRAINT;

--추가실패
--check 조건에 위배
insert into OTHER_CONSTRAINT(num,name,age)
values(3,'곽범수',19);

insert into OTHER_CONSTRAINT(num,name,age)
values(3,'곽범수',40);

--not null 조건에 위배
insert into OTHER_CONSTRAINT(num,name,age)
values(3,'',40);

insert into OTHER_CONSTRAINT(num,age)
values(3,40);









select * from OTHER_CONSTRAINT;
