-- ������ �Է� �޾� ������ ���� ����.
-- ������ 0 ���� �۴ٸ�'0���� �۾Ƽ� ����', ������ 100���� ũ�ٸ� '100���� Ŀ�� ����'
-- �׷��� ������ '�Է� ����'�� ����ϴ� ���α׷�. PL/SQL �ۼ�.
set serveroutput on
set verify off

accept score prompt '�����Է� : ';
accept birth prompt '�¾ �� �Է� :';

   -- �¾ �ظ� �Է� �޾�

declare

   score number := &score;

   -- �¾ �ظ� ������ ���� �����
   birth number := 0;
   flag number;
   zodiac varchar2(9);

begin

   dbms_output.put(score||'��');

   if score < 0 then
      dbms_output.put_line('�� 0 ���� �۾Ƽ� ����');
   elsif score > 100 then
     dbms_output.put_line('�� 100 ���� Ŀ�� ����');
   else
     dbms_output.put_line('�Է� ����');
   end if;

   -- �Է°��� 1890~2021�� ������ ��� ������ �Ҵ��ϰ�, �׷��� ������
   -- '�츦 ������� �ʴ� �⵵�Դϴ�.' �� �����ش�.
     if &birth between 1890 and 2021 then
        birth := &birth;

     else
        dbms_output.put_line('�츦 ������� �ʴ� �⵵�Դϴ�.');
     end if;

     if birth !=0 then
   -- ������ �Ҵ�� ��� �츦 ���Ͽ� ���
   -- ������-0, ��-1, ��-2, ����-3, ��-4, ��-5, ȣ����-6, �䳢-7, ��-8, ��-9, ��-10, ��-11
      flag := mod(birth, 12);

         if flag = 0 then
          zodiac := '������';
         elsif flag = 1 then
          zodiac := '��';
         elsif flag = 2 then
          zodiac := '��';
         elsif flag = 3 then
          zodiac := '����';
         elsif flag = 4 then
          zodiac := '��';
         elsif flag = 5 then
          zodiac := '��';
         elsif flag = 6 then
          zodiac := 'ȣ����';
         elsif flag = 7 then
          zodiac := '�䳢';
         elsif flag = 8 then
          zodiac := '��';
         elsif flag = 9 then
          zodiac := '��';
         elsif flag = 10 then
          zodiac := '��';
         else
          zodiac := '��';
          end if;

     dbms_output.put_line(birth||'�� ���'|| zodiac ||'��  �Դϴ�.');

   end if;

end;
/
