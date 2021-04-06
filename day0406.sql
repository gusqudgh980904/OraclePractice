--숫자로된 난수
select dbms_random.value(1,10)
from dual;

--여러가지 문자가 혼합된 난수
select dbms_random.string('u',1),dbms_random.string('l',5),dbms_random.string('a',6)
from dual;
