-- id değeri 10 olan müşteriyi delete komutu ile silmiş oluruz.

DELETE
FROM MO_MUSTERI
WHERE ID = 10;

-- update komutu ile istenen bir değer belirtilen şarta göre güncellenir.
-- mo_musteri tablosunda; id değeri 1 olan müşterinin bakiyesi 5750 olarak güncellendi.

UPDATE MO_MUSTERI
SET BAKIYE = 5750
WHERE ID = 1 ;


SELECT *
FROM MO_MUSTERI
ORDER BY ID ;

-- mo_musteri tablosunda; sehir değeri Adana olan müşterilerin şehirleri İzmir olarak güncellendi.

UPDATE MO_MUSTERI
SET SEHIR = 'İzmir'
WHERE SEHIR = 'Adana';