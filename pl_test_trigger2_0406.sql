--test_trigger1���̺��� �۾��� �߻��ϸ� test_trigger2���̺����� ���� �۾��� �߻��ϵ��� trigger ����(insert,update,delete)

create or replace trigger test_trigger1
after insert or delete or update on test_trigger1
for each row
declare


begin
		--insert
		if inserting then
		--test_trigger2���̺� ���� ���� �߰�
		insert into test_trigger2(name,age)values(:new.name,:new.age);
			--transaction�� ó���� �� ����.
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

