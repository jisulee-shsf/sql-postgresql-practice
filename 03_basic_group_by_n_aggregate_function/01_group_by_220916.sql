-- Q1. 부서별 최대 급여 / 최소 급여 / 평균 급여 정보 추출하기
select deptno, max(sal) as max_sal, min(sal) as min_sal, avg(sal) as avg_sal 
from hr.emp
group by deptno;

-- Q2. 부서별 최대 급여 / 최소 급여 / 평균 급여가 2000 이상인 정보 추출하기
select deptno, max(sal) as max_sal, min(sal) as min_sal, avg(sal) as avg_sal
from hr.emp
group by deptno
having avg(sal) >= 2000;

-- Q3. Q2 기준 정보를 with 절로 추출하기
with 
temp_01 as(
select deptno, max(sal) as max_sal, min(sal) as min_sal, avg(sal) as avg_sal
from hr.emp
group by deptno
)
select * from temp_01 where avg_sal >= 2000;

-- Q4. SALES & RESEARCH 직원의 부서번호 / 직원명 / 과거부터 현재까지 평균 급여 정보 내림차순 추출하기
select b.empno, max(b.ename) as ename, avg(c.sal) as avg_sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in ('SALES', 'RESEARCH')
group by b.empno
order by avg_sal DESC;

-- Q5. Q4 기준 정보를 with 절로 추출하기
with
temp_01 as(
select a.dname, b.empno, b.ename, c.fromdate, c.todate, c.sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in ('SALES', 'RESEARCH')
)
select empno, max(ename) as ename, avg(sal) as avg_sal
from temp_01
group by empno
order by avg_sal DESC;