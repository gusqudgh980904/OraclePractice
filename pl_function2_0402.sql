--�ΰ��� ���� �Է¹޾� ���� ū ���� ��ȯ�ϴ� �Լ��ۼ�
create or replace function repare(num1 number,num2 number)
return number
is

begin

if num1>num2 then

return num1;
end if;

if num1<num2 then

return num2;
end if;


end;
/
