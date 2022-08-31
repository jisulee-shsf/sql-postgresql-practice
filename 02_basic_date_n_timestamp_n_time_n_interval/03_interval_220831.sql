-- Q1-1. to_date 연산 가능 여부 확인
select to_date('2022-01-01', 'yyyy-mm-dd') + 2 as date_01; -- > output : 2022-01-03
select to_date('2022-01-01', 'yyyy-mm-dd') - 2 as date_02; -- > output : 2021-12-30
select to_date('2022-01-01', 'yyyy-mm-dd') * 2 as date_03; -- > output : Error
select to_date('2022-01-01', 'yyyy-mm-dd') % 2 as date_04; -- > output : Error

-- Q1-2. to_date에 interval을 사용할 경우, date에서 timestamp type 변환 확인
select pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') + 2) as date_01 -- > type : date
	, to_date('2022-01-01', 'yyyy-mm-dd') + interval '2 days' as date_to_timestamp_01 -- > output : 2022-01-03 00:00:00.000
	, pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') + interval '2 days') as date_to_timestamp_02 -- > type : timestamp
	, to_date('2022-01-01', 'yyyy-mm-dd') - interval '2 days' as date_to_timestamp_03 -- > output : 2021-12-30 00:00:00.000
	, pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') - interval '2 days') as date_to_timestamp_04; -- > type : timestamp
	
-- Q1-3. to_date - to_date 연산 시, integer type 변환 확인
select to_date('2022-01-01', 'yyyy-mm-dd') - to_date('2022-01-03', 'yyyy-mm-dd') as interval_01 -- > output : -2
	, pg_typeof(to_date('2022-01-01', 'yyyy-mm-dd') - to_date('2022-01-03', 'yyyy-mm-dd')) as interval_02; -- > type : integer
select to_date('2022-01-03', 'yyyy-mm-dd') - to_date('2022-01-01', 'yyyy-mm-dd') as interval_03 -- > output : 2
	, pg_typeof(to_date('2022-01-03', 'yyyy-mm-dd') - to_date('2022-01-01', 'yyyy-mm-dd')) as interval_04;  -- > type : integer

-- Q2-1. to_timestamp 연산 불가 확인
select to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') + 2 as timestamp_01; -- > output : Error
	
-- Q2-2. to_timestamp에 interval 사용 시, 연산 가능 확인
select to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') + interval '2' as timestamp_02 -- > output : 2022-01-01 00:00:02.000 +0900
	, to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') + interval '+ 2' as timestamp_03 -- > output : 2022-01-01 00:00:02.000 +0900
	, to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') + interval '2 days' as timestamp_04 -- > output : 2022-01-03 00:00:00.000 +0900
	, to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') + interval '2' day as timestamp_05; -- > output : 2022-01-03 00:00:00.000 +0900
	
-- Q2-3. to_timestamp - to_timestamp 연산 시, interval type 변환 확인
select to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') 
	- to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss') as interval_05  -- > output : -2 days
	, pg_typeof(to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') 
	- to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss')) as interval_06; -- > type : interval
select to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss') 
	- to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss') as interval_07  -- > output : 2 days
	, pg_typeof(to_timestamp('2022-01-03', 'yyyy-mm-dd hh24:mi:ss') 
	- to_timestamp('2022-01-01', 'yyyy-mm-dd hh24:mi:ss')) as interval_08; -- > type : interval
