-----1.���̺� ���� -----------------
create table HOMEWORK0317(
num number(5),
name varchar2(10),
class char(1),
email varchar2(50),
phonenumber varchar2(15),
adress varchar2(80),
gender varchar2(6),
javascore number(3),
Input_date date
);
---�ٽ��ϱ�---

--purge recyclebin; */
----2.���߰�-----

insert into HOMEWORK0317 values(1,'���μ�','A','kang@sist.co.kr','010-1234-5678','��⵵ ���ν�', '����',91,sysdate);
insert into HOMEWORK0317 values(2, '�ڱ��', 'A', 'park@daum.net','010-7739-9761','����� ������ ����1��', '����', 90, sysdate);
insert into HOMEWORK0317 values(3, '������','A', 'song@test.com','010-5878,8813','����� ���۱� �󵵵�', '����',97,sysdate);
insert into HOMEWORK0317 values(4, '���й�', 'B', 'lee@google.com','011-234-7611','�����  ���빮�� ���빮��', '����', 190, sysdate);
insert into HOMEWORK0317 values(5, '�ѻ��', 'B', 'hansang@sist.co.kr','010-4334-7656','��õ�� ���� ����3��', '����', 89, sysdate);

---3.����÷���ȸ-----
select * from HOMEWORK0317;

---4.Ư���÷���ȸ-----
select name,class,adress,javascore
from  HOMEWORK0317;

---5. 4�� �л��� ������ ���ڷ� ������ 90������ ���� A, ��ȭ��ȣ�� 010-2234-7611���� �������ּ���-----
update HOMEWORK0317
set gender='����',javascore=90,class='A',PHONENUMBER='010-2234-7611'
where num=4;

---6.�̸��� �ѻ���� �л��� ���� A��, ��ȭ��ȣ�� 010-1111-2341 �� �������ּ���.
 update HOMEWORK0317
set class='A',PHONENUMBER='010-1111-2341'
where name='�ѻ��';

---7.���� A���� �л��� ��λ����غ�����.
delete from HOMEWORK0317
where class='A';

---8.7������ ������ ���ڵ带 ��� ���������
insert into HOMEWORK0317 values(1,'���μ�','A','kang@sist.co.kr','010-1234-5678','��⵵ ���ν�', '����',91,sysdate);
insert into HOMEWORK0317 values(2, '�ڱ��', 'A', 'park@daum.net','010-7739-9761','����� ������ ����1��', '����', 90, sysdate);
insert into HOMEWORK0317 values(3, '������','A', 'song@test.com','010-5878,8813','����� ���۱� �󵵵�', '����',97,sysdate);
insert into HOMEWORK0317 values(4, '���й�', 'B', 'lee@google.com','011-234-7611','�����  ���빮�� ���빮��', '����', 190, sysdate);
insert into HOMEWORK0317 values(5, '�ѻ��', 'B', 'hansang@sist.co.kr','010-4334-7656','��õ�� ���� ����3��', '����', 89, sysdate);

---9.���̺��� ������ ������.
drop table HOMEWORK0317;

--10.�������� Ȯ���ϰ�, �����뿡 ������ ���̺��� �����غ�����.
flashback table HOMEWORK0317 to before drop;

--11.���̺��� ��� ���ڵ带 �����غ�����.
delete from HOMEWORK0317;

--12.���̺��� �����غ�����.
drop table HOMEWORK0317;

--13.�������� Ȯ���ϰ�, �������� ���������.
--show recyclebin;
purge recyclebin;
