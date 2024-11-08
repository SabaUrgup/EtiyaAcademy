select product_name, quantity_per_unit  from products p; --1

select product_id, product_name  from products p where discontinued = 0; --2

select product_name, product_id  from products p where discontinued = 1; --3

select product_id, product_name, unit_price  from products p where unit_price <20; --4

select product_id, product_name, unit_price  from products p where unit_price>15 and unit_price<25; --5

select product_name, units_in_stock,units_on_order  from products p
where units_in_stock < units_on_order; --6

select * from products p where product_name like 'A%' or product_name like 'a%'; --7

select  * from products p where product_name like '%i';--8

select product_name, unit_price, (p.unit_price  *1.18) as Unit_Price_KDV from products p; --9

select count(*)  from products p where unit_price >= 30; --10

select lower(product_name)as product_name_lower from products p order by unit_price desc ; --11

select first_name|| ' ' ||last_name as ad_soyad from employees e; --12

select count(*) from suppliers s where region is null; --13

select * from suppliers s where region is not null; --14

select 'TR ' || upper(p.product_name) as product_name  from products p; --15

select 'TR ' || upper(p.product_name) as product_name, p.unit_price  from products p where p.unit_price < 20; --16

select product_name, unit_price  from products p order by unit_price desc limit 1; --17

select product_name, unit_price  from products p order by unit_price desc limit 10; --18

select product_name, unit_price from products where unit_price > (select avg(unit_price) from products); --19

select sum(unit_price * units_in_stock) as revenue from products p; --20

select count(*) from products p where discontinued = 1 and units_in_stock > 0; --21

select product_name , category_name from products p left join categories c ON p.category_id = c.category_id; --22

select c.category_name  , avg(unit_price) from products p left join categories c on p.category_id = c.category_id group by category_name; --23

select product_name ,p.unit_price, category_name from products p 
left join categories c ON p.category_id = c.category_id 
order by p.unit_price desc limit 1 ; --24

select p.product_name, c.category_name , s.contact_name, p.units_on_order  from products p 
left join categories c on p.category_id = c.category_id 
left join suppliers s on p.supplier_id = s.supplier_id
order by p.units_on_order desc limit 1; --25

select p.product_id, p.product_name , s.contact_name, s.company_name , s.phone from products p 
left join suppliers s on p.supplier_id = s.supplier_id
where p.units_in_stock = 0; --26

select o.ship_address , e.first_name , e.last_name from orders o
left join employees e on o.employee_id = e.employee_id 
where date_part('year', o.order_date) = '1998' and date_part('month', o.order_date) = '3' ; --27

select count(*) from orders o where date_part('year', o.order_date) = '1997' and date_part('month', o.order_date) = '2'; --28

select count(*) from orders o where date_part('year', o.order_date) = '1998' and o.ship_city = 'London'; --29

select c.contact_name , c.phone  from orders o 
left join customers c on o.customer_id = c.customer_id 
where date_part('year', o.order_date) = '1997'; --30

select * from orders o where o.freight > 40; --31

select c.contact_name , o.ship_city  from orders o
left join customers c on o.customer_id = c.customer_id 
where o.freight > 40; --32

select o.order_date , o.ship_city , upper(e.first_name || ' ' || e.last_name) as employee from orders o 
left join employees e on o.employee_id = e.employee_id
where date_part('year', o.order_date) = '1997'; --33

select c.contact_name , TRANSLATE(c.Phone, '()- .', '') AS Phone from orders o 
left join customers c on o.customer_id = c.customer_id 
where date_part('year', o.order_date) = '1997'; --34

select o.order_date , c.contact_name , e.first_name , e.last_name  from orders o 
left join customers c on o.customer_id = c.customer_id 
left join employees e on o.employee_id = e.employee_id; --35

select * from orders o where o.required_date < o.shipped_date; --36

select o.order_date, c.contact_name  from orders o
left join customers c on o.customer_id = c.customer_id 
where o.required_date < o.shipped_date; --37

select p.product_name , category_name , od.quantity  from orders o
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
left join categories c on p.category_id = c.category_id
where o.order_id = 10248; --38

select p.product_name , s.contact_name  from orders o
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
left join suppliers s on p.supplier_id = s.supplier_id 
where o.order_id = 10248; --39

select p.product_name , od.quantity from orders o
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
where o.employee_id = 3 and date_part('year', o.order_date) = '1997'; --40

select e.employee_id , e.first_name , e.last_name, od.quantity, od.order_id  from orders o
left join order_details od on o.order_id = od.order_id 
left join employees e on o.employee_id = e.employee_id 
where date_part('year', o.order_date) = '1997'
order by od.quantity desc limit 1; --41

select e.employee_id , e.first_name , e.last_name, count(o.employee_id) as total from orders o
left join order_details od on o.order_id = od.order_id 
left join employees e on o.employee_id = e.employee_id 
where date_part('year', o.order_date) = '1997'
group by e.employee_id 
order by total desc limit 1; --42

select product_name ,p.unit_price, category_name from products p 
left join categories c ON p.category_id = c.category_id 
order by p.unit_price desc limit 1 ; --43

select e.first_name, e.last_name , o.order_date , o.order_id  from orders o 
left join employees e on o.employee_id = e.employee_id 
order by o.order_date; --44

select o.order_id, (sum(unit_price*quantity*(1-od.discount))/5) as total from orders o 
left join order_details od on o.order_id = od.order_id 
group by o.order_id 
order by o.order_id desc limit 5; --45

select p.product_name , c.category_name , sum(od.quantity) from orders o 
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
left join categories c on p.category_id = c.category_id 
where date_part('month', o.order_date) = '1'
group by p.product_name, c.category_name; --46

-----47 TODO

select o.order_id, sum(od.quantity) as total from orders o
left join order_details od on o.order_id = od.order_id
group by o.order_id
having sum(od.quantity) > avg(od.quantity); --47

select sum(od.quantity)/count(od.order_id) as total from order_details od; --satış miktarı/ kayıt sayısı
select avg(od.quantity) as total from order_details od;  --avg ile
select sum(od.quantity)/830 as total from order_details od;  --satış miktarı/ farklı order_id sayısı

select count(o.order_id) from orders o ; --orderstaki kayıt sayısı
select count(distinct od.order_id) from order_details od ; --order_detailsteki farklı order_id sayısı

SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(od.quantity) > (SELECT AVG(quantity) FROM order_details)
order by total_quantity_sold asc;

select p.product_name, SUM(od.quantity) as total_quantity_sold, c.category_name , s.company_name 
from orders o 
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id
left join categories c on p.category_id = c.category_id 
left join suppliers s on p.supplier_id = s.supplier_id 
group by p.product_name, c.category_name, s.company_name  
order by total_quantity_sold desc limit 1; --48

select count(distinct c.country )from customers c; --49

select sum(unit_price*quantity*(1-od.discount)) as total from orders o 
left join order_details od on o.order_id = od.order_id 
where date_part('month', o.order_date) = '1' and 
date_part('year', o.order_date) = 
(select MAX(date_part('year', o2.order_date)) from orders o2)
and o.employee_id = 3; --50

select distinct c.country from customers c; --63

select sum(od.unit_price*od.quantity*(1-od.discount)) as total from orders o 
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
where od.product_id = 10 and o.order_date >= (select MAX(o2.order_date) from orders o2) - INTERVAL '3 months'; --64

select employee_id , count(o.order_id) from orders o group by employee_id; --66

select distinct c.customer_id , c.contact_name  from orders o 
right join customers c on c.customer_id = o.customer_id 
where o.customer_id is null; --67

select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where country = 'Brazil'; --68

select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where country != 'Brazil'; --69

select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where country in ('Spain', 'France', 'Germany'); --70

select * from customers c where c.fax is null; --71

select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where city = 'London' or city = 'Paris'; --72

select * from customers c where city = 'México D.F.' and contact_title = 'Owner'; --73

select p.product_name , p.unit_price  from products p where p.product_name like 'C%'; --74

select e.first_name , e.last_name , e.birth_date  from employees e where e.first_name like 'A%'; --75

select c.company_name from customers c where c.company_name like '%Restaurant%'; --76

select p.product_name , p.unit_price from products p where p.unit_price between 50 and 100; --77

select o.order_id , o.order_date from orders o where o.order_date between '1996-07-01' and '1996-12-31'; --78

select * from customers c order by c.country; --81

select p.product_name , p.unit_price  from products p order by p.unit_price desc; --82

select p.product_name , p.unit_price , p.units_in_stock from products p order by p.unit_price desc, p.units_in_stock asc; --83

select count(p.product_id) from products p 
left join categories c on p.category_id = c.category_id where c.category_id = 1; --84

select count(distinct ship_country) from orders o ; --85

select distinct ship_country from orders o ; --86

select * from products p order by p.unit_price desc limit 5; --87

select count(o.order_id) from orders o 
left join customers c on o.customer_id = c.customer_id 
where c.customer_id = 'ALFKI'; --88

select sum(p.unit_price*p.units_in_stock) as sum from products p; --89

select sum(unit_price*quantity*(1-discount)) from order_details od; --90

select avg(unit_price) from products p ; --91

select * from products p order by p.unit_price desc limit 1; --92

select o.order_id , sum(unit_price*quantity*(1-discount)) as total from orders o 
left join order_details od on o.order_id = od.order_id 
group by o.order_id 
order by total asc limit 1 ; --93

select c.customer_id , c.contact_name, length(c.contact_name) as name_length from customers c order by name_length desc limit 1; --94

select e.first_name , e.last_name ,  EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.birth_date)) AS age from employees e; --95

SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;--96

select od.order_id, sum(unit_price*quantity*(1-discount)) from orders o 
left join order_details od on o.order_id = od.order_id 
group by od.order_id; --97

SELECT c.category_name, COUNT(p.product_id) AS total_products
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_products DESC; --98

select od.product_id , sum(od.quantity) as total from orders o 
left join order_details od on o.order_id = od.order_id 
group by od.product_id
having sum(od.quantity) > 1000; --99
