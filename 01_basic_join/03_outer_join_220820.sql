-- Q1. 주문정보가 없는 고객의 고객 / 주문정보 추출하기
select a.*, b.*
from nw.customers a
	left outer join nw.orders b on a.customer_id = b.customer_id
where b.order_id is null;

-- Q2. 부서정보 내 소속정보가 없는 직원ID / 직원명 left & right join으로 추출하기
-- 부서 정보는 반드시 표기
select a.*, b.empno, b.ename
from hr.dept a 
	left join hr.emp b on a.deptno = b.deptno
where b.ename is null;

select a.*, b.empno, b.ename
from hr.emp b
	right join hr.dept a on a.deptno = b.deptno
where b.ename is null;

-- Q3. Madrid에 거주하는 고객이 주문한 정보 추출하기
-- 고객명 / 거주지역 / 주문ID / 주문일자 / 주문접수 직원명 / shipper 회사명
-- 고객정보는 반드시 표기되어야 하며, 주문내역이 없을 시 주문I의 NULL 값은 0으로 변경하여 표기
select a.contact_name, a.city, coalesce(b.order_id, 0) as order_id, b.order_date, 
	c.last_name ||' '|| c.first_name as employee_name, d.company_name as shipper_name
from nw.customers a
	left join nw.orders b on a.customer_id = b.customer_id
	left join nw.employees c on b.employee_id = c.employee_id
	left join nw.shippers d on b.ship_via = d.shipper_id
where a.city = 'Madrid';

-- Q4. 주문정보가 없는 고객의 고객/주문정보 추출하기
select a.*, b.*
from nw.customers a
	left outer join nw.orders b on a.customer_id = b.customer_id
where b.order_id is null;

-- Q5. 부서정보 내 소속정보가 없는 직원ID / 직원명 left & right join으로 추출하기
-- 부서 정보는 반드시 표기
select a.*, b.empno, b.ename
from hr.dept a 
	left join hr.emp b on a.deptno = b.deptno
where b.ename is null;

select a.*, b.empno, b.ename
from hr.emp b
	right join hr.dept a on a.deptno = b.deptno
where b.ename is null;

-- Q6. Madrid에 거주하는 고객이 주문한 정보 추출하기
-- 고객명 / 거주지역 / 주문ID / 주문일자 / 주문접수 직원명 / shipper 회사명
-- 고객정보는 반드시 표기되어야 하며, 주문내역이 없을 시 주문I의 NULL 값은 0으로 변경하여 표기
select a.contact_name, a.city, coalesce(b.order_id, 0) as order_id, b.order_date, 
	c.last_name ||' '|| c.first_name as employee_name, d.company_name as shipper_name
from nw.customers a
	left join nw.orders b on a.customer_id = b.customer_id
	left join nw.employees c on b.employee_id = c.employee_id
	left join nw.shippers d on b.ship_via = d.shipper_id
where a.city = 'Madrid';
