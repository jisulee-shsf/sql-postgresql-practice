-- Q1-1. 문자열을 formatting에 따라 date로 변환하기
select to_date('2022-01-01', 'yyyy-mm-dd');
select pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd')); -- > date type

-- Q1-2. 문자열을 formatting에 따라 timestamp로 변환하기
select to_timestamp('2022-01-01', 'yyyy-mm-dd');
select pg_typeof(to_timestamp('2022-01-01', 'yyyy-mm-dd')); -- > timestamp type

-- Q1-3. timestamp default formatting 설정하기
select to_timestamp('2022-01-01 14:15:30', 'yyyy-mm-dd hh24:mi:ss');
select pg_typeof(to_timestamp('2022-01-01 14:15:30', 'yyyy-mm-dd hh24:mi:ss')); -- > timestamp type

-- Q2-1. date를 timestamp로 형 변환하기
select to_date('2022-01-01', 'yyyy-mm-dd')::timestamp;
select pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd')::timestamp); -- > timestamp type

-- Q2-2. timestamp를 text로 형 변환하기
select to_timestamp('2022-01-01', 'yyyy-mm-dd')::text;
select pg_typeof(to_timestamp('2022-01-01', 'yyyy-mm-dd')::text); -- > text type

-- Q2-3. timestamp를 date로 형 변환하기
select to_timestamp('2022-01-01 14:15:30', 'yyyy-mm-dd hh24:mi:ss')::date;
select pg_typeof(to_timestamp('2022-01-01 14:15:30', 'yyyy-mm-dd hh24:mi:ss')::date); -- > date type

-- Q3. to_date / to_timestamp / to_char 실습
with
temp_01 as(
select a.*, to_char(hiredate, 'yyyy-mm-dd') as hiredate_str
from hr.emp a
)
select empno, ename, hiredate, hiredate_str
	, to_date(hiredate_str, 'yyyy-mm-dd') as hiredate_01
	, to_timestamp(hiredate_str, 'yyyy-mm-dd') as hiretimestamp_01
	, to_char(hiredate, 'yyyy-mm-dd hh24:mi:ss') as hirechar_01
	, to_char(hiredate, 'month dd yyyy') as hirechar_02
	, to_char(hiredate, 'MONTH dd yyyy') as hirechar_03
	, to_char(hiredate, 'MONTH w d') as hirechar_04 -- w : 주 > int / d : 요일 > sun(1)~sat(7)
	, to_char(hiredate, 'MONTH DAY') as hirechar_05 -- day : 요일 > str
from temp_01;
