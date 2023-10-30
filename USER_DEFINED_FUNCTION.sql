USER-DEFINED FUNCTION :

-- CREATE FUNCTION ifadesi ile kullanıcı tanımlı yeni bir fonksiyon tanımlanır.
-- Syntax'ı:

create [or replace] function function_name(param_list)
   returns return_type 
   language plpgsql
  as
$$
declare 
-- variable declaration
begin
 -- logic
end;
$$

-- Bu syntax'da ;
-- İlk olarak, CREATE FUNCTION anahtar kelimesinden sonra, fonksiyon ismi tanımlanır. Eğer, mevcut fonksiyonu değiştirmek istiyorsak, OR REPLACE anahtar kelimelerini kullanırız.

-- Sonrasında , fonksiyon adından sonra parantezler içerisine fonksiyon parametre listesi tanımlanır. Bir fonksiyon'un 0 veya birden çok parametresi olabilir.

-- Sıradaki adım, returns kelimesinden sonra return edilecek değerin veri tipini tanımlamaktır.

-- Sonrasında, LANGUAGE PLPGSQL kullanarak funksiyonun prosedür dili tanımlanır.
-- NOT : PostgreSQL prosedür dili olarak sadece PLPGSQL'i değil birden fazla dili destekler.
-- Son olarak, dolar bazlı dize sabiti ($$) bloklar içerisine konur.


-- ÖRNEĞİN: 

-- Film uzunluğu len_from ve len_to parametreleri arasında olan filmlerin sayısını veren bir fonksiyon oluşturalım :

create function get_film_count(len_from int, len_to int)
returns int
language plpgsql
as
$$
declare
   film_count integer;
begin
   select count(*) 
   into film_count
   from film
   where length between len_from and len_to;
   
   return film_count;
end;
$$;

-- get_film_count 2 ana bölümden oluşur ; header ve body.

-- Header bölümünde;

-- İlk olarak, create function anahtar kelimesinden sonra fonksiyon adı olan get_film_count bulunur.
-- İkinci olarak, get_film_count() fonksiyonunda, veri tipi integer olan len_from ve len_to parametreleri bulunur.
-- Üçüncü olarak, get_film_count fonksiyonu, returns int kelimesiyle bir integer return edildiğini belirtir.
-- Son olarak, fonksiyon dili olan plpgsql , language plpgsql ile belirtilir.

-- Function body kısmında; 

-- $$ ile başlayan ve $$ ile biten dolar tırnaklı dize sabiti sözdizimini kullanırız. Bu $$ arasına, fonksiyonun bildirimini ve mantığını içeren bir blok yerleştirebiliriz.

-- Declaration bölümünde, film tablosundan seçilen filmlerin  
sayısını tutan film_count isimli bir değişken tanımlanmıştır.

-- Bloğun body kısmında; select into ifadesiyle, len_from ve len_to arasındaki filmlerin sayısını listeler  ve sonuç film_count değişkenine atanır. Bloğun sonunda , return ifadesi ile film_count return edilir.


KULLANICI TANIMLI FONKSİYONUN ÇAĞIRILMASI : 

--PostgreSQL kullanıcı tanımlı fonksiyonun çağırılması için  3 yol sağlar ; 

1 --> Konumsal Gösterimi Kullanma (Using positional notation)
2 --> Adlandırılmış Gösterimi Kullanma (Using named notation)
3 --> Karışık Gösterimi Kullanma (Using the mixed notation)


1) Konumsal Gösterimi Kullanma (Using positional notation) :

 -- Konumsal gösterim kullanılarak bir fonksiyon çağırırken, 
parametredeki argümanların benzer şekilde tanımlanması gerekir.

-- Örneğin ; 

select get_film_count(40,90);

2) Adlandırılmış Gösterimi Kullanma (Using named notation) :

-- Adlandırılmış gösterimde; => kullanarak argümanın adını ve değerini ayırırız.

-- Örneğin ;

select get_film_count(
    len_from => 40, 
     len_to => 90
);

3)  Karışık Gösterimi Kullanma (Using the mixed notation) :

-- Karışık gösterim, konumsal ve adlandırılmış gösterimin kombinasyonudur.

-- Örneğin;

select get_film_count(40, len_to => 90);

NOT : Adlandırılmış gösterim, konumsal gösterimden önce kullanılamaz.

select get_film_count(len_from => 40, 90);

-- Error

ERROR:  positional argument cannot follow named argument
LINE 1: select get_film_count(len_from => 40, 90);


