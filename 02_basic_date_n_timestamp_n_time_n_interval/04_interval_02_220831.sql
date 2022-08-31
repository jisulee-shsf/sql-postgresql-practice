-- Q. 날짜 및 시간 연산에 사용되는 interval 실습
with
temp_01 as(
select empno, ename, hiredate
	, current_date -- > output : 2022-08-31
	, current_timestamp -- > output : 2022-08-31 11:54:15.957 +0900
	, current_time -- > output : 11:54:15 +0900
	, date_trunc('second', now()) as now_trunc -- > output : 2022-08-31 11:54:15.000 +0900
	, now() -- > output : 2022-08-31 11:54:15.957 +0900
	, now() - hiredate as 근속기간 -- > output : 15232 days 11:54:15.957409
from hr.emp
)
select empno, ename, hiredate, 근속기간
	, date_part('year', 근속기간) -- > output : 0 
	, justify_interval(근속기간) -- > output : 42 years 3 mons 22 days 11:54:15.957409 / 1달 30일 기준 연산
	, date_part('year', justify_interval(근속기간))||'년 '||date_part('month', justify_interval(근속기간))||'월' as 근속년월 -- > output : 42년 3월
	, age(hiredate) -- > output : 41 years 8 mons 14 days / 실제  기준 연산
	, date_part('year', age(hiredate))||'년 '||date_part('month', age(hiredate))||'월' as 근속년월 -- > output : 41년 8월
from temp_01;
