-- union - union all: 2 tabloyu birleştirip verileri tek tablo şeklinde yazmamızı sağlar.
-- union kullanınca; 2 tabloda da ortak olan verinin 1 kez yazılmasını sağlar (distnict).
-- union all kullanınca; 2 tabloda da ortak olan verinin 1 kez yazılmasını sağlamaz bütün her şeyi yeni oluşan tabloya yazar.

SELECT *
FROM MO_KATEGORI
UNION
SELECT *
FROM MO_MESLEK;