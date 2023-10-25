DeğişkenTanımlama :

DO $$

DECLARE            -- bu kısımda değişken tanımlaması ve değişken ataması yapılır.
X int := 20;  

Y int := 15;

Z int;

BEGIN              -- bu kısımda değişken ataması yapılır , yapılacak işlemler gerçeşleştirilir , ekrana yazdırma işlemi 
		   -- gerçekleştirilir.

RAISE NOTICE 'sayi1 : %',X;  -- raice notice ile ekrana yazdırma işlemi yapılır. % işareti x'in değerinin nereye yazılacağını .
			     --gösterir.
RAISE NOTICE 'sayi2: %',Y;

RAISE NOTICE 'sayi3: %',Z;  -- z içerisine bir değer atamadığımız için sonuç null gelecektir.

end;
$$ 

 ÇIKTI :
 
NOTICE:  sayi1 : 20
NOTICE:  sayi2: 15
NOTICE:  sayi3: <NULL>
DO
