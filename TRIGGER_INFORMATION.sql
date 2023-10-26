TRIGGER 

-- Bir PostgreSQL trigger'ı , tabloyla ilişkili bir olay meydana geldiğinde otomatik olarak çağrılan bir fonksiyondur. Bu olaylar INSERT, UPDATE, DELETE veya TRUNCATE olabilir.

-- Trigger, bir tablo ile ilişkilendirilmiş kullanıcı tanımlı özel bir  fonksiyondur. Yeni bir trigger oluşturmak için önce bir trigger fonksiyonu tanımlamalı ve ardından bu trigger fonksiyonunu bir tablo ile ilişkilendirmeliyiz.
																																																								
-- Trigger fonksiyonu ve kullanıcı tanımlı fonksiyon arasındaki fark, trigger'ın tetikleyici olayı gerçekleştiğinde otomatik olarak yürütülmesidir.

-- PostgreSQL iki ana trigger türü sağlar:

-- Satır düzeyi triggerlar: Trigger, her satır için bir kez çağrılır.
-- İfade düzeyi triggerlar: Trigger, ifade tamamlandığında bir kez çağrılır.
-- İki tür arasındaki farklar, Trigger kaç kez çağrıldığı ve hangi zamanda çağrıldığıdır.

-- Örneğin, 20 satırı değiştiren bir UPDATE ifadesi yayınlarsanız, satır düzeyi trigger 20 kez çağrılırken, ifade düzeyi trigger 1 kez çağrılır.

-- Trigger'ın bir olaydan önce mi yoksa sonra mı çağrıldığını belirtebilirsiniz. Trigger bir olaydan önce çağrılırsa, geçerli satır için işlemi atlayabilir hatta güncelleştirilen veya eklenen satırı değiştirebilir. Trigger bir olaydan sonra çağrılırsa, tüm değişiklikler trigger tarafından kullanılabilir.

Triggerlar Ne Zaman Kullanılır ?

-- Triggerlar, veritabanına çeşitli uygulamalar tarafından erişildiğinde ve tablonun verileri her değiştirildiğinde otomatik olarak çalışan veritabanı içindeki çapraz işlevleri korumak istediğinizde kullanışlıdır. Örneğin, uygulamanın INSERT veya UDPATE gibi her olayı kontrol edecek mantığa sahip olmasını gerektirmeden veri geçmişini tutmak istiyorsanız.

-- Ayrıca, veritabanı düzeyi dışında başka yerde uygulanamayan karmaşık veri bütünlüğü kurallarını korumak için triggerlar kullanabilir. Örneğin müşteri tablosuna yeni bir satır eklendiğinde banka ve kredi tablolarında da başka satırların oluşturulması gerekir.

-- Trigger kullanmanın temel dezavantajı, veriler değiştiğinde etkileri anlamak için trigger'ın var olduğunu bilmeniz ve mantığını anlamanız gerektiğidir.


PostgreSQL'de  Trigger Oluşturma :

-- PostgreSQL'de yeni bir trigger oluşturmak için 2 adım bulunur ;

-- İlk olarak, CREATE FUNCTION ifadesi ile bir trigger fonksiyonu oluşturulur.
-- İkinci olarak, trigger fonksiyonu CREATE TRIGGER ifadesi kullanılarak bir tablo ile ilişkilendirilir.

Create Trigger Fonksiyonu'nun Syntax'ı :

-- Bir trigger fonksiyonu , bir normal kullanıcı tanımlı fonksiyon ile benzerdir. Fakat, bir trigger fonksiyonu , hiç argüman almaz ve return değeri'nin tipi trigger'dır.

CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   -- trigger logic
END;
$$

-- Bir trigger fonksiyonu, çağırdığı ortam hakkındaki verileri, bir dizi yerel değişken içeren TriggerData adı verilen özel bir yapı aracılığıyla alır.
-- Örneğin , OLD ve NEW  tablodaki satırın trigger olayından önceki ve sonraki durumlarını temsil eder.
-- PostgreSQL ayrıca ,TG_WHEN ve TG_TABLE_NAME gibi önünde TG_ kullanan diğer yerel değişkenleri de sağlar .

-- Trigger fonksiyonu bir kez tanımlandığında, INSERT, UPDATE, ve DELETE gibi bir veya daha fazla trigger olayı ile ilişkilendirilebilir.

PostgreSQL'de CREATE TRIGGER İfadesi :

-- CREATE TRIGGER ifadesi , yeni bir trigger oluşturur.
-- Syntax'ı ;

CREATE TRIGGER trigger_name 
   {BEFORE | AFTER} { event }
   ON table_name
   [FOR [EACH] { ROW | STATEMENT }]
       EXECUTE PROCEDURE trigger_function
       
-- Bu syntax'da ;
-- İlk olarak, TRIGGER ifadesinden sonra trigger adı belirtilir.
-- İkinci olarak, trigger'ın tetikleneceği zaman belirtilir. Bir olayın tetikleneceği zaman BEFORE veya AFTER olabilir.
-- Üçüncü olarak, trigger'ı başlatan olay belirtilir. Bu olay INSERT , DELETE, UPDATE veya TRUNCATE olabilir.
-- Dördüncü olarak, ON anahtar kelimesinden sonra trigger ile ilişkilendirilen tablonun adı belirtilir.
-- Beşinci olarak ,  triggerların hangi tipte olabileceği  belirtilir . Bunlar ;
-- * Satır düzeyinde trigger FOR EACH ROW kelimesi ile tanımlanır.
-- * İfade düzeyinde trigger FOR EACH STATEMENT kelimesi ile tanımlanır.

-- Satır düzeyinde triggerlar her bir satır için tetiklenirken,  bir ifade düzeyindeki trigger her bir işlem için tetiklenir.

-- Son olarak, EXECUTE PROCEDURE anahtar kelimesinden sonra trigger fonksiyonu'nun ismi tanımlanır.


PostgreSQL'de Trigger Oluşturma Örnekleri ':

-- employees isimli bir tablo oluşturalım:

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);

-- Bir çalışanın ismi değiştiğinde değişiklikleri employee_audits isimli ayrı  bir tabloda tutmak istediğimizi varsayalım :

CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);

-- log_last_name_changes isimli bir fonksiyon oluşturalım :

CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$

-- Bir çalışanın last name değeri  değiştiği zamanı,  Fonksiyon last name'in eski değerini , employee id,last name ve değişme zamanı  değerlerini içeren employee_audits tabosunun içerisine ekler.

-- OLD güncellemeden önceki satırı temsil ederken , NEW güncellenecek yeni satırı temsil eder. OLD.last_name last name'in güncellemeden önceki halini return ederken NEW.last_name last name'in yeni  değerini return eder.

-- İkinci olarak , trigger fonksiyonu employees tablosu ile ilişkilendirilir. Trigger adı last_name_changes'dir. last_name kolonu'nun değeri güncellenmeden önce , trigger fonksiyonu otomatik olarak değişiklikleri log'lamak için çağırılır.

CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();
  
  
PostgreSQL'de DROP TRIGGER İfadesi ':

-- Bir trigger'ı tablodan silmek için, DROP TRIGGER ifadesi kullanılır.

DROP TRIGGER [IF EXISTS] trigger_name 
ON table_name [ CASCADE | RESTRICT ];

-- Bu syntax'da ;
-- İlk olarak DROP TRIGGER anahtar kelimesinden sonra silmek istenen trigger'ın ismi belirtilir.
-- İkinci olarak, IF EXISTS  yalnızca trigger'ın var olma koşuluna bağlı olarak silme işlemi için kullanılır.IF EXISTS ifadesini belirtmeden var olmayan bir trigger'ı silme girişimi hatayla sonuçlanır. Mevcut olmayan bir trigger'ı silmek için IF EXISTS kullanırsanız PostgreSQL bunun yerine bir hata döndürür.
-- Üçüncü olarak , trigger'ın hangi tabloya ait olduğu belirtilir. Tablo belirli bir şemaya aitse tablonun şema nitelikli adını kullanabilirsiniz; örneğin şema_adı.tablo_adı.
-- Dördüncü olarak, trigger ile ilişkili objelerin otomatik olarak silinmesi istenirse CASCADE seçeneği kullanılır.
-- Beşinci olarak, eğer herhangi bir obje trigger ile ilişkili ise silmeyi reddetmek için RESTRICT seçeneğini kullanırız. DROP TRIGGER  default olarak , RESTRICT ifadesini kullanır.

Örneğin : 

CREATE FUNCTION check_staff_user()
    RETURNS TRIGGER
AS $$
BEGIN
    IF length(NEW.username) < 8 OR NEW.username IS NULL THEN
        RAISE EXCEPTION 'The username cannot be less than 8 characters';
    END IF;
    IF NEW.NAME IS NULL THEN
        RAISE EXCEPTION 'Username cannot be NULL';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER username_check 
    BEFORE INSERT OR UPDATE
ON staff
FOR EACH ROW 
    EXECUTE PROCEDURE check_staff_user();


DROP TRIGGER username_check
ON staff;


PostgreSQL'de Alter Trigger İfadesi ':

-- ALTER TRIGGER ifadesi ile trigger yeniden adlandırılabilir. 

ALTER TRIGGER trigger_name
ON table_name 
RENAME TO new_trigger_name;

-- Bu syntax'da ;
-- İlk olarak , ALTER TRIGGER anahtar kelimesinden sonra yeniden adlandırılmak istenen trigger'ın adı belirtilir.
-- İkinci olarak , ON anahtar kelimesinden sonra trigger ile ilişkili olan tablonun adı belirtilir.
-- Üçüncü olarak, RENAME TO anahtar kelimesinden sonra trigger'ın yeni isim değeri belirtilir.

-- Örneğin: 

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
   employee_id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   salary decimal(11,2) not null default 0,
   PRIMARY KEY(employee_id)
);

CREATE OR REPLACE FUNCTION check_salary()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL  
  AS
$$
BEGIN
	IF (NEW.salary - OLD.salary) / OLD.salary >= 1 THEN
		RAISE 'The salary increment cannot that high.';
	END IF;

	RETURN NEW;
END;
$$

CREATE TRIGGER before_update_salary
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE check_salary();
  
INSERT INTO employees(first_name, last_name, salary)
VALUES('John','Doe',100000);

UPDATE employees
SET salary = 200000
WHERE employee_id = 1;

ERROR:  The salary increment cannot that high.
CONTEXT:  PL/pgSQL function check_salary() line 4 at RAISE
SQL state: P0001

ALTER TRIGGER before_update_salary
ON employees
RENAME TO salary_before_update;
