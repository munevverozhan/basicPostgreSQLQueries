Fonksiyonlar :

--Procedure'den farkı bir değer return etmesidir.

-- 2 sayının toplamını veren fonksiyon :

CREATE FUNCTION MO_TOPLAM (S1 int , S2 int) 
RETURNS int 
LANGUAGE PLPGSQL 
AS 
$$
declare
sonuc int ;
begin
sonuc := s1+s2 ;
return sonuc ;
end;
$$

select mo_toplam (8,7);


CREATE FUNCTION MO_KDV(FIYAT float) 
RETURNS float
LANGUAGE PLPGSQL
AS $$
begin
fiyat := fiyat * 0.08 +fiyat ;
return fiyat ;
end ;
$$

 select ad, yazar, fiyat, mo_kdv(fiyat) from kitaplar;
 
 
 Tablo Sonuçlu Fonksiyonlar : 
 
-- mo_ogretmen tablosundaki öğretmenlerin adında ; parametreye verilen değer varsa, bu verileri listeleyen fonksiyon :

CREATE FUNCTION mo_OGRETMENGETIR(OGRT varchar) 
RETURNS TABLE 
(ID int,
 AD varchar,
 okul_id int
)
as $$
begin 
return query
SELECT * from MO_OGRETMEN where ogrt_ad like ogrt;
end;
$$
language plpgsql;

select * from mo_ogretmengetir('%b%');
