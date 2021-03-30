--숙제 2.
--나이를 accept으로 입력받아 태어난 해를 구해서 출력하는 PL/SQL을 작성하세요.

set serveroutput on

--변수선언
accept age prompt '나이';


declare


begin

dbms_output.put_line(2021-&age+1);


end;
/
