INDEXES 


INDEX:
-- Çeşitli aramaları hızlandırmak için tabloda saklanan veriler belirli bir sırayla düzenlenmelidir. Bunun için indexler kullanılır.

-- Tanım olarak bir index , index'i korumak için ek olarak yazma ve depolama maliyeti karşılığında, bir tablodan veri almayı hızlandıran ayrık bir veri yapısıdır.


PostgreSQL CREATE INDEX :

-- CREATE INDEX ifadesinin temel syntax'ı :

CREATE INDEX index_name ON table_name [USING method]
(
    column_name [ASC | DESC] [NULLS {FIRST | LAST }],
    ...
);

-- Bu syntaxta;
-- ilk olarak, CREATE INDEX ifadesinden sonra özel bir index ismi tanımlanır. index adı anlamlı ve kolay hatırlanabilir olmalıdır.
-- ikinci olarak, index'in ait olduğu tablo adı tanımlanır.
-- üçüncü olarak, btree, hash, gist, spgist, gin, ve brin gibi index methodları tanımlanır. PostgreSQL default olarak btree kullanır.
-- son olarak, bir veya daha fazla kolonun index'i listelenir. ASC ve DESC sıralama sırasını belirtir. Sıralama sırası default olarak ASC'dir.


-- Eğer bir kolon NULL içeriyorsa, NULLS FIRST veya NULLS LAST seçeneği belirlenebilir. 
-- DESC belirtildiğinde default değer NULLS FIRST iken, DESC belirtilmediğinde default değer NULLS LAST olur.

-- Bir sorgunun index kullanıp kullanmadığını sorgulamak için EXPLAIN ifadesi kullanılabilir.

EXPLAIN SELECT *
FROM address
WHERE phone = '223664661973';


UNIQUE INDEX : 

-- UNIQUE indexi, bir veya daha fazla kolon içindeki verilerin, benzersizliğini sağlar.
-- bir UNIQUE indexi oluşturmak için kullanılan syntax;

create unique index index_name 
on table_name(column_name, [...]);

-- NOT: Yalnızca B-tree indexleri , kesin bir unique index olabilir.

-- Bir kolon için bir unique index tanımlandığı zaman kolon, aynı değerlere sahip çoklu satırlar içeremez.

-- eğer 2 veya daha fazla kolon için bir unique index tanımlanacaksa,  bu kolondaki kombine veriler birden fazla satırda tekrar edemez.

-- PostgreSQL, NULL'ları farklı değerler olarak ele alır, bu nedenle UNIQUE indeksli bir sütunda birden fazla NULL değere sahip olabilirsiniz.

-- Bir tablo için bir primary key veya bir unique kısıtlama tanımlandığında, PostgreSQL otomatik olarak karşılık gelen bir unique index oluşturur.

-- UNIQUE index örnekleri :
-- employees adında bir tablo oluşturalım :

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

-- yukarıdaki ifadede employee_id primary key, email unique kısıtlamasıdır , öyleyse, PostgreSQL her bir kolon için 2 unique index oluşturur.


 UNIQUE index --single column örneği:
 
 -- employees tablosuna mobile_phone kolonunu ekleyelim;
 
ALTER TABLE employees
ADD mobile_phone VARCHAR(20);

-- telefon numarası tüm çalışanlar için belirginlik sağladığından,  mobile_phone kolonunu UNIQUE index olarak tanımlarız:

CREATE UNIQUE INDEX idx_employees_mobile_phone
ON employees(mobile_phone);


UNIQUE index – multiple columns örneği:

-- employees tablosuna, work_phone ve extension isimli 2 yeni kolon ekleme ifadesi ;

ALTER TABLE employees
ADD work_phone VARCHAR(20),
ADD extension VARCHAR(5);

-- Çoklu employeeslar aynı work phone numarasına sahip olabilirler. Bununla birlikte, aynı extension değerine sahip olamazlar. Bu kuralı uygulamak için , work_phone ve extension kolonlarının her ikisinde de unique index tanımlaması yapılmalıdır;

CREATE UNIQUE INDEX idx_employees_workphone
ON employees(work_phone, extension);
