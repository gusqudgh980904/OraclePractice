--trigger ����
create or replace trigger TEST_TRIGGER1
after insert or update or delete on test_trigger1
for each row
declare


begin

--triggering event ��
	 if inserting then
	 dbms_output.put_line('�߰��۾��߻�.������'||:old.name||'/ ���� ��'||:new.name);
	 end if;

	 if updating then
	 dbms_output.put_line('�����۾��߻�.������'||:old.name||'/���� ��'||:new.name);
	 end if;

	 if deleting then
	 dbms_output.put_line('�����۾��߻�.������'||:old.name||'/���� ��'||:new.name);
	 end if;

end;
/
