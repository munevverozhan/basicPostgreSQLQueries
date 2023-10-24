PostgreSQL Views : 

 -- Bir View ; depolanmış bir sorgudur. Bir view'e, PostgreSQL içerisindeki sanal bir tablodan erişilebilir.  Başka bir deyişle bir PostgreSQL view'i, tamamen bi SELECT ifadesi sayesinde bir veya daha fazla temel tablonun verilerini temsil eden mantıksal bir tablodur.

-- NOT: Bir View , materialized view haricinde, veriyi fiziksel olarak bir tablo gibi depolamaz.

--Bir View,  aşagıdaki gibi bazı durumlarda oldukça kullanışlı olabilir :

-- * Bir view, karmaşık bir sorguyu temel alan bir view'ı basit bir SELECT ifadesi kullanarak sorgulayabileceği için sorgunun karmaşıklığını basitleştirmeye yardımcı olur.
 
-- * Bir tablo gibi,kullanıcıların görme yetkisine sahip olduğu, belirli verileri içeren  bir view aracılığıyla , kullanıcılara izin verebilirsiniz.

-- * Bir view, esas tablonun kolonları değişse bile tutarlı bir katman  sağlar.


PostgreSQL View OLuşturma : 

-- Bir view oluşturmak için ; CREATE VIEW ifadesini kullanarız.
-- Syntax'ı : 

CREATE VIEW view_name AS query; 

-- Öncelikle, create view cümleciğinden sonra view'a bir isim veririz , sonrasında ; sorgudan önce as anahtar sözcüğünü koyarız.  Bir sorgu , basit bir select ifadesinden veya joinler içeren karmaşık bir select ifadesinden oluşabilir. 

-- ÖRNEĞİN :  customer_master adında , karmaşık bir sorgu içeren bir view oluşturmak için ; 


CREATE VIEW customer_master AS
  SELECT cu.customer_id AS id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
        CASE
            WHEN cu.activebool THEN 'active'
            ELSE ''
        END AS notes,
    cu.store_id AS sid
   FROM customer cu
     INNER JOIN address a USING (address_id)
     INNER JOIN city USING (city_id)
     INNER JOIN country USING (country_id);
     
-- Customer verilerine erişmek için , oluşturduğumuz view'ın adını kullanarak bir select sorgusu yazarız :
 
 select * from  customer_master;
 
 
PostgreSQL'de View'ların Değiştirilmesi :
 
-- Tanımlı bir view sorgusunu değiştirirken, CREATE VIEW veya OR REPLACE ifadesi kullanılabilir.
 
CREATE OR REPLACE view_name 
AS 
query

-- Örneğin : customer_master tablosuna email eklenmesi için ; 

CREATE VIEW customer_master AS
  SELECT cu.customer_id AS id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
        CASE
            WHEN cu.activebool THEN 'active'
            ELSE ''
        END AS notes,
    cu.store_id AS sid,
    cu.email
   FROM customer cu
     INNER JOIN address a USING (address_id)
     INNER JOIN city USING (city_id)
     INNER JOIN country USING (country_id);
     
     
-- Tanımlı bir view'ı değiştirirken , ALTER VIEW ifadesini kullanırız. 

-- Örneğin : view adını customer_info olarak değiştirmek için;
ALTER VIEW customer_master RENAME TO customer_info;


PostgreSQL'de View'ların Silinmesi : 

DROP VIEW ifadesini kullanırız.
DROP VIEW [ IF EXISTS ] view_name;s
