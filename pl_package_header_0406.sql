--��Ű�� header ����
--�Լ�:���̸� �Է¹޾Ƽ� �¾ �ظ� ��ȯ�ϴ� �Լ�
--���ν���: ��ȣ�� �Է¹޾�  ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ�Ͽ� sys_refcursor�� �����ϰ� ����ϴ� Procedure�� �ۼ��ϼ���.
--��, ��ȸ�� �Է����� ������������ ��ȸ�ϴ� �� ��ȣ�� 1���� �ԷµǸ� 1~10������ ���ڵ尡 ��ȸ�ǰ�
--2���� �ԷµǸ� 11~20 ������ ���ڵ尡 ��ȸ�ǰ�, 3�� �ԷµǸ� 21~30 ������ ���ڵ尡
--��ȸ�Ǿ�� �Ѵ�.

create or replace package test_pack
is

--���̸� �Է¹ޤ��� �¾ �ظ� ��ȯ�ϴ� �Լ�
function birth(age number)return number;

--���� ���ǵ� ���� �ϴ� Procedure
procedure car_list(num number,car_data out sys_refcursor);








end;
/
