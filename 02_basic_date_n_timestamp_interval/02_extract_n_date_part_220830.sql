-- Q1. extract 함수로 year / month / day / hour / minute / second 정보 추출하기
select a.*
	, extract(year from hiredate) as extract_year
	, extract(month from hiredate) as extract_month
	, extract(day from hiredate) as extract_day
from hr.emp a;

select extract(hour from '2022-01-01 13:30:50'::timestamp) as extract_hour
	, extract(minute from '2022-01-01 13:30:50'::timestamp) as extract_minute
	, extract(second from '2022-01-01 13:30:50'::timestamp) as extract_second;

-- Q2. date_part 함수로 year / month / day / hour / minute / second 정보 추출하기
select a.*
	, date_part('year', hiredate) as datepart_year
	, date_part('month', hiredate) as datepart_month
	, date_part('day', hiredate) as datepart_day
from hr.emp a;

select date_part('hour', '2022-01-01 13:30:50'::timestamp) as datepart_hour
	, date_part('minute', '2022-01-01 13:30:50'::timestamp) as datepart_minute
	, date_part('second', '2022-01-01 13:30:50'::timestamp) as datepart_second;