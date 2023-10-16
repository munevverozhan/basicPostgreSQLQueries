-- sum: belirli bir kolon veya kolonların tamamındaki, aritmetik değerlerin toplanması için kullanılan bir method'dur.
 
-- mo_musteri tablosundaki bakiye değerlerinin toplamını veren sorgu: 
 
SELECT SUM(BAKIYE)
FROM MO_MUSTERI 

-- mo_musteri tablosundaki şehri Ankara olan müşterilerin bakiye değerlerinin toplamını veren sorgu: 
 
SELECT SUM(BAKIYE)
FROM MO_MUSTERI 
WHERE SEHIR = 'Ankara';