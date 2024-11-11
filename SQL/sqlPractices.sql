--101. Hangi tedarikçi hangi ürünü sağlıyor ?
select p.product_name, s.company_name from products p
inner join suppliers s on s.supplier_id = p.supplier_id
group by p.product_name, s.company_name; 

--102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
select p.product_name,o.order_id , s.company_name, o.shipped_date  from orders o
inner join order_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
inner join shippers s on o.ship_via = s.shipper_id ; 

--103. Hangi siparişi hangi müşteri verir..?
select order_id, customer_id from orders o  where o.customer_id in (
select c.customer_id from customers c);

-- 104. Hangi çalışan, toplam kaç sipariş almış..?
select employee_id, (select count(order_id) from orders o 
where o.employee_id = e.employee_id )
from employees e ;

--105. En fazla siparişi kim almış..?
select employee_id, e.first_name, e.last_name , (select count(order_id) from orders o 
where o.employee_id = e.employee_id ) as totalOrder
from employees e 
order By totalOrder desc
limit 1;

--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
select order_id, customer_id, employee_id, 
(select first_name from employees e
where e.employee_id = o.employee_id) from orders o 
where o.customer_id in (
select c.customer_id from customers c);

--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
select product_id , product_name ,
( select category_name from categories c 
where c.category_id = p.category_id ),
( select company_name from suppliers s  
where s.supplier_id = p.supplier_id)
from products p;

-- 108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte,
--hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, hangi fiyattan alınmış, 
--ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış
select o.order_id, customer_id, employee_id, order_date, sum(od.quantity), product_name, od.unit_price, ct.category_name , s2.company_name as supplier_name ,
(select first_name from employees e where e.employee_id = o.employee_id),
(select company_name from shippers s where s.shipper_id = o.ship_via)
from orders o 
inner join order_details od on od.order_id = o.order_id 
inner join products p on p.product_id = od.product_id 
inner join categories ct on ct.category_id = p.category_id  
inner join suppliers s2 on s2.supplier_id = p.supplier_id 
where o.customer_id in ( select c.customer_id from customers c)
group by od.product_id , o.order_id , product_name, od.unit_price, ct.category_name, supplier_name ; 

--109. Altında ürün bulunmayan kategoriler
insert into categories(category_id, category_name, description) 
values(9, 'deneme', 'test') ;
select category_name from categories c 
where category_id not in(select category_id  from products p);

--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
select * from customers c where contact_title like '%Manager%';

--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
select * from customers c where customer_id like 'FR___';

--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
select * from customers c where phone like '(171)%' or phone like '171%';

--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
select * from products p where quantity_per_unit like '%boxes%';

--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
select contact_name, phone from customers c where contact_title like '%Manager%' and country in('France', 'Germany');

-- 115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
select * from products p order by unit_price desc limit 10;

-- 116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
select * from customers c order by country, city;

-- 117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
select first_name , last_name, date_part('year', age(CURRENT_DATE, birth_date)) AS yas from employees e;

-- 118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.
select * from orders o where (shipped_date - order_date > 35);

-- 119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
select max(p.unit_price) as maximum, p.category_id,
( select category_name from categories c 
where c.category_id = p.category_id )
from products p
group by category_id
order by maximum desc limit 1; 

-- 120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)
SELECT p.product_name,
( select category_name from categories c 
where c.category_id = p.category_id )
FROM products p
WHERE p.category_id IN (
    SELECT c.category_id
    FROM categories c
    WHERE c.category_name LIKE '%on%'
);

-- 121. Konbu adlı üründen kaç adet satılmıştır.
select sum(quantity) from order_details od 
join products p on p.product_id = od.product_id 
where p.product_name = 'Konbu';

-- 122. Japonyadan kaç farklı ürün tedarik edilmektedir.
select count(*) from products p 
join suppliers s on s.supplier_id = p.supplier_id 
where s.country = 'Japan';

-- 123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
select max(freight), min(freight), avg(freight) from orders o 
where date_part('year', order_date) = 1997 ;

-- 124. Faks numarası olan tüm müşterileri listeleyiniz.
select * from customers c where fax is not null;

-- 125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz. 
select * from orders o 
where shipped_date between '1996-07-16' and '1996-07-30';
