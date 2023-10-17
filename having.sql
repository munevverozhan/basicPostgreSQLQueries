-- having: group by ile gruplanan sorgulara şart eklenmesi için kullanılan komuttur.
 
-- mo_musteri tablosunda her bir şehirdeki müşteri sayısı 2 den fazla olanların listelendiği sorgu:

SELECT COUNT(*) AS MUSTERI_SAYISI,
	SEHIR
FROM MO_MUSTERI
GROUP BY SEHIR
HAVING COUNT(*) > 2 ;

-- mo_musteri tablosunda müşterilerin ortalama bakiyesi 5000'den büyük ve sehir değeri içerisinde s harfi geçen müşterilerin sehir ve ortalama değerlerini veren sorgu. 
 
SELECT AVG(BAKIYE) AS ORTALAMA, 
	SEHIR
FROM MO_MUSTERI
GROUP BY SEHIR
HAVING AVG(BAKIYE) > 5000
AND SEHIR like '%s%';