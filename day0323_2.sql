----------select subquery
--�ܼ���
--emp ���̺��� �����ȣ�� '7369'�� ����� �ٹ��ϴ� �μ���ȣ�� ��ȸ�Ͽ�,
--cp_emp1 ���̺� ���� �μ������ ������ ��� ��ȸ
select * from emp;
select *from cp_emp1;

select empno ,ename,deptno,job,sal
from cp_emp1
where deptno=(select deptno from emp where empno=7369);

--�𵨸��� '�׷���'�� ������ ������ ��ȸ
select *from car_MAKER;
select country
from car_country
WHERE maker=(select maker from car_maker where model='�ƹ���');
--�����簡 '����'�� ������ �𵨸�,���� ����,�ɼ��� ��ȸ
select model,car_year,price
from car_model
where model in(select model from car_maker where maker='����');


--------------scalar subquery
--��ȸ�� ���� ����Ͽ� �ٸ� �÷��� ���� ������ ��
--�����ȣ,�����,�μ���ȣ,�μ��� ��ȸ
select empno,ename,deptno,(select dname from dept where dept.deptno=emp.deptno) dname
from emp;

--car_model,car_maker ���
--�����2012�� �𵨸�,���,����,�ɼ�,�Է��� �̹���,�����縦 ��ȸ
select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, CAR_IMG,
(select  MAKER from car_maker where car_maker.model=car_model.model) maker
from car_model
where car_year='2012';


--select ������ subquery (�˻��� ����� ������ ����ȸ : inline view�� ����� ��ȸ)
select empno,ename,job,sal,hi   --inline view�� �����ϴ� �÷��� ���ڵ带 �˻�
--alias�� ���� �÷���ó�� ���
from (select EMPNO, ENAME, SAL, JOB, HIREDATE hi from emp where job='CLERK')
where to_char(hi,'yyyy')=1980;


----rownum
--������̺��� �Ի�⵵�� '1981'�⵵�� ������� ������ȣ,�����ȣ,�����,�Ի����� ��ȸ
--��ȸ����� �����ȣ�� ���
select rownum EMPNO, ENAME, HIREDATE
from emp
where to_char(hiredate,'yyyy')='1981';

--rownum�� order by���� ���� �����ǹǷ� �����ϸ� ��ȣ�� ���δ�-
--������̺��� ������ȣ,�����ȣ,�����,������ ��ȸ
--��,������� ������������ �����Ͽ� ��ȸ
select rownum, EMPNO, ENAME, JOB
from emp
order by ename;

--1�����ʹ� ��ȸ���ǳ� ���� ��ȣ ���ʹ� ��ȸ���� �ʴ´�
--������̺��� ��ȣ,�����ȣ,������� ��ȸ
--��, ��ȣ�� 1��~5�������� ���ڵ常 ���
select rownum, EMPNO, ENAME
from emp
where rownum between 1 and 5;
--where rownum>=1 and rownum<6;

--select ���� ���� �̸����� ���� ���ȴ�
select rownum,rn,ename,empno
from (select rownum rn,ename,empno from emp order by ename);

--������̺��� ���� �������� �Ի��� ����������� 5���� ��������� ��ȸ
--(2~6���� ��ȸ)
--���� �������� �Ի��� ������� 1���� �ο�
--���� ���� ���ڵ忡�� Ư�� �κи� �����Ͽ� ��ȸ
select rn, EMPNO, ENAME, JOB, HIREDATE
from  (select rownum rn,empno,ename,job,hiredate
from  (select empno,ename,job,hiredate
			from   emp
			order by hiredate desc,empno))
where rn between 2 and 6;

select empno,ename,job,hiredate,rnum
from(select empno,ename,job,hiredate,
			row_number() over(order by hiredate desc) rnum
from emp)
where rnum between 2 and 6;

--�����ȣ���̺��� �õ��� '����'�� ���ڵ带 dong�� ������������
--�������� �� 150��~100�� ������ ���ڵ带 ��ȸ
--��,������ ������ '��������'���� ���
--��ȸ�÷�:�����ȣ,�õ�,����,��,����
select * from zipcode;
select ZIPCODE, SIDO, GUGUN,nvl(BUNJI,'��������') BUNJI,dong_num
from (select ZIPCODE, SIDO, GUGUN,BUNJI,
				row_number() over(order by dong desc) dong_num
				from zipcode
				where sido='����' )
where dong_num between 150 and 200  ;


select *
from user_tab_cols;
