Değişkenler İle Aritmetik İşlemler :

DO $$
DECLARE
X int := 20;

Y int := 4;

TOPLAM int ;

CARPIM int ;

FARK int ;

BOLUM int;

BEGIN
TOPLAM := X + Y;

CARPIM := X * Y;

BOLUM := X / Y;

FARK := X - Y;

raise notice 'Toplam : %',toplam;
raise notice 'Fark : %',fark;
raise notice 'Çarpım : %',carpim;
raise notice 'Bolum : %',bolum;

end;
$$

-- ÇIKTI : 
NOTICE:  Toplam : 24
NOTICE:  Fark : 16
NOTICE:  Çarpım : 80
NOTICE:  Bolum : 5
DO
