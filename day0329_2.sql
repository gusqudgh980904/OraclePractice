select * from dba_sys_privs
where grantee='SCOTT';

--scott계정에 시노님 권한 부여
grant create synonym to scott;

--scott계정에 시노님 권한 회수
revoke create synonym from scott;

--synonym 생성
--car_model 테이블을 'cmo'라는 이름의 synonym을 부여
create synonym cmo for car_model;

--synonym을 조회하는 Data Dictionary
select * from user_synonyms;

--synonym명사용
select * from cmo;

--실제 테이블명 사용
select * from car_model;



----------------------view
select * from user_views;

grant create view to scott;
revoke create view from scott;

select * from dba_sys_privs
where grantee='SCOTT';

--단순뷰/CP_EMP4테이블을 사용한 단순 뷰 생성:view이름-view_test
create view view_emp
as select * from CP_EMP4;

select * from user_views;

--view를 사용한 조회
select * from view_emp;
--실제 테이블 조회
select * from cp_emp4;

--실제테이블에 작업을 하면 view에 바로 반영 된다
insert into cp_emp4(empno,ename,deptno,job,hiredate)
values (1234,'현병호',10,'사원',sysdate);

update cp_emp4
set    deptno=20,job='대리'
where  empno=1234;

--단순 View 작업
insert into view_emp(empno,ename,deptno,job,hiredate)
values (1234,'현병호',10,'사원',sysdate);

update view_emp
set    deptno=20,job='대리'
where  empno=1234;

select * from cp_emp4;
																														
--view 삭제
drop view view_emp;

select * from user_views;

--복합뷰:여러개의 테이블로 도출 된 뷰
create table cp_dept as select * from dept;
--cp_dept 테이블의 부서번호 컬럼 pk  설정
alter table cp_dept add constraint pk_cp_dept primary key(deptno);
--cp_emp4테이블의 deptno컬럼에 FK를 설정
alter table cp_emp4 add constraint fk_cp_emp4 foreign key(deptno) references cp_dept(deptno);

select * from user_constraints
where table_name in ('CP_DEPT','CP_EMP4');

create view emp_date as
select cd.deptno,cd.dname,loc,ce4.empno,ce4.ename,ce4.job,ce4.hiredate
from  cp_emp4 ce4,cp_dept cd
where ce4.deptno(+)=cd.deptno;

--view조회:단순쿼리로 join의 결과를 사용할 수 있다
select * from emp_date;

--실제테이블에 부서정보 추가
insert into cp_dept(deptno,dname,loc) values(50,'개발부','서울');
commit;

--실제테이블에 부서정보 추가
insert into cp_emp4(empno,ename,deptno,job,hiredate)
values (1111,'곽범수',50,'대리',sysdate);

--복합View에는 insert,update,delete 가 안됨
insert into emp_date(deptno,dname,loc) values(50,'개발부','서울');

--view삭제
