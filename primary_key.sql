PRIMARY KEY : 


-- Birincil anahtar, bir tablodaki bir satırı benzersiz şekilde tanımlamak için kullanılan bir sütun veya sütun grubudur.

-- Primary key'leri , primary key kısıtlamaları sayesinde tanımlarız.

-- Bir primary key kısıtlaması; not-null ve unique kısıtlamalarının kombinasyonundan oluşur.

-- Bir tablo; yalnızca bir primary key'e sahip olabilir. 
-- Her tabloya bir primary key eklemek iyi bir yöntemdir.

--Tabloya bir primary key eklendiğinde PostgreSQL , birincil anahtarı tanımlamak için kullanılan sütunda veya bir sütun grubunda benzersiz bir B-tree dizini oluşturur.


TABLO OLUŞTURURKEN PRIMARY KEY TANIMLAMAK : 

--Normalde, tablo'nun yapısını CREATE TABLE kullanarak tanımladığımızda primary key'i tabloya ekleriz.

create table tblName(
  	column_1 data_type primary key ,
  	column_2 data_type,
  	...
);

--Primary key'in 2 veya daha fazla sütundan oluşması durumunda primary key kısıtlamasını şu şekilde tanımlarız;

create table tblName(
	column_1 data_type,
	column_2 data_type,
	...
	primary key (column_1,column_2)
);

-- Birincil anahtar kısıtlamasının adı açıkça belirtilmezse PostgreSQL, birincil anahtar kısıtlamasına default bir ad atayacaktır.PostgreSQL, birincil anahtar kısıtlamasının default adı olarak table-name_pkey'i kullanır.

--Birincil anahtar kısıtlamasına özel bir ad verilmek istendiğinde CONSTRAINT kelimesini aşağıdaki gibi kullanırız:

CONSTRAINT constraint_name PRIMARY KEY(column_1, column_2,...);


MEVCUT TABLONUN YAPISI DEĞİŞTİRİLDİĞİNDE PRIMARY KEY TANIMLAMA:

-- Mevcut tablo için primary key tanımlamak nadir bir durumdur.
-- Bu durumda; ALTER TABLE kullanarak bir primary key kısıtlaması eklenebilir. 

ALTER TABLE table_name ADD PRIMARY KEY (column_1, column_2);


MEVCUT BİR TABLOYA OTOMATİK OLARAK ARTAN BİR PRIMARY KEY NASIL EKLENİR ?

-- Bunu bir örnek üzerinden inceleyelim : 

--vendors adında bir tablo oluşturdum.
CREATE TABLE vendors (name VARCHAR(255));

-- insert komutu ile vendors tablosuna yeni değerler ekledim.
INSERT INTO vendors (NAME)
VALUES
	('Microsoft'),
	('IBM'),
	('Apple'),
	('Samsung');
	
-- id adında ve otomatik artan şekilde bir primary key eklemek istersek ; 

alter table vendors add column id serial primary key ;



PRIMARY KEY NASIL SİLİNİR ?

--Mevcut durumdaki bir primary key kısıtlamasını silmek için alter table komutunu kullanabiliriz.

alter table table_name drop constraint primary_key_constraint;
