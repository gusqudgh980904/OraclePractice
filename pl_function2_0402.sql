--두개의 수를 입력받아 둘중 큰 수를 반환하는 함수작성
create or replace function repare(num1 number,num2 number)
return number
is

begin

if num1>num2 then

return num1;
end if;

if num1<num2 then

return num2;
end if;


end;
/
