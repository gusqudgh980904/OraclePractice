-----------���ڿ� �Լ�
--���ڿ� ����
select  length('test'),length('������ �ݿ���')
from dual;

--������̺��� ������� 4������ ����� �����,�����ȣ���Ի��� ��ȸ
select ename,empno,hiredate
from emp
where length(ename)=4;

--�빮��,�ҹ��� ��ȯ
select  upper('a'),upper('Abcd'),lower('ABCD'),LOWER('AbcD')
from dual;

--������̺��� ������� 'scott'�� ����� �����ȣ,�����,����,����,�Ի��� ��ȸ
select   EMPNO, ENAME, JOB, SAL, HIREDATE
from emp
where lower(ename)='scott';
--where ename=upper('scott');

--ù���ڸ� �빮�ڷ�
select initcap('java'),initcap('oracle')
from dual;

--ù���ڸ� �빮�ڷ�,���� ������ ù���ڵ� �빮�ڷ� �����
select initcap('java'),initcap('oracle'),initcap('i am a boy')
from dual;

--���ڿ� ���� Ư�� ���ڿ��� �ε��� ���
select instr('test','s'), instr('test','k')
from dual;

--������̺��� ����� 'A'�� �ִ� ����� �����,�����ȣ,������ ��ȸ
select ENAME, EMPNO, SAL
from emp
where instr(ename,'A')<>0;


--���ڿ� �ڸ���
--���۹��ڷ� ���� �ڸ� ������ �����ε����� 0�Ǵ� 1�� ����� �� �ִ�
select substr('abcdefg',4,1),substr('abcdefg',3),substr('abcdefg',0,3)
from dual;

--���ڿ� ��ġ��
select 'ABC'||'DEF'||'HIJ', concat(concat('ABC','DEF'),'HIJ')
from dual;

--��������
--�յ� ���� ����
select '['||trim('      A  BC             ')||']','['||ltrim('      A  BC             ')||']','['||rtrim('      A  BC             ')||']'
from dual;

select trim('a' from 'aaaaaaaaaaaaaaaaaaOracleaaaaaaaaaaaaa')
from dual;

--���ڿ� ġȯ
select replace('abcabcabc','bc','a')
from dual;

--������̺��� ������� ��ȸ
--��, �����'A'�� 'a'�� �����Ͽ� ��ȸ
select replace(ename,'A','a'),initcap(ename)
from emp;

--���� ������ ���ڿ� �����
--����ä���
select lpad('test',10,'$'),lpad('test',15,' ')
from dual;
--������ä���
select rpad('test',10,'$'),lpad('test',15,' ')
from dual;

--������̺��� �����ȣ,�����,�Ի����� ��ȸ
--��,�����ȣ SIST_000001111�� �������� ��ȸ
select  concat('SIST_',lpad(EMPNO,10,0)) format_empno, ENAME, HIREDATE
from emp;

