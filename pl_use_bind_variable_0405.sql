--bind ���� ����
var age number;
var name varchar2(30);

--PL/SQL�ۼ�
declare


begin

--bind ������ �ܺο��� ������� ������ PL/SQL ���ο��� ������ ���� ���� �ʰ�
--:���������� ����� �� �ִ�.
:age:=26;
:name:='���й�';

end;
/

--bind ������ ���
print age;
print name;
