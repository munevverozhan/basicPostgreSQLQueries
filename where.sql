-- mo_musteri tablosundan; ad değeri Mehmet olan müşterinin tüm bilgilerini listeleyen sorgu :
select * from mo_musteri where ad='Mehmet';

-- mo_musteri tablosundan; sehir değeri Ankara ve id'si 4 olan veya sehir değeri Adana olan  müşterilerin tüm bilgilerini listeleyen sorgu :
select * from mo_musteri where sehir='Ankara' and id=4 or sehir='Adana';

-- mo_musteri tablosundan; bakiyesi 3000'den büyük veya 2700'den küçük ya da eşit olan müşterileri listeleyen sorgu.
select * from mo_musteri where bakiye>3000 or bakiye<=2700;

-- mo_musteri tablosundan; sehir değeri Ankara olan ve bakiyesi 6000'den büyük olan veya soyadı Çınar olan müşterileri listeler.
select * from mo_musteri where sehir='Ankara' and bakiye>6000 or soyad='Çınar';
