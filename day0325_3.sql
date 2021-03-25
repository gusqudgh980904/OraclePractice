--��������

--��������
--oracle 12c���ʹ� ������ �տ� ##�� �پ����
--##�� ������� �ʴ� ������ �����ҷ��� _ORACLE_SCRIPT�� ����ϸ� �ȴ�
alter session set "_ORACLE_SCRIPT"=true;

create user hbh identified by 1234;

--������ ���������� Ȯ���ϴ� Data Dictionary
select * from dba_users;

--������ ������ ���� �ο�
--���ӱ���:connect,���̺������:resource,DBA����:dba
--���������:create view,�ó�� ��������:create synonym ,,,


--���Ѻο�: grant
--���ӱ���
grant connect to hbh;

--tablespace ������:table����, ��밡�� resource ���   Oracle 11g
grant resource to hbh;

--Ư�� tablespace�� ��뼳��  Oracle 12c~
alter user hbh default tablespace users quota unlimited on users;

--������ �ο��� ���� ��ȸ:dba_role_privs
select * from dba_role_privs
where grantee='HBH';

--����ȸ��
--������ ������ ���ӱ��� ȸ��
revoke connect from hbh;

--�������
alter user hbh account lock;--Ǯ�� unlock

--��������
drop user hbh cascade;

select * from dba_users;
