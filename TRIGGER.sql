TRIGGER :

-- Bir tabloda herhangi bir değişiklik yapıldıktan sonra , yani temel CRUD işlemleri gerçekleştirildikten sonra , bir başka tablonun veya aynı tablonun bu durumdan etkilenmesidir.

-- Fakulte tablosuna herhangi bir veri kaydı yaptıktan sonra, toplamfakulte tablosunda bulunan sayı kolonu 1 artsın ve bu işlem otomatik olarak yapılsın.

-- Trigger oluştururken 2 adım 	 ;

-- 1) Öncelikle bir fonksiyon oluşturulur. BU fonksiyonda yapılacak olan işlem belirlenir.
-- 2) Trigger oluşturulur.

create or replace function test()
returns trigger
as $$
begin 
update toplamfakulte set sayi = sayi+1;
return new;
end;
$$
language plpgsql;

create trigger test_trigger
after insert      -- ekleme (insert) işlemi yaptıktan sonra çalışır.
on fakulte 	  -- hangi tabloda işlem yapılacağını belirtir.
for each row
execute procedure test();



create or replace function test1()
returns trigger
as $$
declare 
uzunluk integer;))
begin 
uzunluk := (select length(ad) from fakulte order by id desc limit 1 ); -- limit ile sağda belirtilen değer kadar veri seçilir.
update toplamfakulte2 set sayi = sayi + uzunluk;
return new;
end;
$$
language plpgsql;

create trigger test_trigger 
after insert 
on fakulte
for each row
execute procedure test1();
