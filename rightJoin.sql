-- right join: sağ taraftaki bütün değerleri getirir. eğer bu değerin sol tarafta karşılığı yoksa burada null yazar.

SELECT ID,AD,
	BOLUMAD
FROM MO_FAKULTE
RIGHT JOIN MO_BOLUM ON MO_FAKULTE.ID = BOLUMF; -- sağdaki tablo mo_bolum olduğu için right join bu tabloya göre yapılır.


SELECT ID,AD,
	BOLUMAD
FROM MO_BOLUM
RIGHT JOIN MO_FAKULTE ON BOLUMF = MO_FAKULTE.ID; -- sağdaki tablo mo_fakulte olduğu için buna göre right join yapılır.