-- ilişkili tablo : veri tekrarını önleyen ,veritabanı hakimiyetini arttıran ve veritabanı'nın optimizasyonunu arttıran önemli bir yapıdır.
-- primary key: tabloda ilgili satırın tekrar etmesinin önüne geçen ve sadece o satıra ait bir id değeri oluşturan bir alandır.
-- foreign key: primary key ile ilişki içerisine dahil edilecek kolondur.
-- ilişki türleri: one to o ne , one to many , many to many

-- mühendislik fakültesindeki bölümlerin listelenmesi:
 
SELECT BOLUMAD
FROM MO_FAKULTE
INNER JOIN MO_BOLUM ON MO_BOLUM.BOLUMF = ID 
WHERE AD = 'mühendislik';

-- her bir fakültede toplam kaç tane bölüm olduğunu listeleyen sorgu :

SELECT COUNT(MO_BOLUM.BOLUMF) AS TOPLAM_BOLUM_SAYISI,
	MO_FAKULTE.AD
FROM MO_FAKULTE
INNER JOIN MO_BOLUM ON MO_BOLUM.BOLUMF = ID
GROUP BY MO_FAKULTE.AD;

-- mo_bolum tablosunda en fazla bölümü bulunan fakültenin ismini listeleyen sorgu:

SELECT MO_FAKULTE.AD,
	COUNT(BOLUMF)
FROM MO_BOLUM
INNER JOIN MO_FAKULTE ON MO_FAKULTE.ID = MO_BOLUM.BOLUMF
GROUP BY MO_FAKULTE.AD
ORDER BY COUNT(BOLUMF) DESC
LIMIT 1;