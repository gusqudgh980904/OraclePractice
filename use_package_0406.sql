select*from user_procedures;

--��Ű������� �Լ��� ���
--�Լ��� ��������
select test_pack.birth(24)
from dual;

--��Ű������� ���ν����� ���
var cur_car refcursor;

exec test_pack.car_list(1,:cur_car);

print cur_car;
