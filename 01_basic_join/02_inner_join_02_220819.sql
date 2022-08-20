-- Q1. Antonio Moreno 고객이 1997년도에 주문한 정보 추출하기
-- 고객명 / 고객주소 / 주문ID / 주문일자 / 배송일자 / 배송주소
select a.contact_name, a.address, b.order_id, b.order_date, b.shipped_date, b.ship_address
from nw.customers a
	join nw.orders b on a.customer_id = b.customer_id
where a.contact_name = 'Antonio Moreno'
and b.order_date between to_date('19970101', 'yyyymmdd') and to_date('19971231', 'yyyymmdd');

-- Q2. Berlin에 거주하는 고객이 주문한 정보 추출하기
-- 고객명 / 고객ID / 주문ID / 주문일자 / 주문접수 직원명 / shipper 회사명
select a.contact_name, a.customer_id, b.order_id , b.order_date,
	c.last_name||' '||c.first_name as employee_name,
	d.company_name as shipper_company_name
from nw.customers a
	join nw.orders b on a.customer_id = b.customer_id
	join nw.employees c on b.employee_id = c.employee_id
	join nw.shippers d on b.ship_via = d.shipper_id
where a.city = 'Berlin';

-- Q3. Beverages 카테고리에 속하는 정보 추출하기
-- 카테고리명 / 상품ID / 상품명 / supplier 회사명
select a.category_name, b.product_id, b.product_name, c.company_name as supplier_company_name
from nw.categories a
	join nw.products b on a.category_id = b.category_id
	join nw.suppliers c on b.supplier_id = c.supplier_id
where a.category_name = 'Beverages';

-- Q4. Antonio Moreno 고객이 1997년에 주문한 정보(하단 참고) 추출하기
-- 고객명 / 고객주소 / 주문ID / 상품ID / 주문일자 / 배송일자 / 배송주소 / 상품명 / 상품금액 / 카테고리명 / supplier 회사명
select a.contact_name, a.address, b.order_id, c.product_id, b.order_date, b.shipped_date, b.ship_address,
	d.product_name, c.amount, e.category_name, f.company_name as supplier_company_name
from nw.customers a
	join nw.orders b on a.customer_id = b.customer_id
	join nw.order_items c on b.order_id = c.order_id
	join nw.products d on c.product_id = d.product_id
	join nw.categories e on d.category_id = e.category_id
	join nw.suppliers f on d.supplier_id = f.supplier_id
where a.contact_name = 'Antonio Moreno'
and b.order_date between to_date('19970101', 'yyyymmdd') and to_date('19971231', 'yyyymmdd');
