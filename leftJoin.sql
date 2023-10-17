-- left join: 2 tablo arasında sol taraftaki bütün değerleri getirir sağ taraftaki değerlerin tamamını getirmez, sadece sol tarafla ilişkisi olan değerleri getirir.
-- eğer sol tarafta bulunup sağ tarafta bulunmayan değerler varsa o zaman sol taraftaki değerleri getirip sağ taraftaki değere null atar.

SELECT BOLUMID,
	BOLUMAD,
	MO_FAKULTE.AD
FROM MO_BOLUM
LEFT JOIN MO_FAKULTE ON MO_FAKULTE.ID = BOLUMF; -- solda kalan tablomuz mo_bolum olduğu için bu tabloya gore left join yapmış olduk.

SELECT BOLUMID,
	BOLUMAD,
	MO_FAKULTE.AD
FROM MO_FAKULTE
LEFT JOIN MO_BOLUM ON MO_FAKULTE.ID = BOLUMF; -- solda kalan tablomuz mo_fakulte olduğu için bu tabloya göre left join yapmış olduk.