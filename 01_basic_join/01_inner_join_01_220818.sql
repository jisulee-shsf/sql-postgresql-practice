-- Q1. 직업이 SALESMAN인 직원 정보와 부서명 추출하기
select a.*, b.dname
from hr.emp a
    join hr.dept b on a.deptno = b.deptno
where job = 'SALESMAN';

-- Q2. SALES, RESEARCH 부서의 소속 직원들의 부서명 / 직원번호 / 직원명 / 직업 / 과거 급여 정보 추출하기
select a.dname, b.empno, b.ename, b.job, c.fromdate, c.todate, c.sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in ('SALES', 'RESEARCH')
order by a.dname, b.empno, c.fromdate;

-- Q3. 2번 추출 정보 중, 과거 급여 내 1983년 이후 데이터만 추출한 뒤 기준에 맞추어 정렬하기
select a.dname, b.empno, b.ename, b.job, c.fromdate, c.todate, c.sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in ('SALES', 'RESEARCH')
and c.fromdate >= to_date('19830101', 'yyyymmdd')
order by 1, 2, 3, c.fromdate;

-- Q4. SALES, RESEARCH 부서의 소속 직원별 과거부터 현재까지 평균 급여 추출하기
with temp_01 as(
select a.dname, b.empno, b.ename, b.job, c.fromdate, c.todate, c.sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in ('SALES', 'RESEARCH')
)
select empno, max(ename) as ename, avg(sal) as avg_sal
from temp_01
group by empno;

-- Q5. 직원인 SMITH의 과거 소속 부서 정보 추출하기
select a.ename, a.empno, b.deptno, c.dname, b.fromdate, b.todate
from hr.emp a
	join hr.emp_dept_hist b on a.empno = b.empno
	join hr.dept c on b.deptno = c.deptno
where a.ename = 'SMITH';