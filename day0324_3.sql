--unuque ���
--��ȣ,�̸�,��ȭ��ȣ�� ����


--�÷����� �������
create table unique_column(
num number,
name varchar2(30),
phone varchar2(13) constraint uk_phone unique
);

--�������Ȯ��
select * from user_constraints;
--������ �ε��� Ȯ��
select * from user_indexes;

--�߰�����
--�����Է�
insert into unique_column(num,name,phone)
values(1,'�׽�Ʈ','010-1234-1234');
--�ٸ� ��ȭ��ȣ�� �Է�
insert into unique_column(num,name,phone)
values(2,'�׽�Ʈ','010-1234-5678');
--��ȭ��ȣ�� null�� �Էµ� ���
insert into unique_column(num,name,phone)
values(3,'�׽�Ʈ','');


insert into unique_column(num,name)
values(4,'�׽�Ʈ');

--�����߻�
--���� ��ȭ��ȣ�� �ԷµǸ� error
insert into unique_column(num,name,phone)
values(5,'���ϴ�','010-1234-1234');

select * from unique_column;


--���̺���� �������
create table unique_table(
num number,
name varchar2(30),
email varchar2(50),
card_num char(4),
constraint uk_email unique(email),
constraint uk_card_num unique(card_num)
);

select * from user_constraints
where constraint_type='U';

select * from user_constraints
where table_name='UNIQUE_TABLE';
