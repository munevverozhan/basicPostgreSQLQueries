Procedure :

Belirli işleri yapmak için, bu işlerin tamamının tek bir kelime adı altında toplandığı yapılardır.

create procedure mo_test ()
language plpgsql
as $$ 
begin 
raise notice 'postgresql procedure' ;
end;
$$

call mo_test();

-- Parametreli Procedure Kullanımı :

create procedure mo_ders_ekle(p1 text , p2 int)
language sql
as $$
insert into mo_ders (ders_ad, ders_saat) values (p1,p2);
$$ ;

call mo_ders_ekle('test',2); -- mo_ders tablosuna test adında yeni bir ders eklenir ve ders saati 2 olarak atanır.
