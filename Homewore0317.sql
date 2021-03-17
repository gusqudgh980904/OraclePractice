-----1.테이블 생성 -----------------
create table HOMEWORK0317(
num number(5),
name varchar2(10),
class char(1),
email varchar2(50),
phonenumber varchar2(15),
adress varchar2(80),
gender varchar2(6),
javascore number(3),
Input_date date
);
---다시하기---

--purge recyclebin; */
----2.값추가-----

insert into HOMEWORK0317 values(1,'강인섭','A','kang@sist.co.kr','010-1234-5678','경기도 용인시', '남자',91,sysdate);
insert into HOMEWORK0317 values(2, '박기범', 'A', 'park@daum.net','010-7739-9761','서울시 강남구 역삼1동', '남자', 90, sysdate);
insert into HOMEWORK0317 values(3, '송준희','A', 'song@test.com','010-5878,8813','서울시 동작구 상도동', '여자',97,sysdate);
insert into HOMEWORK0317 values(4, '이학민', 'B', 'lee@google.com','011-234-7611','서울시  동대문구 동대문동', '여자', 190, sysdate);
insert into HOMEWORK0317 values(5, '한상민', 'B', 'hansang@sist.co.kr','010-4334-7656','인천시 부평구 부평3동', '여자', 89, sysdate);

---3.모든컬럼조회-----
select * from HOMEWORK0317;

---4.특정컬럼조회-----
select name,class,adress,javascore
from  HOMEWORK0317;

---5. 4번 학생의 성별을 남자로 점수를 90점으로 반을 A, 전화번호를 010-2234-7611으로 변경해주세요-----
update HOMEWORK0317
set gender='남자',javascore=90,class='A',PHONENUMBER='010-2234-7611'
where num=4;

---6.이름이 한상민인 학생의 반을 A반, 전화번호를 010-1111-2341 로 변경해주세요.
 update HOMEWORK0317
set class='A',PHONENUMBER='010-1111-2341'
where name='한상민';

---7.반이 A반인 학생을 모두삭제해보세요.
delete from HOMEWORK0317
where class='A';

---8.7번에서 삭제한 레코드를 모두 살려보세요
insert into HOMEWORK0317 values(1,'강인섭','A','kang@sist.co.kr','010-1234-5678','경기도 용인시', '남자',91,sysdate);
insert into HOMEWORK0317 values(2, '박기범', 'A', 'park@daum.net','010-7739-9761','서울시 강남구 역삼1동', '남자', 90, sysdate);
insert into HOMEWORK0317 values(3, '송준희','A', 'song@test.com','010-5878,8813','서울시 동작구 상도동', '여자',97,sysdate);
insert into HOMEWORK0317 values(4, '이학민', 'B', 'lee@google.com','011-234-7611','서울시  동대문구 동대문동', '여자', 190, sysdate);
insert into HOMEWORK0317 values(5, '한상민', 'B', 'hansang@sist.co.kr','010-4334-7656','인천시 부평구 부평3동', '여자', 89, sysdate);

---9.테이블을 삭제해 보세요.
drop table HOMEWORK0317;

--10.휴지통을 확인하고, 휴지통에 버려진 테이블을 복구해보세요.
flashback table HOMEWORK0317 to before drop;

--11.테이블의 모든 레코드를 절삭해보세요.
delete from HOMEWORK0317;

--12.테이블을 삭제해보세요.
drop table HOMEWORK0317;

--13.휴지통을 확인하고, 휴지통을 비워보세요.
--show recyclebin;
purge recyclebin;
