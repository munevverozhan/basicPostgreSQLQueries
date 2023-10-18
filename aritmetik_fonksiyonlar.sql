-- artimetik fonkiyonlar:
-- abs: ilgili değerin mutlak değerini verir.

SELECT ABS (-5); -- sonuç: 5 'dir.

-- ceil: parametre olarak girilen ondalıklı sayıyı bir üst tam sayıya yuvarlar.

SELECT CEIL(8.2); -- sonuç 9'dur.

-- floor: parametre olarak girilen ondalıklı sayıyı bir alt tam sayıya yuvarlar.

SELECT FLOOR(4.95); -- sonuç 4 'dür.

-- pi : pi sayısının değerini veren  bir fonksiyon'dur.

SELECT PI(); -- sonuç: 3.141592653589793 .


SELECT CEIL(PI()); -- sonuç : 4

-- power : gelen 2 parametreye göre üs alma işlemi için kullanılır. ilk parametre taban , ikinci parametre kuvvet'dir.

SELECT POWER(2,3); -- sonuç: 8

-- random: 0-1 arasında rastgele ondalıklı bir değer getirir. her çalışmada farklı bir değer getirir.

SELECT CEIL(RANDOM() * 10); -- 0-10 arasında random bir tam sayı değeri üretir.

-- round: girilen ondalıklı sayılar üzerinde istenilen basamak kadar yuvarlama işlemi yapılır. özelikle tablo bazlı işlemlerde kullanılabilecek bir komuttur.

SELECT ROUND(20.5487954,2); -- sonuç: 20.55

-- sign: girilen parametrenin negatif mi yoksa pozitif mi olduğunu verir.

SELECT SIGN(10); -- pozitif değer olduğu için sonuç: 1'dir.


SELECT SIGN(-10); -- negatif değer olduğu için sonuç : -1'dir.


SELECT SIGN(0); -- sonuç : 0'dır.

--sqrt: karekök almak için kullanılır.

SELECT SQRT(144); -- sonuç : 12

-- log: girilen değerin logaritmik değerini verir.

SELECT LOG(50); -- sonuç: 1.6989700043360187

-- aggregate functions: count, avg, sum, max,min .