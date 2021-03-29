----------------------�����ϴ� ��ȣ�� �����ϴ� ��ü
--Data Dictionary:user_sequences
select *
from user_sequences;

--1~9999999���� 1�� �����ϴ� ������ ����
create sequence seq_test
increment by 1
start with 1
maxvalue 9999999;

--nextval�� ������� ������ ������ ���ǿ� sequence��ü�� �ö���� �ʴ´�
--nextval�� ���Ǳ� ���� currval ����ϸ� Error�߻�
select seq_test.currval
from dual;

--��ȣ���:������ cache�� ��ȣ�� ������ �������� HDD�� �������� ����
--cache�� 20���� �����Ǿ� �ִٸ� 20���� ��� ����ϸ� HDD�� �����Ѵ�
select seq_test.nextval
from dual;

--����������
drop sequence seq_test;

--��ȣ,�̸�,���̸� �����ϴ� ���̺��� ����
--��ȣ�� ���ڵ带 insert�� ������  1�� �ڵ������ؾ��ϴ� ��ȣ�� �߰��Ǿ�� �Ѵ�
create table use_seq(
num number,
name varchar2(30),
age number(3)
);

alter table use_seq add num1 char(10);

--�������� ����� ��ȣ �߰�
insert into use_seq(num,name,age)values(seq_test.nextval,'����ȣ',24);
insert into use_seq(num,name,age)values(seq_test.nextval,'���ϴ�',20);
insert into use_seq(num,name,age)values(seq_test.nextval,'���й�',22);

--�������� �����ϸ� �������� ��ȣ�� �������
insert into use_seq(num,name,age)values(seq_test.nextval,'������',2300);
select * from use_seq;

--�������� ������� �ʰ�, ���� ������ ��ȣ ������ȣ�� ����Ͽ� ���ڵ带 �߰�
--�̸�:������,����:26
insert into use_seq(num,name,age) values ((select max(num)+1 from use_seq),'������',26);


--10~9000000���� 10�� �����ϴ� �������� ����
create sequence seq_test1
increment by 10
start with   10
maxvalue 9000000
cache 100
cycle;

select * from user_sequences;

select seq_test1.nextval from dual;

--num1�÷����� insert �Ҷ����� 'I_0000001','I_0000002'ó�� �������̿�
--1�������ϴ� ���ڿ� ������ �߰�
--concat�� insert�� �ȿ��� select�� subquery�� ����� �� ����
insert into use_seq(num,name,age,num1) values ((select max(num)+1 from use_seq),'���μ�',26,
concat('I_',lpad(seq_test.nextval,8,0)));

select * from use_seq;


drop sequence seq_test;

select *from user_sequences;
select * from user_objects;
