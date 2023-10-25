Karar Yapıları :

DO $$
declare
 sinav1 int := 75;
 sinav2 int := 89;
 sinav3 int := 60;
 ortalama int  ;

begin
	ortalama := (sinav1 + sinav2 +sinav3) / 3;
	raise notice 'ort : %',ortalama ;
	if ortalama>=50 then
	raise notice 'geçti';
	else
	raise notice 'kaldı';
	end if;
	end;
	$$
	
-- ÇIKTI : 

NOTICE:  ort : 74
NOTICE:  geçti
DO



-- sayının tek mi çift mi olduğunu veren koşul sorgusu:

DO $$ 
DECLARE 
SAYI int :=24;
begin 
if sayi%2=0 then 
raise notice 'çift sayı';
else 
raise notice 'tek sayı';
end if;
end;
$$

-- ÇIKTI :

NOTICE:  çift sayı
DO

-- ders adı Matematik olan dersin toplam saati 5 den büyük mü kontrolü için ;

DECLARE
TOPLAM int ;

BEGIN TOPLAM :=
	(SELECT ders_saat
		FROM MO_DERS where ders_ad='Matematik' );
		if toplam >5 then
		raise notice 'ders saati 5 den büyük ';
		else
		raise notice 'ders saati 5 den küçük';
		end if;
end;
$$


