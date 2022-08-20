-- Q1. non equi join으로 직원급여에 따른 급여등급 정보 추출하기
select a.*, b.losal, b.hisal, b.grade as salgrade
from hr.emp a
	join hr.salgrade b on a.sal between b.losal and b.hisal;

-- Q2. 직원의 급여이력과 해당 급여를 가졌던 시점의 부서번호 함께 추출하기
select a.*, b.*
from hr.emp_salary_hist a
	join hr.emp_dept_hist b on a.empno = b.empno
and a.fromdate between b.fromdate and b.todate;

select a.*, b.*
from hr.emp_salary_hist a
	join hr.emp_dept_hist b on a.empno = b.empno
where a.fromdate between b.fromdate and b.todate;

-- Q3. cross join으로 정보 추출하기
with temp_01 as(
select 1 as rnum
union all
select 2 as rnum
)
select a.*, b.*
from hr.dept a
	cross join temp_01 b;
