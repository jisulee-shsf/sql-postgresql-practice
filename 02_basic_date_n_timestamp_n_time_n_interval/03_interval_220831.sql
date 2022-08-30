-- Q1-1. to_date 연산 가능 여부 확인
select to_date('2022-01-01', 'yyyy-mm-dd') + 2 as date_01; -- ret : 2022-01-03
select to_date('2022-01-01', 'yyyy-mm-dd') - 2 as date_02; -- ret : 2021-12-30
-- select to_date('2022-01-01', 'yyyy-mm-dd') * 2 as date_03; -- ret : Error
-- select to_date('2022-01-01', 'yyyy-mm-dd') % 2 as date_04; -- ret : Error

-- Q1-2. to_date에 interval을 사용할 경우, date에서 timestamp type 변환 확인
select pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') + 2) as date_01 -- type : date
	, to_date('2022-01-01', 'yyyy-mm-dd') 
	+ interval '2 days' as date_to_timestamp_01 -- ret : 2022-01-03 00:00:00.000
	, pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') 
	+ interval '2 days') as date_to_timestamp_02 -- type : timestamp
	, to_date('2022-01-01', 'yyyy-mm-dd') 
	- interval '2 days' as date_to_timestamp_03 -- ret : 2021-12-30 00:00:00.000
	, pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') 
	- interval '2 days') as date_to_timestamp_04; -- type : timestamp

-- Q2-1. to_timestamp 연산 불가능 확인
-- select to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') + 2 as timestamp_01; -- ret : Error
	
-- Q2-2. to_timestamp에 interval 사용 시, 연산 가능
select to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') 
	+ interval '2' as timestamp_02 -- ret : 2022-01-01 00:00:02.000 +0900
	, to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') 
	+ interval '+ 2' as timestamp_03 -- ret : 2022-01-01 00:00:02.000 +0900
	, to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') 
	+ interval '2 days' as timestamp_04 -- ret : 2022-01-03 00:00:00.000 +0900
	, to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') 
	+ interval '2' day as timestamp_05; -- ret : 2022-01-03 00:00:00.000 +0900
	
-- Q3-1. to_date - to_date = integer 연산 확인
select to_date('2022-01-01', 'yyyy-mm-dd') -- ret : -2
	- to_date('2022-01-03', 'yyyy-mm-dd') as interval_01
	, pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') -- ret : integer
	- to_date('2022-01-03', 'yyyy-mm-dd')) as interval_02;
	
select to_date('2022-01-03', 'yyyy-mm-dd') -- ret : 2
	- to_date('2022-01-01', 'yyyy-mm-dd') as interval_03
	, pg_typeof(to_date('2022-01-03', 'yyyy-mm-dd') -- ret : integer
	- to_date('2022-01-01', 'yyyy-mm-dd')) as interval_04;

-- Q3-2. to_timestamp - to_timestamp = interval 연산 확인
select to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') -- ret : -2 days
	- to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss') as interval_05
	, pg_typeof(to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') -- ret : interval
	- to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss')) as interval_06;
	
select to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss') -- ret : 2 days
	- to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') as interval_07
	, pg_typeof(to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss') -- ret : interval
	- to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss')) as interval_08;