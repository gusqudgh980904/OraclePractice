--�������� ����Ͽ� ���������̸� �����ϴ� ���������� ���ڿ��� ��ȯ�ϴ� �Լ�
--Ű�� ����ϴ� ���
--SIST_0000000001�� �������� ��ȯ�Ǿ�� �Ѵ�
create or replace function sist_num
return char
is
temp_num varchar2(15);
begin

temp_num:=concat('SIST_',lpad(seq_func.nextval,10,0));

return temp_num;
end;
/
