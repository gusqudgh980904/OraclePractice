--chek,nut null,default
--���̴� 20~30�븸 �Է�,�̸��� �ݵ�� �Է�,�Է����� �����Ǹ� ���ڵ尡 �߰��Ǵ� ������ ��¥ ������ �߰�
create table other_constraint(
num number(5),
name varchar2(30 byte) not null,
age number(2) check(age between 20 and 39),
input_date date default sysdate
);

--������� Ȯ��
select * from user_constraints
where table_name='OTHER_CONSTRAINT';

--default Ȯ��
select * from user_tab_cols
where table_name='OTHER_CONSTRAINT';

--�߰�����
--�̸��� �ԷµǸ鼭,���̰� 20~30��, �Է����� �����ǵ� �ȴ�
insert into OTHER_CONSTRAINT(num,name,age,input_date)
values(1,'�ڱ��',25,sysdate);

--�̸��� �ԷµǸ鼭,���̰�20~30��, �Է����� �����ǵ� �ȴ�-default
insert into OTHER_CONSTRAINT(num,name,age)
values(2,'���μ�',26);

--delete  from OTHER_CONSTRAINT;

--�߰�����
--check ���ǿ� ����
insert into OTHER_CONSTRAINT(num,name,age)
values(3,'������',19);

insert into OTHER_CONSTRAINT(num,name,age)
values(3,'������',40);

--not null ���ǿ� ����
insert into OTHER_CONSTRAINT(num,name,age)
values(3,'',40);

insert into OTHER_CONSTRAINT(num,age)
values(3,40);









select * from OTHER_CONSTRAINT;
