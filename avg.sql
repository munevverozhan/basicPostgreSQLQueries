-- avg: bir kolona ait olan değerlerin ortalamasını veren bir method'dur.
 -- mo_musteri tablosundaki, bakiye değerlerinin ortalamasını veren sorgu:

SELECT AVG(BAKIYE)
FROM MO_MUSTERI;

-- mo_musteri tablosundaki, şehri Ankara olan müşterilerin bakiye değerlerinin ortalamasını veren sorgu:

SELECT AVG(BAKIYE)
FROM MO_MUSTERI
WHERE SEHIR = 'Ankara';