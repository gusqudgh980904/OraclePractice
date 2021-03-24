--�÷����� ������� Primary key�� ����
--�̸�,��ȭ��ȣ,���̵� �����ϴ� ���̺� ����

--�÷��� ��������(ũ��) primary key ->������׸��� �ڵ����� ������(����X)
--��)sysc_000988,������׸����� � ������ �����Ͽ����� �� �� ����
drop table primary_column;

create table primary_column(
name varchar2(20),
phone varchar2(13),
id varchar2(20) constraint pk_primary_column primary key
);

--��������� ��ȸ
select * from user_constraints
where table_name='PRIMARY_COLUMN';

--�߰�����
--�����Է�
insert into primary_column(name,phone,id) values('����ȣ','010-1234-5678','hyun');
--���̵� �ٸ� ��
insert into primary_column(name,phone,id) values('����ȣ','010-1234-5678','hyeon');

--�߰�����
--null�� �Էµ� ��
--�÷����� �����Ǵ� ���
insert into primary_column(name,phone) values('����ȣ','010-1234-5678');
--''�� �ԷµǴ°��
insert into primary_column(name,phone,id) values('����ȣ','010-1234-5678','');
--�������� �ԷµǴ� ���
insert into primary_column(name,phone,id) values('�ѻ��','010-1224-5638','hyun');

select * from primary_column;


--���̺���� �������
--�÷��� ���ǿ� ��������� ���Ǹ� �и��Ͽ� �ۼ� �� �� �ִ�
create table primary_table(
name varchar2(20),
phone varchar2(13),
id varchar2(20),
constraint pk_primary_table primary key(id)
);

--�߰�����
insert into primary_table(name,phone,id) values ('����ȣ','010-1234-5678','hyun');

select * from primary_table;

select * from user_constraints;


--------�������� �÷��� �ϳ��� PK�� ����
--�����۹�ȣ,�����۸�,��������,����
--(�������� �Ϸ翡 �ѹ��� ���갡��)
create table primary_multi(
item_num number(6),
item_name varchar(60),
item_date char(8),
item_info clob,
constraint pk_primary_multi primary key(item_num,item_date)
);

select *from user_constraints
where table_name='PRIMARY_MULTI';

--�߰������ϴ� ���
--���ʵ����� �Է�
insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'Ű����','20210301','��극�� �������������Ű����.�ݹ߷��� ������');

insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'Ű����','20210302','��극�� �������������Ű����.�ݹ߷��� ������');

insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'Ű����','20210303','��극�� �������������Ű����.�ݹ߷��� ������');
--������ ��ȣ�� ��¥�� �ٸ��� �Է°���
insert into primary_multi(item_num,item_name,item_date,item_info)
values(1002,'Ű����','20210301','���� Ű����� û��,����,����,������ ������.���⿡ ���� ���ϴ� ���� ������ �� �ִ�');


--����
--�����۹�ȣ�� �������ڰ� ���� ��� ������ ��
insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'���콺','20210301','�ո��� ��ȣ�ϱ� ������ ���� ������ ����Ͽ� ������ ��ǰ���� ������ insert �ȵ�');
--null�� �ԷµǸ� error
insert into primary_multi(item_name,item_date,item_info)
values('Ű����','20210303','��극�� �������������Ű����.�ݹ߷��� ������');

insert into primary_multi(item_num,item_name,item_date,item_info)
values(1000,'Ű����','','��극�� �������������Ű����.�ݹ߷��� ������');

select * from primary_multi;

--primary key�� �����ϸ� unique index�� �ڵ�������
--index�� Ȯ���ϴ� Data Dictionary�� user_indexes
select * from user_indexes;
