-- group by: özellikle max, min,sum,count,avg (aggregate functions) fonksiyonlar ile birlikte kullanılır.
-- gruplama işlemi yapar.

-- mo_musteri tablosunda bakiyeye göre grupladırılan müşteri sayısını veren sorgu:
select count(*) as musteri_sayisi, bakiye  from mo_musteri group by bakiye; --as ile count(*)'un kolon adını musteri_sayisi olarak belirledik.

-- mo_musteri tablosunda sehir kolonuna göre gruplandırdığımız müşterilerin sayısını veren ve şehre göre alfabetik sıralayan sorgu :
select count(*) as musteri_sayisi, sehir from mo_musteri group by sehir order by sehir;

-- mo_musteri tablosunda; şehirlerdeki müşterilerin toplam bakiyesini veren sorgu:
select sum(bakiye), sehir from mo_musteri group by sehir;

-- mo_musteri tablosunda; her bir sehirdeki musterilerin ortalama bakiyesini veren sorgu:
select avg(bakiye), sehir from mo_musteri group by sehir;