--procedure ����: �� ���� �Է¹޾� ���ϱ� �������� out parameter�� �Ҵ��ϴ� ��
create or replace procedure proc_plus(num1  number,num2 in number,result out number,msg out varchar2)
is

begin

--out parameter�� procedure �ȿ��� ó���� ����� procedure�ܺη� �������� ����
--�����ϴ� ������ ȣ���� �� bind ������ �Ҵ��ϰ�,procedure�ȿ�����
--PL/SQL�� �ٸ��� :���� ���
result:=num1+num2;


msg:='������ �������Դϴ�.';
end;
/

/*
������:@���ϸ�.sql
����Ȯ��:show error

���ε庯�� ����
var result number
var msg varchar2(100)


����:
exec[execute] ���ν�����(��,,,)[;]

��)exec proc_plus(1,2,:result,:msg);

���
print result;
print msg;

*/
