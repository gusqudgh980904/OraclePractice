--sys_refcursor�� ����Ͽ� ��ȸ
--�������� �Է¹޾� ������,������,�𵨸� ����,�ɼ��� ��ȸ�Ͽ� ����ϴ� pl/sql�ۼ�
set serveroutput on
set verify off

accept country prompt '������ �Է�:';

declare

type car_rec is record(MAKER car_country.maker%type, COUNTRY car_country.country%type,
MODEL car_maker.model%type, CAR_YEAR car_model.car_year%type, CAR_OPTION car_model.car_option%type);

cr car_rec;

c_ctr varchar(10):='&country';

car_cur sys_refcursor;

begin

if c_ctr in ('����','����') then
	open car_cur for
	select cc.maker,cc.country,cma.model,cmo.car_year,cmo.car_option
	from  car_maker cma,car_country cc,car_model cmo
	where (cma.maker(+)=cc.maker and cmo.model(+)=cma.model) and cc.country=c_ctr;

	loop
fetch car_cur into cr;
exit when(car_cur%notfound);

dbms_output.put_line(cr.maker||'/'||cr.country||'/'||cr.model||'/'||cr.car_year||'/'||cr.car_option);


end loop;


close car_cur;

else
dbms_output.put_line('����� ���Ը� �Է�');
end if;


exception
when invalid_cursor then
dbms_output.put_line('�߸��� Ŀ�� ����');
when others then
dbms_output.put_line('�˼� ���� ����'||sqlerrm);
end;
/
