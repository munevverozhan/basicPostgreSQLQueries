-- cross join: herhangi bir şart olmadan 2 tablodaki bütün değerleri birleştirir.
-- cross join kullanarak oluşan tablo birleştirme işlemine dahil edilen tablodaki satır sayılarının çarpımı kadar değer alır.
-- ör: ilk tabloda 5 kayıt , 2. tabloda 2 kayıt varsa, cross join işlemi sonucunda toplam 10 kayıt oluşur.

SELECT BOLUMAD, AD
FROM MO_BOLUM
CROSS JOIN MO_FAKULTE ;