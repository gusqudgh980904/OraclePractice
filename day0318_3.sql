--�����ּҸ� �����ϴ� ���̺� ����
--����ȣ,�õ�,����,��,����,sequence�� �̷���� �ִ�
create table zipcode(
zipcode char(7),
sido char(6),
gugun varchar2(25),
dong varchar(100),
bunji varchar2(25),
seq number(5)
);

truncate table zipcode;

select * from zipcode;

--���̸����� �����ȣ �˻�
select  zipcode,sido,gugun,dong,bunji
from zipcode
where  dong like '������%';
