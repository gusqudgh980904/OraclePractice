--동을 입력받아 우편번호,시도,구군,동,번지를 조회
set serveroutput on
set verify off

accept dong prompt '동 입력';

declare

cnt number:=0;


begin

for z_cur in (select zipcode, SIDO, GUGUN, DONG, BUNJI
from zipcode where dong like '&dong%') loop

dbms_output.put_line(z_cur.zipcode||' '||z_cur.sido);
cnt:=cnt+1;

end loop;

if cnt=0 then
dbms_output.put_line('&dong은 존재하지 않습니다');
end if;




end;
/
