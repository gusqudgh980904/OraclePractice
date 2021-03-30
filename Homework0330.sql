--숙제 1.
--하루 용돈, 교통비, 점심값을 변수에 저장하고 아래와 같은형식으로 출력하는 PL/SQL작성하세요.
--하루용돈 XX원, 편도교통비 : xx 원, 왕복교통비 : xx원, 점심값 : xx원 남은 용돈xx 원입니다.

set serveroutput on

declare
--변수선언
pocket_money number;
transforation_money number;
lanuch_pay number;
twice_tm number;
rest_money number;

begin
--값할당
pocket_money:=20000;
transforation_money:=3000;
lanuch_pay:=8000;
twice_tm:=transforation_money*2;
rest_money:=pocket_money-lanuch_pay-twice_tm;

dbms_output.put_line
('하루용돈:'||pocket_money||'원, 편도교통비:'||transforation_money||'원, 왕복교통비:'||twice_tm||'원, 점심값:'||lanuch_pay||'원 남은 용돈:'||rest_money);
end;
/
















