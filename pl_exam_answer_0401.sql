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
	3-4.3-3���� �߻��� ���� 11�� ���� �������� ���Ѵ�
	3-5.3-4���� �߻��� ���� �ֹι�ȣ�� ���� �������ڸ��� ���ٸ� '��ȿ'
			�׷��� ������ '��ȿ'�� ���

*/
declare
 ssn char(14):='000626-3151616';
 ssn_flag number:=2;
 ssn_ope number :=0;

begin

if length(ssn)=14 then

 if instr(ssn,'-')=7 then
  --14�ڸ��̸鼭 7��° �ڸ��� '-'�� ����
  	--1~13�ڸ����� �ֹι�ȣ�� �ϳ��� �߶󳻼� check code�� �����ϱ� ���� �ݺ���
  for i in 1 .. length(ssn)-1 loop
  --7��° �ڸ��� -�̱� ������ �������� �ʴ´�.
  if i<>7 then
  --�ֹι�ȣ�� �� �ڸ��� ���ھ� �߶� checksum�ڵ�� ���� �� ����� ���� ������ �����Ѵ�
     ssn_ope:=ssn_ope+substr(ssn,i,1)*ssn_flag;
--    dbms_output.put_line(substr(ssn,i,1)||'/'||ssn_flag);

--checksum �ڵ带 1�� ������Ų��
      ssn_flag:=ssn_flag+1;
--checksum �ڵ尡 9������ ���� �ٽ� 2���� ����
      if ssn_flag=10 then
       ssn_flag:=2;
       end if;

    end if;

  end loop;

  ssn_ope:=mod(11-mod(ssn_ope,11),10);

  if substr(ssn,14,1) = ssn_ope  then
   dbms_output.put_line('��ȿ');
  else
   dbms_output.put_line('��ȿ');
  end if;

	else
	 dbms_output.put_line('-�� ������ �ڸ��� �����ϴ�');
	 end if;

 else
 dbms_output.put_line('�ڸ����� Ȯ��');
	 end if;





end;
/
