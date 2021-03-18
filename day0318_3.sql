--지번주소를 저장하는 테이블 생성
--우편변호,시도,구군,동,번지,sequence로 이루어져 있다
create table zipcode(
zipcode char(7),
sido char(6),
gugun varchar2(25),
dong varchar(100),
bunji varchar2(25),
seq number(5)
);

truncate table zipcode;

select * from zipcode;

--동이름으로 우편번호 검색
select  zipcode,sido,gugun,dong,bunji
from zipcode
where  dong like '생연동%';
