-- metinsel fonksiyonar:  sqlde uzun uzun yazacağımız sorguların  tek kelimelik fonksiyonlar ile  yazılası işlemidir.
-- ör: Münevver Özhan -> M.Özhan şeklinde yazdırmak için metinel fonksiyonlar kullanılır.
-- ASCII : girilen karakterin ASCII kod tablosundaki karşılığını verir.

SELECT ASCII ('A'); -- sonuç olarak 65 değerini görürüz.

-- concat: girilen parametreleri birleştiren fonksiyondur.

SELECT CONCAT('Hello ','World'); -- sonuç olarak tablo satırında Hello World yazısını görürüz.

-- concat_ws: girilen parametreleri birleştirmek yerine bu parametreler arasına ilk parametreyi ekler.

SELECT CONCAT_WS ('*','Hello ',' SQL',' World'); -- sonuç olarak tablo satırınsa Hello * SQL* World yazısını görürüz.

-- left : 2 parametre alan bir fonksiyondur. İlk parametresi metin, 2. parametresi bu metnin soldan başlayıp kaç karakterlik kısmının alınacağı bilgisidir.

SELECT LEFT('Münevver',4);-- sonuç olarak tablo satırında Münev yazısını görmüş oluruz.

-- right: 2 parametre alan bir fonksiyondur. İlk parametresi metin, 2. parametresi bu metnin sağdan başlayıp kaç karakterlik kısmının alınacağı bilgisidir.

SELECT RIGHT('Münevver', 5);-- sonuç olarak tablo satırında evver yazısını görmüş oluruz.

-- length: gelen parametrenin kaç karakterden oluştuğu bilgisini verir.

SELECT LENGTH('Benim manevi mirasım bilim ve akıldır.');

-- replace: sorgu ekranına girdiğimiz herhangi bir ifadenin istenen karakterinin başka bir karakter ile değiştirilmesini sağlar.

SELECT REPLACE(AD,'ü','u')
FROM MO_MESLEK;  -- mo_meslek tablosundaki ad kolonunda bulunan bütün 'ü' karakterlerini 'u' olarak günceller.

-- reverse: ilgili ifadeyi tersten yazmamızı sağlar.

SELECT REVERSE('selam'); -- sonuç olarak tablo satırında males yazısını görmüş oluruz.

SELECT REVERSE(AD)
FROM MO_MESLEK; -- sonuç olarak tablo satırlarında; mo_meslek tablosunun ad kolonunun her bir satırındaki ifadenin tersten yazılmış halini görmüş oluruz.

-- substring: 3 tane parametre alan bir fonksiyondur. 1. parametre; string bir değer, 2.parametre; göstermeye hangi karakterden başlanacağı bilgisi, 3.parametre; kaç karakter gösterileceği bilgisidir. 
SELECT SUBSTRING ('hello world',1,5);  -- sonuç olarak; hello yazısını görmüş oluruz. Hello world stringi'nin ; 1.karakterden başlayıp 5 karakter'in ekranda görünmesini istedik.

-- lower : istenen ifadenin tüm karakterlerinin küçük harfle yazılmasını sağlar.
SELECT LOWER(' Hello World ! '); -- sonuç olarak : "" hello world ! " ifadesini görmüş oluruz.

-- upper: istenen ifadenin tüm karakterlerinin büyük harfle yazılmasını sağlar.

SELECT UPPER(AD)
FROM MO_MESLEK;  -- sonuç olarak mo_meslek tablosundaki ad kolonu'nun verilerini büyük harfle yazar.