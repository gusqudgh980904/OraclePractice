select * from user_indexes;

select * from user_ind_columns
where table_name='EMP';

select rowid from emp;


--인덱스설정할 테이블생성
create table zipcode_idx as select * from zipcode;

--unique 인덱스 설정
create unique index idx_zipcode on zipcode_idx(seq);

drop index idx_zipcode;

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name='ZIPCODE_IDX';



select zipcode,sido,gugun,dong,bunji
from zipcode
where seq=50000;

select zipcode,sido,gugun,dong,bunji
from zipcode_idx
where seq=50000;


--인덱스를 사용한 문자열의 정렬
select zipcode,sido,gugun,dong,bunji
from zipcode
where dong='흑석동'
order by dong desc;

--인덱스 설정
create index dong_idx on zipcode_idx(dong);

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name='ZIPCODE_IDX';

--hint설정
select /*+ index_desc(zipcode_idx dong_idx)*/zipcode,sido,gugun,dong,bunji
from zipcode_idx
where dong>='가' and dong='흑석동';


--날짜함수
--date형은 +,-로 연산하면 일자에 대한 연산을 수행한다
--쿼리가 실행되는 시점의 날짜와 내일의 날짜를 구하기
select sysdate,sysdate-14,sysdate+2
from dual;

--현재월에서 월 더하기 연산
--add_month(날짜,더할 개월수)
select add_months(sysdate,1)
from dual;

--두 날짜간의 개월 차이:months_between(큰날짜,작은날짜)
select months_between('2020-03-30','2020-01-30')
from dual;
