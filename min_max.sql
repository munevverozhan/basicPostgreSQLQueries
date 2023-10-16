-- min: en küçük değeri bulur
-- max: en büyük değeri bulur
 -- mo_musteri tablosundaki min. bakiye değerini veren sorgu:

SELECT MIN(BAKIYE)
FROM MO_MUSTERI;

-- mo_musteri tablosundaki max. bakiye değerini veren sorgu:

SELECT MAX(BAKIYE)
FROM MO_MUSTERI;


SELECT MAX(BAKIYE) - MIN(BAKIYE)
FROM MO_MUSTERI;

-- mo_musteri tablosundaki şehri Ankara olan müşterinin ve min. bakiye değerini veren sorgu:

SELECT MIN(BAKIYE)
FROM MO_MUSTERI
WHERE SEHIR = 'Ankara';