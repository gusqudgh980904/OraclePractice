select * from user_indexes;

select * from user_ind_columns
where table_name='EMP';

select rowid from emp;


--�ε��������� ���̺����
create table zipcode_idx as select * from zipcode;

--unique �ε��� ����
create unique index idx_zipcode on zipcode_idx(seq);

drop index idx_zipcode;

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name='ZIPCODE_IDX';



select zipcode,sido,gugun,dong,bunji
from zipcode
where seq=50000;

select zipcode,sido,gugun,dong,bunji
from zipcode_idx
where seq=50000;


--�ε����� ����� ���ڿ��� ����
select zipcode,sido,gugun,dong,bunji
from zipcode
where dong='�漮��'
order by dong desc;

--�ε��� ����
create index dong_idx on zipcode_idx(dong);

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name='ZIPCODE_IDX';

--hint����
select /*+ index_desc(zipcode_idx dong_idx)*/zipcode,sido,gugun,dong,bunji
from zipcode_idx
where dong>='��' and dong='�漮��';


--��¥�Լ�
--date���� +,-�� �����ϸ� ���ڿ� ���� ������ �����Ѵ�
--������ ����Ǵ� ������ ��¥�� ������ ��¥�� ���ϱ�
select sysdate,sysdate-14,sysdate+2
from dual;

--��������� �� ���ϱ� ����
--add_month(��¥,���� ������)
select add_months(sysdate,1)
from dual;

--�� ��¥���� ���� ����:months_between(ū��¥,������¥)
select months_between('2020-03-30','2020-01-30')
from dual;
