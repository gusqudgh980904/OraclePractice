--���� �Է¹޾� �����ȣ,�õ�,����,��,������ ��ȸ
set serveroutput on
set verify off

accept dong prompt '�� �Է�';

declare

cnt number:=0;


begin

for z_cur in (select zipcode, SIDO, GUGUN, DONG, BUNJI
from zipcode where dong like '&dong%') loop

dbms_output.put_line(z_cur.zipcode||' '||z_cur.sido);
cnt:=cnt+1;

end loop;

if cnt=0 then
dbms_output.put_line('&dong�� �������� �ʽ��ϴ�');
end if;




end;
/
