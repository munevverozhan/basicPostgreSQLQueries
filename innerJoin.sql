-- join : birleştirme işlemleri için kullanılır.
-- 2 tabloda ortak olan alanları birleştirmek, bir tabloda olup diğerinde olmayan alanları birleştirmek, tablonun tamamını birleştirmek, ortak olmayan alanları birleştirmek
-- gibi birçok türü bulunan ve tablolar arasında birleştirme işlemi yapan bir yapıdır.
 -- inner join: 2 tablo arasındaki ortak alana göre yani kesişim kümesine göre birleştirme yapar.


-- mo_musteri tablosunda bulunan müşterilerin ; ad,soyad,sehir ve meslek bilgilerini, (mesleklerin adları yazacak şekilde) listeleyen sorgu:
SELECT MO_MUSTERI.AD,
	SOYAD,
	SEHIR,
	MO_MESLEK.AD
FROM MO_MUSTERI
INNER JOIN MO_MESLEK ON MO_MUSTERI.MESLEK = MO_MESLEK.ID; -- on ifadesi birleştirme şartını ifade eder.