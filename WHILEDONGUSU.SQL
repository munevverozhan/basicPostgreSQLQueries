WHILE DONGUSU :

-- 1 den 10 a kadar olan sayıların listelendiği ve bu sayıların toplandığı döngü :
DO $$ 
DECLARE
SAYAC int := 1;

TOPLAM int := 0;

BEGIN WHILE SAYAC <= 10 
LOOP 
TOPLAM = TOPLAM + SAYAC;

SAYAC := SAYAC + 1;

RAISE NOTICE 'sayac: %',
	SAYAC;
	
END LOOP;

RAISE NOTICE 'sayıların toplamı: %',
	TOPLAM;

end;
$$

--ÇIKTI :

NOTICE:  sayac: 2
NOTICE:  sayac: 3
NOTICE:  sayac: 4
NOTICE:  sayac: 5
NOTICE:  sayac: 6
NOTICE:  sayac: 7
NOTICE:  sayac: 8
NOTICE:  sayac: 9
NOTICE:  sayac: 10
NOTICE:  sayac: 11
NOTICE:  sayıların toplamı: 55
DO

-- hello değerini ekrana 5 kez yazdıran sorgu:
DO $$ 
DECLARE 
DEGER int :=0;

BEGIN 
LOOP
EXIT WHEN DEGER = 5;

RAISE NOTICE 'hello';

DEGER := DEGER + 1;

end loop;
end;
$$

-- ÇIKTI :

NOTICE:  hello
NOTICE:  hello
NOTICE:  hello
NOTICE:  hello
NOTICE:  hello
DO
