--�����簡'����',���',BMW',�� ��� ������ ������,������,�𵨸�,����,����,�ɼ��� ��ȸ
--Oracle
select cc.country,cc.maker,cma.model,cmo.car_year,cmo.price,cmo.car_option
from car_country cc,car_maker cma,car_model cmo
where (cma.maker=cc.maker and cmo.model(+)=cma.model)
				and cma.maker in ('����','���','BMW');

--ANSI
select  cc.country,cc.maker,cma.model,cmo.car_year,cmo.price,cmo.car_option
from  car_country cc
inner join car_maker cma
on    cma.maker=cc.maker
left join car_model cmo
on    cma.model=cmo.model
where cma.maker in('����','���','BMW');

drop table zipcode;
drop table emp;
drop table homework0324;
drop table DEPT;

purge recyclebin;
