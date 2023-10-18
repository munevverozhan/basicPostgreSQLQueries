FOREIGN KEY 

-- Foreign key ; bir tablodaki, başka bir tablonun primary key'ine başvuran bir kolon veya kolonlar grubudur.
-- Foreign key içeren tabloya referans tablosu (referencing table) veya alt tablo (child table) adı verilir. 
-- Foreign key tarafından başvurulan tabloya; başvurulan tablo (referenced table) veya ana tablo (parent table) denir.

--Bir tablo ; diğer tablolar ile ilişkilerini içeren çoklu foreign key'lere sahip olabilir.

-- PostgreSQL'de, foreign key kısıtlaması kullanarak bir foreign key oluşturulabilir. Foreign key kısıtlaması, child ve parent tabloları arasındaki verilerin referans bütünlüğünün korunmasına yardımcı olur.
-- Bir foreign key kısıtlaması, child tablosundaki kolon veya kolonlar grubunun içindeki değerlerin ,parent tablosundaki kolon veya kolonlar grubunun içindeki değerlere eşit olduğunu gösterir.

FOREIGN KEY KISITLAMASI SYNTAX'I:

[constraint fk_name]
	foreign key(fk_columns)
	references parent_table(parent_key_columns)
	[on delete delete_action]
	[on update update_action]
	
-- bu syntax'da;
-- İlk olarak ; constraint anahtar kelimesinden sonra foreign key'e verilen özel bir isim vardır. constraint opsiyoneldir. Eğer bu kısmı çıkarırsak, PostgreSQL otomatik oluşturulan bir isim atayacaktır.
-- İkinci olarak ; forign key anahtar kelimesinden sonra, parantezler içerisinde bir veya birden fazla foreign key kolonu belirtilir.
-- Üçüncü olarak ; references yan tümcesindeki foreign key kolonları tarafından başvurulan , parent tablo ve parent key kolonları belirtilir.
-- Son olarak ; on delete ve on update kelimelerinde delete ve update aksiyonları belirtilir.

--delete ve update aksiyonları ;  parent tablodaki primary key silinip güncellendiği zaman; foreign key'in davranışlarını belirler. Primary key nadir olarak güncellendiğinden, on update  aksiyonu pratikte sıklıkla kullanılmaz. Biz on delete aksiyonuna odaklanacağız.

--PostgreSQL'in desteklediği aksiyonlar:
SET NULL
SET DEFAULT
RESTRICT
NO ACTION
CASCADE

FOREIGN KEY ÖRNEKLERİ : 

drop table if exists customers -- exists: subquery'de kayıt olup olmadığını kontrol eder , eğer kayıt varsa true değeri döndürür.

drop table if exists contacts;

create table customers(
	customer_id int generated always as identity,
	customer_name varchar(255) not null,
	primary key (customer_id)
);
create table contacts(
	contact_id int generated always as identity,
	customer_id int,
	contact_name varchar(255) not null,
	phone varchar(15),
	email varchar(100),
	primary key (contact_id),
	constraint fk_customer
		foreign key (customer_id)
		references customers(customer_id)
);

-- Bu örnekte customers tablosu; parent tablo , contacts tablosu child tablodur.

-- her bir müşteri 0 veya birden fazla  contacts'a sahipken,her bir contact'ın 0 veya 1 müşterisi olabilir.

-- contacts tablosundaki customer_id kolonu ;tablonun foreign key kolonudur ve referans aldığı customers tablosundaki primary key kolonu ile aynı ada sahiptir.


NO ACTION : 

-- customers ve contacts tablosuna veri eklemesi yapılır.

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'DavidWright','(408)-222-1234','david.wright@dolphin.dev');
      
-- customers tablosundaki id değeri 1 olan veriyi silmek istersek;

DELETE FROM customers
WHERE customer_id = 1;

ERROR:  update or delete on table "customers" violates foreign key constraint "fk_customer" on table "contacts"
DETAIL:  Key (customer_id)=(1) is still referenced from table "contacts".
SQL state: 23503
-- bu şekilde bir hata alırız.

-- Çünkü; ON DELETE NO ACTION , PostgreSQL id değeri 1 olan müşterinin contacts tablosunda hala mevcut olması nedeniyle bir kısıtlama ihlali verir.


RESTRICT : 

-- NO ACTION ile benzer yapıdadır. Fark yalnızca  foreign key kısıtlamasını; INITIALLY DEFERRED veya INITIALLY IMMEDIATE mode ile DEFERRABLE olarak tanımladığımızda oluşur.


SET NULL :

-- Parent tablodaki başvurulan satır silindiğinde , child tablodaki referans alınan satırın foreign key kolonlarına otomatik olarak null değer atanmasını sağlar.

-- on delete için set null atanan bir örnek yapalım:

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE SET NULL
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');

-- customers tablosundaki id değeri 1 olan veriyi silmek istersek;

DELETE FROM customers
WHERE customer_id = 1;

-- bu işlem sonucunda; contacts tablosundaki referans alınan satırlara null değer atanır, çünkü on delete set null aksiyonunu kullandık.


CASCADE : 

-- on delete cascade aksiyonu ; parent tablodan referans alınan satır silindiğinde otomatik olarak child tablodaki tüm referans içeren satırları siler.
-- on delete cascade; pratikte en yaygın kullanılan seçenektir.

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE CASCADE
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
      
      
-- customers tablosundaki id değeri 1 olan veriyi silmek istersek;

DELETE FROM customers
WHERE customer_id = 1;

-- bu işlem sonucunda ; contacts tablosundaki referans alınan satırların hepsi otomatik olarak silinir. Çünkü ON DELETE CASCADE kullandık.


SET DEFAULT: 

--on delete set default ; parent tablodaki referans alınan satırlar silindiği zaman, child tablonun referans içeren satırındaki foreign key kolonu default bir değer olarak atanır.


MEVCUT TABLOYA FOREIGN KEY KISITLAMASI EKLEME:

-- alter table ile ekleyebiliriz.

ALTER TABLE child_table 
ADD CONSTRAINT constraint_name 
FOREIGN KEY (fk_columns) 
REFERENCES parent_table (parent_key_columns);

MEVCUT FOREIGN KEY İÇEREN TABLOYA ON DELETE CASCADE EKLEME:

-- ilk olarak, mevcut foreign key kısıtlaması silinir:

ALTER TABLE child_table
DROP CONSTRAINT constraint_fkey;

-- sonrasında, on delete cascade aksiyonuna sahip yeni bir foreign key kısıtlaması oluşturulur:

alter table child_table
add constraint constraint_fk
foreign key (fk_columns)
references parent_table(parent_key_columns)
on delete cascade;
