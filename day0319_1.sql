select '����ȣ' name,20 age
from dual;

------��ġ�Լ�
------���밪
select abs(-3),abs(3)
from dual;

------�ݿø� round(��,�ݿø� ���� �� �� �ڸ���)
--�Ű������� ���� ������ �Ҽ��� ù°�ڸ����� �ݿø��� ��,'.'�� 0
--���������� �ش� �ڸ����� �ݿø���
select round(555.555,2),round(555.554,2),round(555.554),round(555.554,-1),round(555.554,-2)
from dual;

--�ø� ceil(��)
select ceil(10.1),ceil(10.0)
from dual;

--���� floor(��)
select floor(10.1),floor(10.8)
from dual;

--���� trunc()
select trunc(555.555,2),trunc(555.555,-1),trunc(555.555)
from dual;


--������̺��� �����ȣ,�����,����,������ ��ȸ
--��,������ ������ 3.3% ����Ͽ� ������ �����Ͽ� ��ȸ�Ѵ�.
select EMPNO, ENAME, SAL,trunc(sal*0.033,-1) tax
from emp;


-------------null��ȯ
select nvl('','��'),nvl(null,'��ȯ��')
from dual;

--������̺��� �����ȣ,�����,����,���ʽ��� ��ȸ
--��, ���ʽ��� ���ٸ� 100���� ���
select  EMPNO, ENAME, SAL, nvl(COMM,100) comm
from emp;

--������̺��� �����ȣ,�����,����,���ʽ�,�Ѽ��ɾ�
--�Ѽ��ɾ���
select EMPNO, ENAME, SAL,comm,sal+nvl(comm,0) total
from emp;

--null�� �ƴ� �� ������ ���� null�� �� ������ ���� ����
select nvl2('','null�ƴ�','null��'),nvl2('a','null�ƴ�','null��')
from dual;

--��� ���̺��� �����ȣ,�����,�Ŵ��� ���翩�θ� ��ȸ
--�Ŵ����� �����ϸ� 0,�Ŵ����� �������� ������ 1�� ��ȸ
select empno,ename,nvl2(mgr,0,1)
from emp;

---insert �÷��� null�� �ԷµǴ� ��Ȳ
--number�� date�� �÷��� ������ ��쿡 null�� �Էµ�
alter table test1 add input_date date;

insert into test1(name) values('�׽�Ʈ');
select *from test1;
commit;

--varchar2�� char�� �÷��� ������ ���� ''�� �ԷµǴ� ��쿡 null�� �Է�
--�÷��� ������  ���
insert into test1(age,input_date) values (20,sysdate);
--''�Էµ� ���
insert into test1(name,age,input_date) values ('',30,sysdate);
select *from test1;

--test1���̺��� �̸� ���̸� ��ȸ
--��,�̸��� null�� ��� '����'���� ���̰� null�� ��� 0���� ���
select nvl(name,'����') name,nvl(age,0)
from test1;
