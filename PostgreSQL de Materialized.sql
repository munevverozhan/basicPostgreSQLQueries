PostgreSQL'de Materialized View'lar:

-- Materialized view'lar veriyi fiziksel olarak depolar.
-- Materialized view'lar karmaşık ve maliyetli sorguların sonuçlarını cache'ler ve bu sonuçları  periyodik olarak yenilemeye izin verir.

-- Materialized view'ler, daha hızlı veri erişimi gerektiren birçok durumda kullanışlıdır, bu nedenle  iş zekası uyuglamalarında ve  veri ambarlarında sıklıkla kullanılırlar.


Materialized View'ların Oluşturulması  ':

-- Bir materialized view oluştururken, CREATE MATERIALIZED VIEW ifadesini kulanırız.

CREATE MATERIALIZED VIEW view_name
AS
query
WITH [NO] DATA;

Nasıl Çalışır :
-- İlk olarak ; CREATE MATERIALIZED VIEW cümleciğinden sonra view için, spesifik bir name değeri veririz.

-- 2. olarak ; AS anahtar kelimesinden sonra , esas tablo'dan verilerin getirilmesi için sorgu eklenir.

-- 3.olarak ; materialized view içindeki verinin oluşturulma zamanında yüklenmesi isteniyorsa , WITH DATA seçeneği kullanılabilir ; aksi takdirde , WITH NO DATA kullanılabilir. WITH NO DATA kullanıldığı durumda, view okunamaz olarak işaretlenir. Bunun anlamaı , veri yükleyene kadar view'dan veri sorgulayamayacağınız anlamına gelir.


Materialized View'larda Veri Yenilenmesi ':

-- Materialized view içerisine veri'nin yüklenmesi için ,REFRESH MATERIALIZED VIEW ifadesi kullanılır.

REFRESH MATERIALIZED VIEW view_name;

-- Bir materialized view için veri yenilendiği zaman, PostgreSQL bütün tabloyu kilitler, dolayısıyla verileri  ona göre sorgulayamayız. Bunu önlemek için, CONCURRENTLY ifadesi kullanılabilir. 

REFRESH MATERIALIZED VIEW CONCURRENTLY view_name;

-- CONCURRENTLY ifadesiyle, PostgreSQL materialized view'ın güncellenmiş geçici versiyonunu oluştururur, 2 versiyonu karşılaştırır ve yalnızca farklılıklar için insert ve update 
gerçekleştirir.

--Bir materialized view güncellenirken, sorgulama yapabiliriz. CONCURRENTLY seçeneğini kullanmanın bir gereksinimi, materialized view'in UNIQUE bir dizine sahip olması gerektiğidir.


MATERIALIZED VIEW'IN SİLİNMESİ ':

DROP MATERIALIZED VIEW view_name;

-- rental_by_category adında bir materialized view oluşturuldu. 
CREATE MATERIALIZED VIEW rental_by_category
AS
 SELECT c.name AS category,
    sum(p.amount) AS total_sales
   FROM (((((payment p
     JOIN rental r ON ((p.rental_id = r.rental_id)))
     JOIN inventory i ON ((r.inventory_id = i.inventory_id)))
     JOIN film f ON ((i.film_id = f.film_id)))
     JOIN film_category fc ON ((f.film_id = fc.film_id)))
     JOIN category c ON ((fc.category_id = c.category_id)))
  GROUP BY c.name
  ORDER BY sum(p.amount) DESC
WITH NO DATA;

--WITH NO DATA kullandığımız için veriler sorguyla listelenemez. Eğer denersek bize hata verecektir.

SELECT * FROM rental_by_category;
	
[Err] ERROR: materialized view "rental_by_category" has not been populated
HINT: Use the REFRESH MATERIALIZED VIEW command.

-- Bu verilerin sorgulanması için ; 
REFRESH MATERIALIZED VIEW rental_by_category;


-- concurrently opsiyonu ile yenileme yapmak için UNIQUE index kullanmalıyız.

CREATE UNIQUE INDEX rental_category ON rental_by_category (category);

REFRESH MATERIALIZED VIEW CONCURRENTLY rental_by_category;
