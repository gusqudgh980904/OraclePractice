--�̸�,�¾ �ظ� �Է¹޾�,print output�� �ϸ� 'ȫ�浿�� �¾�� 2021��
--��� xx��'�� ����ϴ� PL/SQL�ۼ�
create or replace procedure proc_zodiac(name in varchar2,birth in number,msg out varchar2)
is

type zodiac_tab is table of varchar2(9) index by binary_integer;
zodiac_text zodiac_tab;

begin
zodiac_text(0):='������';
zodiac_text(1):='��';
zodiac_text(2):='��';
zodiac_text(3):='����';
zodiac_text(4):='��';
zodiac_text(5):='��';
zodiac_text(6):='ȣ����';
zodiac_text(7):='�䳢';
zodiac_text(8):='��';
zodiac_text(9):='��';
zodiac_text(10):='��';
zodiac_text(11):='��';

msg:=name||'�� �¾ ��'||birth||'�� ��� '||zodiac_text( mod(birth,12) );

end;
/

