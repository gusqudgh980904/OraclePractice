--���� 1.
--�Ϸ� �뵷, �����, ���ɰ��� ������ �����ϰ� �Ʒ��� ������������ ����ϴ� PL/SQL�ۼ��ϼ���.
--�Ϸ�뵷 XX��, ������� : xx ��, �պ������ : xx��, ���ɰ� : xx�� ���� �뵷xx ���Դϴ�.

set serveroutput on

declare
--��������
pocket_money number;
transforation_money number;
lanuch_pay number;
twice_tm number;
rest_money number;

begin
--���Ҵ�
pocket_money:=20000;
transforation_money:=3000;
lanuch_pay:=8000;
twice_tm:=transforation_money*2;
rest_money:=pocket_money-lanuch_pay-twice_tm;

dbms_output.put_line
('�Ϸ�뵷:'||pocket_money||'��, �������:'||transforation_money||'��, �պ������:'||twice_tm||'��, ���ɰ�:'||lanuch_pay||'�� ���� �뵷:'||rest_money);
end;
/
















