-- ����1.
--emp���̺��� ����Ͽ� �Ʒ��� ���� ��ȸ �ϼ���.
--  xxx�� Xxxx����� �Ի����� yyyy-mm-dd ���� �� �Դϴ�. ������ xxx $�Դϴ�.
-- ��. �Ի������ ��,ȭ,�� �Ի��� ����� ���ؼ��� ��ȸ�մϴ�.
--     ������� ù���ڸ� �빮�ڷ� ��ȸ�ϰ�, �Ի����� �������� �����Ͽ� ����ϵ�
--     �Ի����� ���ٸ� ������ ������������ �����Ͽ� ����ϼ���.
--      ������ 3�ڸ����� ,�� �־����ϼ���.
select empno||'��'||initcap(ENAME)||'����� �Ի����� '||to_char(hiredate,'yyyy-mm-dd dy')||'�Դϴ�. ������'||to_char(sal,'999,999,999')||'$�Դϴ�'
from  emp
where to_char(hiredate, 'dy') in('��', 'ȭ', '��')
order by hiredate asc,sal desc;




-- 2. dept���̺��� '��'�� ���� ������ �ִ� �μ��� �μ���ȣ, �μ�������ȸ�ϼ���.
select DEPTNO, DNAME
from dept
where loc in('DALLAS');
 select * from dept;
--3. ��� ���̺��� ������ , �����, ������, ������ ��ȸ�ϼ���.
--  (������ ���������� ��ȸ�Ǿ���մϴ�.)
select job,count(empno),sum(sal)
from emp
group by cube(job);
--4.  ������̺��� 3,4�б⿡ �Ի��� �������  �μ��� ������,
--    �������, �ְ���, ��������, ������� ��ȸ�Ͽ� �μ��� ������������ �����Ͽ�
--    �Ʒ��� ���� ����ϼ���.
--    ��¿� )  xx���μ� ������� [x]��, ������� : [xx],
--	   �ְ��� [xx], ��������[xx]
select    deptno||'���μ� ������� ['||count(empno)||']��, ������� : ['||ceil(avg(sal))||'], �ְ��� : ['||
               max(sal)||'], ��������: ['||min(sal)||']' as output
from     emp
where    to_char(hiredate, 'q') in(3, 4)
group by  deptno
order by   deptno;
