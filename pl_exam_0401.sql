set serveroutput on
--�ֹι�ȣ�� �Է¹޾� ��ȿ���� ����ϴ� PL/SQL �ۼ�
/*
1.�ֹι�ȣ�� 14�ڸ��̾�� �Ѵ�(14�ڸ��� �ƴϸ� '�ڸ����� Ȯ��'�� ���)
2.�ֹι�ȣ�� '880101-1234567' �������� 7��° �ڸ��� '-'�� �־�� �Ѵ�
   (7��° �ڸ��� '-'�� �ƴϸ� '������ Ȯ��'�� ���)
1���� 2�����ǿ� ���յǸ� ������ ����
3.�ֹ� ��ȣ ���ϱ�
	880101-1234567
	3-1.���ڸ��� 2,3,4,5,6,7,8,9,2,3,4,5�� ���� ���� ���Ѵ�
	3-2.3-1���� �߻� ���� 11�� ���� �������� ���Ѵ�
	3-3.11���� 3-2���� �߻��� ���� ����
	3-4.3-3���� �߻��� ���� 10�� ���� �������� ���Ѵ�
	3-5.3-4���� �߻��� ���� �ֹι�ȣ�� ���� �������ڸ��� ���ٸ� '��ȿ'
			�׷��� ������ '��ȿ'�� ���

*/



declare

ssn char(14):='980904-115162';
ssn_eff number:=0;
ssn_eff1 number:=0;


begin

ssn_eff:=11-mod((instr(ssn,1)*2)+(instr(ssn,2)*3)+(instr(ssn,3)*4)+(instr(ssn,4)*5)+(instr(ssn,5)*6)+(instr(ssn,6)*7)+(instr(ssn,8)*8)+
(instr(ssn,9)*9)+(instr(ssn,10)*2)+(instr(ssn,11)*3)+(instr(ssn,12)*4)+(instr(ssn,13)*5),11);

ssn_eff1:=mod(ssn_eff,10);

if length(ssn)<>14  then
dbms_output.put_line('�ڸ����� Ȯ��');

elsif ssn not like '______-_______'  then
dbms_output.put_line('������ Ȯ��');

end if;

if ssn_eff=instr(ssn,14) then
dbms_output.put_line('��ȿ');
else
dbms_output.put_line('��ȿ');
end if;



end;
/
