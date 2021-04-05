--1. 모델명, 번호를 입력받아  제조국, 제조사, 모델명, 연식, 가격, 옵션을 조회하여 sys_refcursor에 저장하고 출력하는 Procedure를 작성하세요.
--
--단, 조회는 입력일의 내림차순으로 조회하는 데 번호가 1번이 입력되면 1~10사이의 레코드가 조회되고
--2번이 입력되면 11~20 사이의 레코드가 조회되고, 3이 입력되면 21~30 사이의 레코드가
--조회되어야 한다.
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
