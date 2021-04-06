--trigger 선언
create or replace trigger TEST_TRIGGER1
after insert or update or delete on test_trigger1
for each row
declare


begin

--triggering event 비교
	 if inserting then
	 dbms_output.put_line('추가작업발생.이전값'||:old.name||'/ 이후 값'||:new.name);
	 end if;

	 if updating then
	 dbms_output.put_line('변경작업발생.이전값'||:old.name||'/이후 값'||:new.name);
	 end if;

	 if deleting then
	 dbms_output.put_line('삭제작업발생.이전값'||:old.name||'/이후 값'||:new.name);
	 end if;

end;
/
