--�¾��(880101)�� ����(1,2,3,4)�� �Ű����� �ΰ��� �Է¹޾� ��ȿ�� �ֹι�ȣ�� �����Ͽ�
--��ȯ�ϴ� �Լ��� �ۼ�
--create_ssn('880101','1')
create or replace function create_ssn(ssn char,gender char)
return number
is

eff_ssn char(15);

temp_num number:=0;
flag_num number:=2;

begin

if instr(ssn,'-')=7 then

for i in 1..length(ssn)-1 loop--
 if i<>7 then
 temp_num:=temp_num+substr(ssn,i,1)*flag_num;


 flag_num:=flag_num+1;

 	if flag_num=10 then
 	flag_num:=2;
 	end if;

end if;

end loop;


temp_num:=mod(11-mod(temp_num,11),10);

if temp_num=substr(ssn,14) then

eff_ssn:=sist_num();

end if;


end if;




	return eff_ssn;
end;
/
