set serveroutput on
--주민번호를 입력받아 유효성을 출력하는 PL/SQL 작성
/*
1.주민번호는 14자리이어야 한다(14자리가 아니면 '자릿수를 확인'을 출력)
2.주민번호는 '880101-1234567' 형식으로 7번째 자리에 '-'가 있어야 한다
   (7번째 자리가 '-'이 아니면 '형식을 확인'을 출력)
1번과 2번조건에 부합되면 연산을 수행
3.주민 번호 구하기
	880101-1234567
	3-1.각자리에 2,3,4,5,6,7,8,9,2,3,4,5를 곱한 값을 더한다
	3-2.3-1에서 발생 값을 11로 나눈 나머지를 구한다
	3-3.11에서 3-2에서 발생한 값을 뺀다
	3-4.3-3에서 발생한 값을 10로 나눈 나머지를 구한다
	3-5.3-4에서 발생한 값이 주민번호의 가장 마지막자리와 같다면 '유효'
			그렇지 않으면 '무효'를 출력

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
dbms_output.put_line('자릿수를 확인');

elsif ssn not like '______-_______'  then
dbms_output.put_line('형식을 확인');

end if;

if ssn_eff=instr(ssn,14) then
dbms_output.put_line('유효');
else
dbms_output.put_line('무효');
end if;



end;
/
