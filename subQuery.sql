-- alt sorgu (sub query) :
 -- mo_musteri tablosunda bakiyesi en fazla olan müşterinin bütün bilgilerini veren sorgu:

SELECT *
FROM MO_MUSTERI
WHERE BAKIYE =
		(SELECT MAX(BAKIYE)
			FROM MO_MUSTERI) ;

-- mo_musteri tablosunda sehri Ankara olan müşteriler içerisindeki en yüksek bakiyeye sahip müşterinin tüm bilgilerini listeleyen sorgu:

SELECT *
FROM MO_MUSTERI
WHERE SEHIR = 'Ankara'
	AND BAKIYE =
		(SELECT MAX(BAKIYE)
			FROM MO_MUSTERI);

-- mo_musteri tablosunda mesleği öğretmen olan müşterilerin tüm bilgisini id değeri azalan olarak sıralanacak şekilde getiren sorgu:

SELECT *
FROM MO_MUSTERI
WHERE MESLEK =
		(SELECT ID
			FROM MO_MESLEK
			WHERE AD = 'öğretmen')
ORDER BY ID DESC;

-- mo_musteri tablosunda mühendislerin maaşına %10 zam yapan sorgu:

UPDATE MO_MUSTERI
SET BAKIYE = BAKIYE * 0.1 + BAKIYE
WHERE MESLEK =
		(SELECT ID
			FROM MO_MESLEK
			WHERE AD = 'mühendis');

-- mo_musteri tablosunda Ankaralı müşteriler içerisindeki öğretmenlerin listelendiği sorgu:

SELECT *
FROM MO_MUSTERI
WHERE SEHIR = 'Ankara'
	AND MESLEK =
		(SELECT ID
			FROM MO_MESLEK
			WHERE AD = 'öğretmen');