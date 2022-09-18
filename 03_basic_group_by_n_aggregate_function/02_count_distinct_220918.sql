-- 00. 테스트 table 생성
drop table if exists hr.emp_test;

create table hr.emp_test
as
select * from hr.emp;

insert into hr.emp_test
select 8000, 'JISU', 'ANALYST', 7839, TO_DATE('19810101', 'YYYYMMDD'), 3000, 1000, 20;

select * from hr.emp_test;

-- Q1-1. deptno 기준, 집계 함수 출력하기
-- 집계 함수 사용 시, Null 값을 처리하지 않음을 확인
select deptno, count(*) as cnt, sum(comm), avg(comm), max(comm), min(comm)
from hr.emp_test
group by deptno;

select * from hr.emp_test where deptno = 20;
select * from hr.emp_test where deptno = 30;

-- Q1-2. mgr 기준, 집계 함수 출력하기
select mgr, count(*) as cnt, sum(comm)
from hr.emp_test
group by mgr;

-- Q2. max & min 함수를 활용해, 문자열 및 날짜 / 시간 타입 출력하기
-- sum & avg 함수의 경우, 숫자열 타입만 출력 가능 확인
select deptno, max(job), min(mgr), max(hiredate), min(hiredate)
from hr.emp_test
group by deptno;

-- Q3. count distinct 출력하기
-- 지정 컬럼의 중복을 제거한 고유 건 출력 확인
select count(job) from hr.emp_test; -- > output : 13(중복 제거 전)
select count(distinct job) from hr.emp_test; -- > output : 5(중복 제거 후)

select deptno, count(*) as cnt, count(distinct job) as distinct_cnt
from hr.emp_test
group by deptno;