------------------------��ȯ�Լ�
--���� ��ȯ
---0�� �����Ͱ� ������ 0�� ä�� �����ش�
---9�� �����Ͱ� �ִ� �͸������ش�
select to_char(2021,'0,000,000'),'a'||to_char(2021.0319,'00,000,000.00'),to_char(2021,'9,999,999'),to_char(2021.0319,'99,999,999.99'),
			 to_char(202103,'9,999')
from dual;

--��¥��ȯ
--������ ��¥�����̰ų� Ư�����ڰ� �ƴ� ��쿡�� ""�� ����Ͽ� �ش� ���ڸ� ǥ��

select to_char(sysdate,'yyyy-mm-dd"��" day am hh24 hh hh12 hh24:mi:ss q"�б�"')
from dual;
--��¥������ ��� Error
select to_char(sysdate,'yyyy "�� " mm " �� " dd " �� " q "�б�" hh24 " �� " mi " �� "   ')
from dual;

--������̺��� �����ȣ,�����,�Ի��� ��ȸ
--��, �Ի����� '��-��-�� �б�'�� �������� ��ȸ�� ��
select   EMPNO, ENAME,to_char(HIREDATE,'mm-dd-yyyy q"�б�"') hiredate
from emp;

--������̺��� 1981�⿡ �Ի��� ������� �����ȣ,�����,����,�Ի��� ���� ��ȸ
select EMPNO, ENAME, SAL, HIREDATE, JOB
from emp
where to_char(hiredate,'yyyy')='1981';

--���ں�ȯ
select to_number('3')+to_number('19'),'3'+'19'
from dual;

--.��¥������ ���ڿ��� Date������ ��ȯ
select '2021-03-19',to_date('2021-03-19','yyyy-mm-dd')
from dual;

--Date���� �÷��� ���߰�
--���糯¥
insert into test1(input_date) values(sysdate);
--�ٸ���¥:��¥������ ���ڿ� ���
insert into test1(input_date) values('2021-03-20');
--�ٸ� ��¥:to_dat�Լ� ���
insert into test1(input_date) values(to_date('2021-03-21','yyyy-mm-dd'));

select to_char(input_date,'yyyy-mm-dd am hh24:mi:ss')from test1;

--to_date�� error�� �߻��ϴ� ���:to_char �Լ� ���
select		/* to_char('2021-03-19','mm-dd-yyyy')*/
				to_char(to_date('2021-03-19','yyyy-mm-dd'),'mm-dd-yy')
from dual;


-------------------�����Լ�
select decode('c','a','����','b','��','c','��','��Ʈ')
from dual;

--������̺��� �����ȣ,�Ŵ�����ȣ,�μ���ȣ,�μ��� ��ȸ
--��,�μ����� �μ���ȣ�� ���� �Ʒ��� ���� �����Ͽ� ��ȸ
--10- Si���� 20-SM�������� 30-SE�����Ͼ� �� �ܶ�� ����
select EMPNO, MGR, DEPTNO, decode(deptno,10,'SI-����',20,'SM-��������',30,'SE-�����Ͼ�','����')
from emp;

--������̺��� �����ȣ,�����,�μ���ȣ,����,�μ��� ���ʽ��� ��ȸ
--��,�μ��� ���ʽ��� �Ʒ��� ���� ����
--10���μ��� ������ 20%�� å��, 20���μ� ���� 25%�� å��
--30���μ��� ����+���ʽ��� �ջ��� �ݾ��� 15%�� å��
--�׿ܴ� ������ 100%�� å��
select EMPNO, ENAME, DEPTNO, SAL,trunc(decode(deptno,10,20,20,sal*0.25,30,(sal+nvl(comm,0))*0.15,sal*2),-1) bonus
from emp;
