--제조사가'현대',기아',BMW',인 모든 차량의 제조국,제조사,모델명,연식,가격,옵션을 조회
--Oracle
select cc.country,cc.maker,cma.model,cmo.car_year,cmo.price,cmo.car_option
from car_country cc,car_maker cma,car_model cmo
where (cma.maker=cc.maker and cmo.model(+)=cma.model)
				and cma.maker in ('현대','기아','BMW');

--ANSI
select  cc.country,cc.maker,cma.model,cmo.car_year,cmo.price,cmo.car_option
from  car_country cc
inner join car_maker cma
on    cma.maker=cc.maker
left join car_model cmo
on    cma.model=cmo.model
where cma.maker in('현대','기아','BMW');

drop table zipcode;
drop table emp;
drop table homework0324;
drop table DEPT;

purge recyclebin;
