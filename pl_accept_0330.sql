--accept ���
set serveroutput on
set verify off

accept name prompt '�̸��Է�:'

declare

begin
	dbms_output.put_line('&name');
end;
/
