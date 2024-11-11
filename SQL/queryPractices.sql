--1. Product isimlerini (`ProductName`) ve birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.
select product_name, quantity_per_unit  from products p; --1

--2. Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz.
select product_id, product_name  from products p where discontinued = 0; --2

--3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.
select product_name, product_id  from products p where discontinued = 1; --3

--4. Ürünlerin maliyeti 20dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
select product_id, product_name, unit_price  from products p where unit_price <20; --4

--5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
select product_id, product_name, unit_price  from products p where unit_price>15 and unit_price<25; --5

--6. Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.
select product_name, units_in_stock,units_on_order  from products p
where units_in_stock < units_on_order; --6

--7. İsmi `a` ile başlayan ürünleri listeleyeniz.
select * from products p where product_name like 'A%' or product_name like 'a%'; --7

--8. İsmi `i` ile biten ürünleri listeleyeniz.
select  * from products p where product_name like '%i';--8

--9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
select product_name, unit_price, (p.unit_price  *1.18) as Unit_Price_KDV from products p; --9

--10. Fiyatı 30 dan büyük kaç ürün var?
select count(*)  from products p where unit_price >= 30; --10

--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
select lower(product_name)as product_name_lower from products p order by unit_price desc ; --11

--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
select first_name|| ' ' ||last_name as ad_soyad from employees e; --12

--13. Region alanı NULL olan kaç tedarikçim var?
select count(*) from suppliers s where region is null; --13

--14. a.Null olmayanlar?
select * from suppliers s where region is not null; --14

--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
select 'TR ' || upper(p.product_name) as product_name  from products p; --15

--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
select 'TR ' || upper(p.product_name) as product_name, p.unit_price  from products p where p.unit_price < 20; --16

--17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
select product_name, unit_price  from products p order by unit_price desc limit 1; --17

--18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
select product_name, unit_price  from products p order by unit_price desc limit 10; --18

--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
select product_name, unit_price from products where unit_price > (select avg(unit_price) from products); --19

--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
select sum(unit_price * units_in_stock) as revenue from products p; --20

--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
select count(*) from products p where discontinued = 1 and units_in_stock > 0; --21

--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
select product_name , category_name from products p left join categories c ON p.category_id = c.category_id; --22

--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
select c.category_name  , avg(unit_price) from products p left join categories c on p.category_id = c.category_id group by category_name; --23

--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
select product_name ,p.unit_price, category_name from products p 
left join categories c ON p.category_id = c.category_id 
order by p.unit_price desc limit 1 ; --24

--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
select p.product_name, c.category_name , s.contact_name, p.units_on_order  from products p 
left join categories c on p.category_id = c.category_id 
left join suppliers s on p.supplier_id = s.supplier_id
order by p.units_on_order desc limit 1; --25

--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın
select p.product_id, p.product_name , s.contact_name, s.company_name , s.phone from products p 
left join suppliers s on p.supplier_id = s.supplier_id
where p.units_in_stock = 0; --26

--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
select o.ship_address , e.first_name , e.last_name from orders o
left join employees e on o.employee_id = e.employee_id 
where date_part('year', o.order_date) = '1998' and date_part('month', o.order_date) = '3' ; --27

--28. 1997 yılı şubat ayında kaç siparişim var?
select count(*) from orders o where date_part('year', o.order_date) = '1997' and date_part('month', o.order_date) = '2'; --28

--29. London şehrinden 1998 yılında kaç siparişim var?
select count(*) from orders o where date_part('year', o.order_date) = '1998' and o.ship_city = 'London'; --29

--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
select c.contact_name , c.phone  from orders o 
left join customers c on o.customer_id = c.customer_id 
where date_part('year', o.order_date) = '1997'; --30

--31. Taşıma ücreti 40 üzeri olan siparişlerim
select * from orders o where o.freight > 40; --31

--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select c.contact_name , o.ship_city  from orders o
left join customers c on o.customer_id = c.customer_id 
where o.freight > 40; --32

--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf)
select o.order_date , o.ship_city , upper(e.first_name || ' ' || e.last_name) as employee from orders o 
left join employees e on o.employee_id = e.employee_id
where date_part('year', o.order_date) = '1997'; --33

--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select c.contact_name , TRANSLATE(c.Phone, '()- .', '') AS Phone from orders o 
left join customers c on o.customer_id = c.customer_id 
where date_part('year', o.order_date) = '1997'; --34

--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
select o.order_date , c.contact_name , e.first_name , e.last_name  from orders o 
left join customers c on o.customer_id = c.customer_id 
left join employees e on o.employee_id = e.employee_id; --35

--36. Geciken siparişlerim?
select * from orders o where o.required_date < o.shipped_date; --36

--37. Geciken siparişlerimin tarihi, müşterisinin adı
select o.order_date, c.contact_name  from orders o
left join customers c on o.customer_id = c.customer_id 
where o.required_date < o.shipped_date; --37

--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select p.product_name , category_name , od.quantity  from orders o
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
left join categories c on p.category_id = c.category_id
where o.order_id = 10248; --38

--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select p.product_name , s.contact_name  from orders o
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
left join suppliers s on p.supplier_id = s.supplier_id 
where o.order_id = 10248; --39

--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select p.product_name , od.quantity from orders o
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
where o.employee_id = 3 and date_part('year', o.order_date) = '1997'; --40

--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select e.employee_id , e.first_name , e.last_name, od.quantity, od.order_id  from orders o
left join order_details od on o.order_id = od.order_id 
left join employees e on o.employee_id = e.employee_id 
where date_part('year', o.order_date) = '1997'
order by od.quantity desc limit 1; --41

--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad
select e.employee_id , e.first_name , e.last_name, count(o.employee_id) as total from orders o
left join order_details od on o.order_id = od.order_id 
left join employees e on o.employee_id = e.employee_id 
where date_part('year', o.order_date) = '1997'
group by e.employee_id 
order by total desc limit 1; --42

--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select product_name ,p.unit_price, category_name from products p 
left join categories c ON p.category_id = c.category_id 
order by p.unit_price desc limit 1 ; --43

--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select e.first_name, e.last_name , o.order_date , o.order_id  from orders o 
left join employees e on o.employee_id = e.employee_id 
order by o.order_date; --44

--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select o.order_id, (sum(unit_price*quantity*(1-od.discount))/5) as total from orders o 
left join order_details od on o.order_id = od.order_id 
group by o.order_id 
order by o.order_id desc limit 5; --45

--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select p.product_name , c.category_name , sum(od.quantity) from orders o 
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
left join categories c on p.category_id = c.category_id 
where date_part('month', o.order_date) = '1'
group by p.product_name, c.category_name; --46

--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
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

--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select p.product_name, SUM(od.quantity) as total_quantity_sold, c.category_name , s.company_name 
from orders o 
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id
left join categories c on p.category_id = c.category_id 
left join suppliers s on p.supplier_id = s.supplier_id 
group by p.product_name, c.category_name, s.company_name  
order by total_quantity_sold desc limit 1; --48

--49. Kaç ülkeden müşterim var
select count(distinct c.country )from customers c; --49

--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(unit_price*quantity*(1-od.discount)) as total from orders o 
left join order_details od on o.order_id = od.order_id 
where date_part('month', o.order_date) = '1' and 
date_part('year', o.order_date) = 
(select MAX(date_part('year', o2.order_date)) from orders o2)
and o.employee_id = 3; --50

--63. Hangi ülkeden kaç müşterimiz var
select distinct c.country from customers c; --63

--65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
select sum(od.unit_price*od.quantity*(1-od.discount)) as total from orders o 
left join order_details od on o.order_id = od.order_id 
left join products p on od.product_id = p.product_id 
where od.product_id = 10 and o.order_date >= (select MAX(o2.order_date) from orders o2) - INTERVAL '3 months'; --64

--66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
select employee_id , count(o.order_id) from orders o group by employee_id; --66

--67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
select distinct c.customer_id , c.contact_name  from orders o 
right join customers c on c.customer_id = o.customer_id 
where o.customer_id is null; --67

--68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where country = 'Brazil'; --68

--69. Brezilya’da olmayan müşteriler
select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where country != 'Brazil'; --69

--70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where country in ('Spain', 'France', 'Germany'); --70

--71. Faks numarasını bilmediğim müşteriler
select * from customers c where c.fax is null; --71

--72. Londra’da ya da Paris’de bulunan müşterilerim
select c.company_name , c.contact_name , c.address , c.city , c.country  from customers c where city = 'London' or city = 'Paris'; --72

--73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
select * from customers c where city = 'México D.F.' and contact_title = 'Owner'; --73

--74. C ile başlayan ürünlerimin isimleri ve fiyatları
select p.product_name , p.unit_price  from products p where p.product_name like 'C%'; --74

--75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
select e.first_name , e.last_name , e.birth_date  from employees e where e.first_name like 'A%'; --75

--76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
select c.company_name from customers c where c.company_name like '%Restaurant%'; --76

--77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
select p.product_name , p.unit_price from products p where p.unit_price between 50 and 100; --77

--78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
select o.order_id , o.order_date from orders o where o.order_date between '1996-07-01' and '1996-12-31'; --78

--81. Müşterilerimi ülkeye göre sıralıyorum:
select * from customers c order by c.country; --81

--82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
select p.product_name , p.unit_price  from products p order by p.unit_price desc; --82

--83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
select p.product_name , p.unit_price , p.units_in_stock from products p order by p.unit_price desc, p.units_in_stock asc; --83

--84. 1 Numaralı kategoride kaç ürün vardır..?
select count(p.product_id) from products p 
left join categories c on p.category_id = c.category_id where c.category_id = 1; --84

--85. Kaç farklı ülkeye ihracat yapıyorum..?
select count(distinct ship_country) from orders o ; --85

--86. a.Bu ülkeler hangileri..?
select distinct ship_country from orders o ; --86

--87. En Pahalı 5 ürün
select * from products p order by p.unit_price desc limit 5; --87

--88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
select count(o.order_id) from orders o 
left join customers c on o.customer_id = c.customer_id 
where c.customer_id = 'ALFKI'; --88

--89. Ürünlerimin toplam maliyeti
select sum(p.unit_price*p.units_in_stock) as sum from products p; --89

--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
select sum(unit_price*quantity*(1-discount)) from order_details od; --90

--91. Ortalama Ürün Fiyatım
select avg(unit_price) from products p ; --91

--92. En Pahalı Ürünün Adı
select * from products p order by p.unit_price desc limit 1; --92

--93. En az kazandıran sipariş
select o.order_id , sum(unit_price*quantity*(1-discount)) as total from orders o 
left join order_details od on o.order_id = od.order_id 
group by o.order_id 
order by total asc limit 1 ; --93

--94. Müşterilerimin içinde en uzun isimli müşteri
select c.customer_id , c.contact_name, length(c.contact_name) as name_length from customers c order by name_length desc limit 1; --94

 --95. Çalışanlarımın Ad, Soyad ve Yaşları
select e.first_name , e.last_name ,  EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.birth_date)) AS age from employees e; --95

--96. Hangi üründen toplam kaç adet alınmış..?
SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;--96

--97. Hangi siparişte toplam ne kadar kazanmışım..?
select od.order_id, sum(unit_price*quantity*(1-discount)) from orders o 
left join order_details od on o.order_id = od.order_id 
group by od.order_id; --97

--98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
SELECT c.category_name, COUNT(p.product_id) AS total_products
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_products DESC; --98

--99. 1000 Adetten fazla satılan ürünler?
select od.product_id , sum(od.quantity) as total from orders o 
left join order_details od on o.order_id = od.order_id 
group by od.product_id
having sum(od.quantity) > 1000; --99

--100. Hangi Müşterilerim hiç sipariş vermemiş..? 
select c.customer_id, c.company_name from customers c 
left join orders o on c.customer_id = o.customer_id
where o.order_id is null 
