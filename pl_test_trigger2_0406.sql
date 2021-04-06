--test_trigger1테이블에서 작업이 발생하면 test_trigger2테이블에서도 같은 작업이 발생하도록 trigger 구성(insert,update,delete)

create or replace trigger test_trigger1
after insert or delete or update on test_trigger1
for each row
declare


begin
		--insert
		if inserting then
		--test_trigger2테이블에 동일 값을 추가
		insert into test_trigger2(name,age)values(:new.name,:new.age);
			--transaction을 처리할 수 없다.
--		if sql%rowcount =1 then
--		commit;
--		end if;

		end if;

		--update
	 if updating then
	 update test_trigger2
	 set    age=:new.age
	 where  name=:new.name;

		end if;

		--delete
		if deleting then
		delete from test_trigger2 where name=:old.name;

		end if;


end;
/

