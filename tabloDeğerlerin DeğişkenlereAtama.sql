Tablo Değerlerini Değişkenlere Atama :

DO $$
DECLARE
TOPLAM int;

TOPLAM2 int;

BEGIN TOPLAM :=
	(SELECT COUNT(*)
		FROM MO_DERS);

RAISE NOTICE 'ders sayısı : %',
	TOPLAM;

TOPLAM2 :=
	(SELECT COUNT(*)
		FROM MO_DERS
		WHERE LENGTH(DERS_AD) > 8);

RAISE NOTICE 'ders adının uzunluğu 8 den büyük olan derslerin sayısı : %',
	TOPLAM2;
end;
$$

ÇIKTI :

NOTICE:  ders sayısı : 10
NOTICE:  ders adının uzunluğu 8 den büyük olan derslerin sayısı : 4
DO
