--���� 3.
-- ������̺��� �ټӳ���� 35�� �̻��� ��� ���� �����ȣ,�����, �Ի���, �ټӳ��, ������ ��ȸ�ϼ���.
-- ��, �Ի����� ������������ �����Ͽ� ����ϰ�, �Ի����� ����-��-�� ���ϡ� �� �������� ����ϼ���.
select EMPNO, ENAME,(to_char(HIREDATE,'mm-dd-yyyy-day')) as hiredate,
			trunc(months_between(sysdate,hiredate)/12,0) as service_life, SAL

from     emp
where  trunc(months_between(sysdate,hiredate)/12,0)>=35
order by hiredate desc;
