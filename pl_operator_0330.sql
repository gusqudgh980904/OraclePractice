--태어난 해를 변수에 저장하고, 변수를 사용하여 나이 구하기
set serveroutput on

declare
--변수선언
birthyear number(4);

begin
--값할당
birthyear:=1998;


dbms_output.put_line(2021-birthyear+1);

--Error:관계연산자는 출력할 수 없다.
--dbms_output.put_line(2021>birthyear);
end;
/
