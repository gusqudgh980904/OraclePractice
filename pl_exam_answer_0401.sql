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
	3-4.3-3에서 발생한 값을 11로 나눈 나머지를 구한다
	3-5.3-4에서 발생한 값이 주민번호의 가장 마지막자리와 같다면 '유효'
			그렇지 않으면 '무효'를 출력

*/
declare
 ssn char(14):='000626-3151616';
 ssn_flag number:=2;
 ssn_ope number :=0;

begin

if length(ssn)=14 then

 if instr(ssn,'-')=7 then
  --14자리이면서 7번째 자리에 '-'이 존재
  	--1~13자리까지 주민번호를 하나씩 잘라내서 check code와 연산하기 위한 반복문
  for i in 1 .. length(ssn)-1 loop
  --7번째 자리는 -이기 때문에 연산하지 않는다.
  if i<>7 then
  --주민번호의 각 자리를 한자씩 잘라서 checksum코드와 곱한 후 결과를 더해 변수에 저장한다
     ssn_ope:=ssn_ope+substr(ssn,i,1)*ssn_flag;
--    dbms_output.put_line(substr(ssn,i,1)||'/'||ssn_flag);

--checksum 코드를 1씩 증가시킨다
      ssn_flag:=ssn_flag+1;
--checksum 코드가 9까지만 가고 다시 2부터 시작
      if ssn_flag=10 then
       ssn_flag:=2;
       end if;

    end if;

  end loop;

  ssn_ope:=mod(11-mod(ssn_ope,11),10);

  if substr(ssn,14,1) = ssn_ope  then
   dbms_output.put_line('유효');
  else
   dbms_output.put_line('무효');
  end if;

	else
	 dbms_output.put_line('-이 지정된 자리에 없습니다');
	 end if;

 else
 dbms_output.put_line('자릿수를 확인');
	 end if;





end;
/
