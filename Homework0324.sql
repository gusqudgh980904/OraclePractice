--1.�Ʒ��� �����͸� �Է� �� �� �ִ� ���̺��� �����ϰ�, �����ϴٰ� �ǴܵǴ� �÷���
-- primary key, foreign key, unique��  �ο��ϼ���.
--  foreign key : dept���̺��� �����Ͽ� Ű�� ����
--
-- ���̺��� ��ȣ, ���̵�, �̸�, ����, �μ���ȣ, ��ȭ��ȣ, �����ȣ, �ּҸ�  ������ �� �ֽ��ϴ�.
create table Homework0324 (
num number(2),
id varchar(30),
name varchar(10),
age number(2),
deptno number(2) constraint fk_dept_deptno references dept(deptno) on delete cascade,
phone_num varchar2(13) constraint uk_phone_num unique,
zipcode char(7) constraint pk_zipcode primary key,
addres varchar2(60)
);

select * from Homework0324;
select * from zipcode;
select * from dept;


--2.���� ���̺��� ����Ͽ� ��������� �����ϴ� ������ ��������� �������� �ʴ�
--��� ������ ����� ������.
--�߰�����
--�����Է�
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','����ȣ',24,10,'010-1234-1234','123-123','��⵵ ����õ��');
--�����ȣ�� �ٸ� ��,�ڵ��� ��ȣ���ٸ� ��-PK,UK�� �ٸ�
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','����ȣ',24,10,'010-1234-1235','123-124','��⵵ ����õ��');
--deptno,phone_num�� null�� �Էµǰų� 20,30,40 �Է�
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(2,'hyun','����ȣ',24,20,'010-1234-1236','123-125','��⵵ ����õ��');
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(3,'hyun','����ȣ',24,'','','123-126','��⵵ ����õ��');


--�߰�����
--PK�� null�� �Էµ� ��-zipcode
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','����ȣ',24,10,'010-1234-1234','','��⵵ ����õ��');
--PK�� �÷����� �����Ǵ� ���
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM,ADDRES) values(1,'hyun','����ȣ',24,10,'010-1234-1234','123-123','��⵵ ����õ��');
--''�� �ԷµǴ°��
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','����ȣ',24,10,'010-1234-1234','','��⵵ ����õ��');
--�������� �ԷµǴ� ���
insert into Homework0324(NUM, ID, NAME, AGE, DEPTNO, PHONE_NUM, ZIPCODE, ADDRES) values(1,'hyun','����ȣ',24,10,'010-1234-1234','123-123','��⵵ ����õ��');

select * from Homework0324;
