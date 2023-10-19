ALTER TABLE

-- Mevcut tablonun yapısını değiştirmede alter table ifadesi kullanılır.

--Temel yazım şekli ;

ALTER TABLE table_name action; 

--PostgreSQL birçok aksiyon sağlar :
--  kolon ekleme
--  kolon silme
--  kolon veri tipini değiştirme
--  kolonu yeniden adlandırma
--  kolona default bir değer atama
--  kolona kısıtlama ekleme
--  tabloyu yeniden adlandırma 

-- tabloya yeni bir kolon eklenmesi için , ALTER TABLE ADD COLUMN ifadesi kullanılır.

ALTER TABLE table_name 
ADD COLUMN column_name datatype column_constraint;

-- tablodan bir kolon silinmesi için, ALTER TABLE DROP COLUMN ifadesi kullanılır.

ALTER TABLE table_name 
DROP COLUMN column_name;

-- kolon adını tekrar adlandırmak için, ALTER TABLE RENAME COLUMN TO ifadesi kullanılır.

ALTER TABLE table_name 
RENAME COLUMN column_name 
TO new_column_name;

-- kolon'un default değerini değişmek için, ALTER TABLE ALTER COLUMN SET DEFAULT veya DROP DEFAULT kullanılır.

ALTER TABLE table_name 
ALTER COLUMN column_name 
[SET DEFAULT value | DROP DEFAULT];

-- not null kısıtlamasını değişmek için, ALTER TABLE ALTER COLUMN ifadesi kullanılır.

ALTER TABLE table_name 
ALTER COLUMN column_name 
[SET NOT NULL| DROP NOT NULL];

-- check kısıtlaması eklemek için, ALTER TABLE ADD CHECK ifadesi kullanılır.

ALTER TABLE table_name 
ADD CHECK expression;

-- genel olarak, tabloya bir kısıtlama eklemek için ALTER TABLE ADD CONSTRAINT ifadesi kullanılır.

ALTER TABLE table_name 
ADD CONSTRAINT constraint_name constraint_definition;

-- tabloyu yeniden adlandırmak için, ALTER TABLE RENAME TO ifadesi kullanılır.

ALTER TABLE table_name 
RENAME TO new_table_name;


-- ALTER TABLE ÖRNEKLERİ:

-- link adında bir tablo oluşturalım.

DROP TABLE IF EXISTS links;

CREATE TABLE links (
   link_id serial PRIMARY KEY,
   title VARCHAR (512) NOT NULL,
   url VARCHAR (1024) NOT NULL
);

-- active adında yeni bir kolon eklemek için;

alter table links
add column active boolean;

-- links tablosundan avtive kolonunun silinmesi için;

alter table links
drop column active;

-- title isimli kolonun adını link_title olarak güncellemek için;

alter table links
rename column title
to link_title;

-- links tablosuna target isimli yeni bir kolon eklenmesi için;

alter table links
add column target varchar(10);

-- links tablosundaki target kolonunun default değerine _blank atamak için;

alter table links
alter column target
set default '_blank';

-- Eğer links tablosunun target kolonuna bir değer belirtilmeden insert ile bir değer ataması yapılırsa ; target kolonunda default olarak _blank değeri gelecektir.


-- target kolonuna check şartı eklenmesi ve target kolonunun kabul ettiği değerlerin yalnızca : _self, _blank, _parent ve _top olması :

alter table links
add check (target in ('_self', '_blank', '_parent', '_top'));

-- links tablosundaki url kolonuna unique kısıtlaması eklenmesi;

alter table links
add constraint unique_url unique(url);

-- links tablosunun adını urls olarak değiştirmek için;
alter table links
rename to urls;

