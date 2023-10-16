-- like operatörü bir kolon içerisinde belirtilen değeri aramak için where ile birlikte kullanılır.
-- birlikte sıklıkla kullanıldığı 2 karakter vardır , bunlar:
-- % ve _ 'dir.
-- % işareti sıfır, bir veya birden fazla karakteri temsil ederken,  _ işareti yalnızca bir karakteri temsil eder.
--mo_musteri tablosunda ; ad içerisinde a geçen tüm müşterileri listeler.

SELECT *
FROM MO_MUSTERI 
WHERE AD like '%a%';

--mo_musteri tablosunda ; ad değeri A ile başlayan tüm müşterileri listeler.

SELECT *
FROM MO_MUSTERI
WHERE AD like 'A%';

--mo_musteri tablosunda ; ad değeri a ile biten tüm müşterileri listeler.

SELECT *
FROM MO_MUSTERI
WHERE AD like '%a';

--mo_musteri tablosunda ; ad içerisinde a harfi geçmeyen tüm müşterileri listeler.
SELECT *
FROM MO_MUSTERI
WHERE AD not like '%a%'
