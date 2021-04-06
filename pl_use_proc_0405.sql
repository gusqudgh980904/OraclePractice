--procedure 생성
select * from user_procedures;

--바인드 변수의 선언
var r number;
var m varchar2(100);
execute proc_plus(2,3,:r,:m);

print r;
print m;

--태어난해,이름을 입력받아 띠와 출생년도를 출력
var b number;
var n varchar2;
var m varchar2;
exec proc_zodiac('현병호',1998,:m);

print m;


--동 조회
--커서를 저장할 수 있는 데이터형을 사용하여 bind변수 선언
var cur_zip refcursor;

--실행
exec proc_zipcode('지행동',:cur_zip);

---insert
--bind 변수 선언
var row_cnt number;
var msg varchar2(600);

--procedure실행
exec proc_insert(1235,'강인섭',10,'주임',:row_cnt,:msg);
--out parameter에 존재하는 값 출력
print row_cnt;
print msg;

select * from cp_emp4;



-----update
--bind 변수 선언
var row_cnt number;
var msg varchar2(600);

--procedure실행
exec proc_update(1235,'사원',10,:row_cnt,:msg);

print row_cnt;
print msg;


-----delete
--bind 변수 선언
var row_cnt number;
var msg varchar2(600);

--procedure실행
exec proc_delete(1235,:row_cnt,:msg);

print row_cnt;
print msg;

rollback;


--숙제 1번
var cur_car refcursor;

exec car_proc('K5',2,:cur_car);

select * from car_maker;

--숙제 2번
var row_cnt number;
var msg varchar2(600);

exec emp_ins(1234,'현병호','CLERK',3000,:row_cnt,:msg);

print row_cnt;
print msg;









