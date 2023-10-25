WAIT FOR :
-- Yazılan sql sorgularını belirli bir saniye,dk veya saat sonra çalıştıran tsql komutudur.
-- Yedekleme işleminde kullanılabilir.
-- Bir işlem beklesin ve bekledikten bir süre sonra çalışsın istersek bu komutu kullanırız. 
-- pg_sleep() komutu ile kullanırız. Parametre içerisine saniye cinsinden bir değer veririz.

-- istenen sorguyu 5 saniye sonra getiren komut ; 
select pg_sleep(5); 
select * from mo_ders;
