--1. �𵨸�, ��ȣ�� �Է¹޾�  ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ�Ͽ� sys_refcursor�� �����ϰ� ����ϴ� Procedure�� �ۼ��ϼ���.
--
--��, ��ȸ�� �Է����� ������������ ��ȸ�ϴ� �� ��ȣ�� 1���� �ԷµǸ� 1~10������ ���ڵ尡 ��ȸ�ǰ�
--2���� �ԷµǸ� 11~20 ������ ���ڵ尡 ��ȸ�ǰ�, 3�� �ԷµǸ� 21~30 ������ ���ڵ尡
--��ȸ�Ǿ�� �Ѵ�.
create or replace procedure car_proc(model varchar2,num number,cur_car out sys_refcursor)
is

i_model varchar2(100):=model;
--i_num number:=num;

begin

if num=1 then
open cur_car for
select COUNTRY, MAKER, MODEL,car_year, trim(to_char(PRICE,'999,999,999')) price,car_option,hiredate_rank

from (select COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE,cmo.car_option,
						row_number() over(order by cmo.HIREDATE desc) as hiredate_rank
					from car_country cc,car_maker cma,car_model cmo
					where (cma.maker(+)=cc.maker and cmo.model(+)=cma.model))
where model like i_model and (hiredate_rank between 1 and 10);

end if;

if num=2 then
open cur_car for
select COUNTRY, MAKER, MODEL,car_year, trim(to_char(PRICE,'999,999,999')) price,car_option,hiredate_rank

from (select COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE,cmo.car_option,
						row_number() over(order by cmo.HIREDATE desc) as hiredate_rank
					from car_country cc,car_maker cma,car_model cmo
					where (cma.maker(+)=cc.maker and cmo.model(+)=cma.model))
where model like i_model and (hiredate_rank between 11 and 20);

end if;

if num=3 then
open cur_car for
select COUNTRY, MAKER, MODEL,car_year, trim(to_char(PRICE,'999,999,999')) price,car_option,hiredate_rank

from (select COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE,cmo.car_option,
						row_number() over(order by cmo.HIREDATE desc) as hiredate_rank
					from car_country cc,car_maker cma,car_model cmo
					where (cma.maker(+)=cc.maker and cmo.model(+)=cma.model))
where model like i_model and (hiredate_rank between 21 and 30);

end if;





end;
/
