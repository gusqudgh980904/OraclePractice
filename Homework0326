--.
--1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
--    이미지,입력일,배기량, 옵션을 조회
--   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
--     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
--     입력일은 월-일-년 의 형식으로 출력 할것.
select * from car_country;

select COUNTRY, MAKER, MODEL, trim(to_char(CAR_YEAR,'999,999,999')) car_year, trim(to_char(PRICE,'999,999,999')) price, CAR_IMG,
to_char(HIREDATE,'mm-dd-yyyy') hiredate, CC,CAR_OPTION,cc_rank

from (select COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE, cmo.CAR_IMG, cmo.HIREDATE, cmo.CC,
					row_number() over(order by cmo.cc desc) as cc_rank,CAR_OPTION
					from car_country cc,car_maker cma,car_model cmo
					where (cc.maker=cma.maker(+) and cma.model=cmo.model(+)) and cc between 1500 and 3000
					order by cc desc)
where cc_rank between 3 and 6;



--2. 부서번호가 10, 30,40번인 모든 부서의 사원번호,사원명,입사일,
--   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
--  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
--   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
--  하여 출력 ,입사일은 월-일-년 요일까지 출력
select empno_rank,EMPNO, ENAME, to_char(HIREDATE,'mm-dd-yyyy dy') hiredate, SAL
			,row_number() over(order by sal) sal_rank, DNAME, DEPTNO, LOC,substr(zipcode,instr(ZIPCODE,'-')) zipcode, SIDO, GUGUN, DONG, nvl(BUNJI,'번지없음') bunji

from  (select row_number() over(order by e.EMPNO) empno_rank,e.empno, e.ENAME, e.HIREDATE, e.SAL, d.DNAME, d.DEPTNO,
				d.LOC, z.ZIPCODE, z.SIDO, z.GUGUN, z.DONG, z.BUNJI
				from  dept d,emp e,zipcode z
				where (e.deptno(+)=d.deptno and z.SEQ=e.empno) and e.deptno in (10,30,40))

where  empno_rank between 2 and 5;




--3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
-- 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
--  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
--   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
--   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

select cc.COUNTRY, initcap(cc.MAKER) maker, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE,cmo. CAR_OPTION,
				substr(cmo.car_img,1,instr(cmo.car_img,'.')) as image,
				substr(cmo.car_img,instr(cmo.CAR_IMG,'.')) as FNE,cmo.CC

from  car_country cc,car_maker cma,car_model cmo

where (cma.maker(+)=cc.maker and cmo.model=cma.model) and (cc.maker in ('현대','기아','삼성','BMW','AUDI')) and
			 (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')

order by cmo.car_year desc,cmo.price desc;



--4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 번호, 모델명, 제조국,
--  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
--  단,번호는 1번부터 출력하고,
--   출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
--   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
--   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.
select row_number() over(order by model) num,'['||MODEL||'] 차량의 연식은 '||CAR_YEAR||'이고,
				제조국은 '||COUNTRY||'이며, '||MAKER||'사가 제조사입니다. 가격은 '
				||to_char(price,'0,000,000')||'원 입니다.',price_rank

from   (select cma.model,cc.country,cc.maker,cmo.price,cmo.car_year,row_number() over(order by price) price_rank
				from car_country cc,car_maker cma,car_model cmo
				where (cma.maker(+)=cc.maker and cmo.model(+)=cma.model) and cma.model in ('K5','아반테','소렌토','A8','SM3'))
where  price_rank between 2 and 7;




--5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회하세요.
select  cmo.CAR_YEAR, cma.MODEL,sum(cmo.price) total
from car_maker cma,car_model cmo
where (cmo.model=cma.model) and cma.maker in ('현대')
group by cube(cma.model,cmo.car_year);


--6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
--   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
--   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
--   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
--     연봉인상액은 부서번호에 따라 차등 인상
--     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
--     계산하여 3자리마다 ,를 넣어 출력.
--     모든 영어는 소문자로 출력.



select EMPNO, lower(ENAME) ename, HIREDATE, SAL,tax,trim(to_char(net_pay,'999,999')) net_pay,
				trim(to_char(sal_insang,'999,999')) sal_insang,DEPTNO, lower(DNAME) dname, lower(LOC) loc, ZIPCODE, SIDO, GUGUN, DONG, BUNJI

from (select e.EMPNO, e.ENAME, e.HIREDATE, e.SAL,sal*0.033 as tax,sal+(sal/12)+nvl(comm,0)-(sal*0.033) as net_pay,
			decode(d.deptno,
			10,sal*0.07,
			20,sal*0.04,
			30,(sal+nvl(comm,0))*0.1,
			sal*0.03) as sal_insang
			, d.DEPTNO, dNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
			from emp e,dept d,zipcode z
			where e.deptno=d.deptno and z.seq=e.deptno)

where ename like '%S' or ename like '__A__';




--7.  아래 제시된 Data Dictionary를 파악한 후,  Dictionary를 사용하여
--   emp 테이블에 컬럼명,데이터형, 크기, defalut값, 제약사항명을 조회하세요.
--    단, 크기는 숫자인 경우 22자가 아닌 실제 크기를 출력.
--    Dictionary :  user_tab_cols , user_cons_columns, user_constraints
select * from user_tab_cols where table_name='EMP';
select * from user_cons_columns where table_name='EMP';
select * from user_constraints where table_name='EMP';


select utc.column_name,utc.data_type,utc.data_length,utc.data_default,uc.r_constraint_name
					from user_tab_cols utc,user_constraints uc
					where (utc.table_name(+)=uc.table_name) and utc.table_name='EMP';




