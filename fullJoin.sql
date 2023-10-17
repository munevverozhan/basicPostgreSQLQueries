-- full join: 2 tabloda bulunan bütün değerleri çeker daha sonra birinde olup diğerinde olmayan alanlar için null atar.

SELECT MO_MUSTERI.AD,
	SOYAD,
	SEHIR,
	MO_MESLEK.AD
FROM MO_MESLEK
FULL JOIN MO_MUSTERI ON MO_MESLEK.ID = MESLEK ;
