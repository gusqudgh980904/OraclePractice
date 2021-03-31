--1~100까지 반복 출력하는 while
set serveroutput on

declare

i number;


begin

i:=1;--초기값

while i<11 loop--조건식

dbms_output.put(i||' ');
i:=i+1;--증.감소식

end loop;

dbms_output.put_line(' ');

--1~100까지 출력하고 3의 배수에서 '짝'을 출력
i:=1;

while i<100 loop

if (mod(i,3)=0) then
dbms_output.put('짝');
else
dbms_output.put(i||' ');
end if;
i:=i+1;
end loop;
dbms_output.put_line(' ');




end;
/
