-- count : sayma için kullanılır. Bir tabloda kaç adet veri olduğunu söyler.
-- bir method'dur ve parantez içinde alması gereken bir parametre vardır.

-- mo_musteri tablosundaki toplam müşteri sayısını veren sorgu:

SELECT COUNT(*)
FROM MO_MUSTERI;

-- mo_musteri tablosundaki; şehri Ankara olan müşterilerin sayısını veren sorgu:

SELECT COUNT(*)
FROM MO_MUSTERI
WHERE SEHIR = 'Ankara';

-- mo_musteri tablosundaki; şehri Ankara olan ve bakiyesi 5000'den büyük olan müşterilerin sayısını veren sorgu:

SELECT COUNT(*)
FROM MO_MUSTERI 
WHERE SEHIR = 'Ankara'
	AND BAKIYE > 5000;