-- intersect: kesişim demektir. İki tablonun ortak alanlarına ait kayıtların listelendiği sql komutudur.
-- except: bir tabloda bulunup diğer tabloda bulunmayan değerlerin listelenmesini sağlar .

SELECT *
FROM MO_URUN INTERSECT
SELECT *
FROM MO_MUSTERI;

-- mo_urun tablosunda olup mo_musteri tablosunda olmayan veriler listelenir.
SELECT *
FROM MO_URUN
EXCEPT
SELECT *
FROM MO_MUSTERI;