--procedure ����
select * from user_procedures;

--���ε� ������ ����
var r number;
var m varchar2(100);
execute proc_plus(2,3,:r,:m);

print r;
print m;

--�¾��,�̸��� �Է¹޾� ��� ����⵵�� ���
var b number;
var n varchar2;
var m varchar2;
exec proc_zodiac('����ȣ',1998,:m);

print m;


--�� ��ȸ
--Ŀ���� ������ �� �ִ� ���������� ����Ͽ� bind���� ����
var cur_zip refcursor;

--����
exec proc_zipcode('���ൿ',:cur_zip);

---insert
--bind ���� ����
var row_cnt number;
var msg varchar2(600);

--procedure����
exec proc_insert(1235,'���μ�',10,'����',:row_cnt,:msg);
--out parameter�� �����ϴ� �� ���
print row_cnt;
print msg;

select * from cp_emp4;



-----update
--bind ���� ����
var row_cnt number;
var msg varchar2(600);

--procedure����
exec proc_update(1235,'���',10,:row_cnt,:msg);

print row_cnt;
print msg;


-----delete
--bind ���� ����
var row_cnt number;
var msg varchar2(600);

--procedure����
exec proc_delete(1235,:row_cnt,:msg);

print row_cnt;
print msg;

rollback;


--���� 1��
var cur_car refcursor;

exec car_proc('K5',2,:cur_car);

select * from car_maker;

--���� 2��
var row_cnt number;
var msg varchar2(600);

exec emp_ins(1234,'����ȣ','CLERK',3000,:row_cnt,:msg);

print row_cnt;
print msg;









