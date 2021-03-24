--primary_column테이블의 자식 테이블 생성
--id를 사용하여 부가적인 정보를 더 저장할 때
--자식테이블의 컬럼명과 데이터형의 크기는 달라도 된다
drop table foreign_column;
create table foreign_column(
id varchar2(20) constraint fk_id references primary_column(id) on delete cascade--자식과 부모테이블의 레코드를 동시삭제 가능,
subject varchar2(30),
score number(3)
, ID);
select * from user_constraints
where constraint_type='R';

--추가성공
--부모테이블에 존재하는 값으로 레코드가 추가될 때
insert into foreign_column(id,subject,score)
values('hyun','자바',90);

insert into foreign_column(id,subject,score)
values('hyun','오라클',95);

--null입력 허용
insert into foreign_column(id,subject,score)
values('','자바',90);


select * from foreign_column;

--추가실패
--부모테이블에 존재하지 않는 값으로 추가할 때
insert into foreign_column(id,subject,score)
values('hyun2','자바',90);

--레코드삭제
--자식테이블의 레코드는 그냥 삭제된다
--부모테이블의 레코드는 자식테이블의 레코드가 존재하는 경우 삭제되지 않는다

--hyun1 아이디는 참조하는레코드가 존재하지 않으므로 바로 삭제
delete from primary_column
where id='hyun1';



--hyun 아이디는 참조하는 레코드가 존재하므로 삭제되지 않는다
delete from primary_column
where id='hyun';
--삭제할려면 자식레코드를 모두 삭제 후 부모테이블의 레코드를 삭제한다.
delete from foreign_column
where id='hyun';

delete from primary_column
where id='hyun';

select * from primary_column;
select * from foreign_column;


------------테이블단위제약사항
--자식테이블의 컬럼명과 데이터형의 크기는 달라도 된다
create table foreign_table(
r_id varchar2(30),
subject varchar2(20),
score number(3),
constraint fk_r_id foreign key(r_id) references primary_table(id)
);




