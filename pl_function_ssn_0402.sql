--�ֹι�ȣ�� �Է¹޾� ��ȿ�� ������ �� ��ȿ�ϸ� sist_num�� ��ȯ�ϰ�,
--��ȿ���� ������ �׻� SIST_0000000000�� ��ȯ�ϴ� �Լ��� �ۼ�
--���ڸ����� 2,3,4,5,6,7,8,9,2,3,4,5�� ���Ѱ��� ���� ��,11�� ���� �������� ���ϰ�
--11���� �� ��, 10���� ���� �������� �ֹι�ȣ�� �������ڸ��� ���ٸ� '��ȿ' �׷��� �ʴٸ� '��ȿ'
create or replace function chk_ssn(ssn char)
return char
is

temp_num number:=0;
flag_num number:=2;
result_num varchar(15):='SIST_0000000000';


begin

if instr(ssn,'-')=7 then

for i in 1..length(ssn)-1 loop--�ֹι�ȣ�� ������ �ڸ��� ������ �ݺ�
 if i<>7 then-- -�� ������ ���ڸ� ���꿡 ����
 temp_num:=temp_num+substr(ssn,i,1)*flag_num;

 --�����ؾ� �ϴ� ���ڸ� 1������
 flag_num:=flag_num+1;

 	if flag_num=10 then  --�����ؾ� �ϴ� ���ڰ� 9�� �Ѿ�� 2���� �ٽý���
 	flag_num:=2;
 	end if;

end if;

end loop;
--�ֹι�ȣ�� checksum code�� ������ ����� ��

temp_num:=mod(11-mod(temp_num,11),10);--0~9������ 10�ڸ� ���� ���´�

if temp_num=substr(ssn,14) then--����� ��� ���� �ֹι�ȣ�� ���ڸ��� ���ٸ�
--�������� ����� ���� ��ȣ�� ��´�
result_num:=sist_num();

end if;


end if;




	return result_num;
end;
/
