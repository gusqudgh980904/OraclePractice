--primary_column���̺��� �ڽ� ���̺� ����
--id�� ����Ͽ� �ΰ����� ������ �� ������ ��
--�ڽ����̺��� �÷���� ���������� ũ��� �޶� �ȴ�
drop table foreign_column;
create table foreign_column(
id varchar2(20) constraint fk_id references primary_column(id) on delete cascade--�ڽİ� �θ����̺��� ���ڵ带 ���û��� ����,
subject varchar2(30),
score number(3)
, ID);
select * from user_constraints
where constraint_type='R';

--�߰�����
--�θ����̺� �����ϴ� ������ ���ڵ尡 �߰��� ��
insert into foreign_column(id,subject,score)
values('hyun','�ڹ�',90);

insert into foreign_column(id,subject,score)
values('hyun','����Ŭ',95);

--null�Է� ���
insert into foreign_column(id,subject,score)
values('','�ڹ�',90);


select * from foreign_column;

--�߰�����
--�θ����̺� �������� �ʴ� ������ �߰��� ��
insert into foreign_column(id,subject,score)
values('hyun2','�ڹ�',90);

--���ڵ����
--�ڽ����̺��� ���ڵ�� �׳� �����ȴ�
--�θ����̺��� ���ڵ�� �ڽ����̺��� ���ڵ尡 �����ϴ� ��� �������� �ʴ´�

--hyun1 ���̵�� �����ϴ·��ڵ尡 �������� �����Ƿ� �ٷ� ����
delete from primary_column
where id='hyun1';



--hyun ���̵�� �����ϴ� ���ڵ尡 �����ϹǷ� �������� �ʴ´�
delete from primary_column
where id='hyun';
--�����ҷ��� �ڽķ��ڵ带 ��� ���� �� �θ����̺��� ���ڵ带 �����Ѵ�.
delete from foreign_column
where id='hyun';

delete from primary_column
where id='hyun';

select * from primary_column;
select * from foreign_column;


------------���̺�����������
--�ڽ����̺��� �÷���� ���������� ũ��� �޶� �ȴ�
create table foreign_table(
r_id varchar2(30),
subject varchar2(20),
score number(3),
constraint fk_r_id foreign key(r_id) references primary_table(id)
);




