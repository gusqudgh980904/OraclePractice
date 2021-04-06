--package body����

create or replace package body test_pack
as

--birth����
function birth(age number) return number
is
	 birth_year number;
begin

birth_year:=to_char(sysdate,'yyyy')-age+1;

	return birth_year;
end birth;
--birth��

--������ȸ ����
procedure car_list(num number,car_data out sys_refcursor)
is

start_num number:=num;
end_num number:=0;

begin

if num<1  then
--�Է°��� 1���� ���� ��� ���۹�ȣ�� 1�� �����Ѵ�
	start_num:=1;
end if;

start_num:=start_num*10-10+1;
end_num:=start_num+9;

open car_data for
select country,maker,model,car_year,price,car_option ,r_num

from	(select  cc.country,cc.maker,cma.model,cmo.car_year,cmo.price,cmo.car_option
					,row_number() over(order by cmo.hiredate desc) as r_num
			from car_country cc,car_maker cma,car_model cmo
			where (cma.maker=cc.maker and cmo.model=cma.model))

where r_num between start_num and end_num;


end car_list;
--������ȸ ��

end;
/
