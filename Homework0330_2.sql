--���� 2.
--���̸� accept���� �Է¹޾� �¾ �ظ� ���ؼ� ����ϴ� PL/SQL�� �ۼ��ϼ���.

set serveroutput on

--��������
accept age prompt '����';


declare


begin

dbms_output.put_line(2021-&age+1);


end;
/
