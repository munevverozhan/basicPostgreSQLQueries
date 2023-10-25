Case :

-- Dallanmanın çok olduğu, özellikle birden fazla şartın olduğu durumlarda kullanılan akış kontrolüdür.
-- Çok fazla if yazmak yerine case ifadesi ile daha basit şekilde o işin yapılması sağlanmış olur.

-- mo_ders tablosunda olan ders_ad ve ders_saat kolonları için case kullanarak bir koşul oluşturma ;

select ders_ad,ders_saat,
case
when ders_id =20
then ders_saat =3
when ders_id = 21
then ders_saat = 4
-- else ders_saat = 5 (bu ifade ile yazılan koşulların dışındaki tüm değerlerin ders_saat'i 4 olarak ayarlanır.)
end duration
from mo_ders
order by ders_ad;
