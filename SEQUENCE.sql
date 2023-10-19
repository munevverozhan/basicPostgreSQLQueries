SEQUENCE : 

-- Tanım olarak bir dizi , integer değerlerin sıralı listesidir. 
-- Dizideki integer değerlerin sırası önemlidir. Örneğin, {1,2,3,4,5} ve {5,4,3,2,1} tamamen farklı dizilerdir.
-- PostgreSQL'deki bir dizi, belirtilen spesifikasyona dayalı olarak bir tamsayı dizisi üreten, kullanıcı tanımlı, şemaya bağlı bir nesnedir.

--Postgresql'de bir dizi oluşturmak için, 'create sequence' ifadesini kullanırız .


POSTGRESQL'DE DİZİ OLUŞTURMA :

İfade :

create sequence [ if not exists ] sequence_name
	[ AS {smallint | int | bigint }]
	[ INCREMENT [ by ] increment ] -- artış
	[ MINVALUE minvalue | NO MINVALUE ]
	[ MAXVALUE maxvalue | NO MAXVALUE ]
	[ START [with] start ]
	[ CACHE cache]
	[ [NO] CYCLE ]
	[ OWNED BY { table_name.column_name | NONE } ]
	

sequence_name :

--Diziye CREATE SEQUENCE cümleciğinden sonra özel bir ad verilir. if not exists , yalnızca böyle bir dizi olmaması şartına bağlı olarak yeni bir dizi oluşturur.

-- Dizi adı , aynı şema içindeki diğer dizilerden,tablolardan,indexlerden, viewlerden veya foreign tablolardan farklı olmak zorundadır.

[ AS {smallint | int | bigint }]:
 
 -- Dizinin veri tipini belirtir. Veri tipi ; smallint, int ve bigint'dir. Eğer bu satır atlanırsa , veri tipi Default olarak bigint olur.
 -- Veri tipi , dizi'nin max ve min değer aralığını belirler.
 
 
 [ INCREMENT [ by ] increment ] :
 
 --Increment (artış), yeni değer oluşturmak için , anlık diziye hangi değerin ekleneceğini belirtir.
 
 -- bir pozitif sayı, bir artan dizi oluştururken , bir negatif 
 sayı bir azalan dizi oluşturur.
 
 -- default artış değeri 1'dir.
 

[ MINVALUE minvalue | NO MINVALUE ]
[ MAXVALUE maxvalue | NO MAXVALUE ]

-- dizinin max. ve min. değerleri tanımlanır. NO MINVALUE ve NO MAXVALUE kullanırsak, dizi default değer kullanacaktır.

-- bir artan dizi için , max. default değeri, dizinin veri tipinin max. değeridir ve default min. değeri 1 dir.

-- bir azalan dizide, max. default değer -1'dir ve min. default değeri, dizinin veri tipinin min. değeridir.


[ START [ WITH ] start ]

-- start cümleciği dizinin başlangıç değerini belirtir.
-- artan dizinin default başlangıç değeri , minvalue'dur ve azalan dizi için bu değer maxvalue'dur.


cache

--cache, daha hızlı erişim için  kaç sayı dizisi'nin  önceden tahsis edileceğini ve memory içinde saklanacağını belirler.
Bir seferde bir değer oluşturulabilir.

--Varsayılan olarak dizi her seferinde bir değer üretir; yani önbellek yoktur.


CYCLE | NO CYCLE

-- cycle, eğer limite ulaşılmış ise değerin tekarar başalatılmasına izin verir. Sonraki sayı artan dizinin min. değeri olacaktır ve azalan dizi için max. değeri olacaktır.

-- eğer no cycle kullanılırsa, limite ulaşıldığında, sıradaki değer almaya çalışmak bir error verir.

--  cycle veya no cycle açıkça belirtilmediği zaman no cycle default olarak verilir.


OWNED BY table_name.column_name

-- owned by cümleciği , tablo kolonunu dizi ile  ilişkilendirmeye izin verir böylece kolon veya tablo silindiği zaman , PostgreSQL otomatik olarak ortak diziyi siler.

--NOT:Bir tablonun bir sütunu için SERIAL sözde türünü kullandığınızda, perde arkasında PostgreSQL'in otomatik olarak sütunla ilişkili bir sıra oluşturduğunu unutmayın.


PostgreSQL CREATE SEQUENCE örnekleri:

1)Bir Artan Dizi oluşturma örneği:

-- başlangıç değeri 100 , artış değeri 5 olan yeni bir artan dizi oluştururken CREATE SEQUENCE ifadesini kullanırız. 

CREATE SEQUENCE mysequence
INCREMENT 5
START 100;

-- dizinin sonraki elemanını almak için nextval() fonksiyonunu kullanırız.

SELECT nextval('mysequence'); -- sonuç 100'dür.

-- bu ifadeyi tekrar yürüttüğümüzde , dizinin sonraki değerini alırız.

SELECT nextval('mysequence'); -- sonuç:105'dir.


2)Bir Azalan Dizi oluşturma örneği:

CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 3
CYCLE;
 
-- aşağıdaki kodu birden fazla kez yürüttüğümüzde, sayının 3,2,1 den başlayıp 3,2,1'e kadar devam ettiğini görürüz.

SELECT nextval('three'); 


3) Bir tablo kolonu ile işkili bir dizi oluşturma:

-- İlk olarak, order_details adında bir tablo oluşturduk.

CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);

-- İkinci olarak, order_details tablosundaki item_id kolonu ile ilişkili yeni bir dizi oluşturduk.

CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;

-- Üçüncü olarak, order_details tablosuna 3 adet veri girişi yaptık.

INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);
    
-- nextval() fonksiyonunu, order_item_id dizisinden item id değerini çekmek için kullanırız.


-- Dördüncü olarak , order_details tablosundaki verilerin sorgusunu yazarız:

SELECT
    order_id,
    item_id,
    item_text,
    price
FROM
    order_details;        


-- DATABASE'DEKİ TÜM DİZİLERİN LİSTELENMESİ:
 
-- mevcut database içindeki tüm dizileri listelemek için kullanılan sorgu ;

SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';


DİZİLERİN SİLİNMESİ :

-- Eğer bir dizi; bir tablo kolonu ile ilişkili ise, tablo kolonu veya tablo siliniğinde, otomatik olarak silinecektir.

-- Ayrıca manuel olarak silmek için DROP SEQUENCE ifadesi kullanılabilir.

DROP SEQUENCE [ IF EXISTS ] sequence_name [, ...] 
[ CASCADE | RESTRICT ];

-- Yukardaki dizi silme syntx'ında :

-- Öncelikli olarak, silmek istediğimiz tablonun adı belirtilir. IF EXISTS ifadesi sayesinde dizinin olma şartına bağlı olarak silme işlemi yapılır. Bir kerede çoklu silme işlemi yapılmak istendiğinde, virgülle ayrılmış dizi isim listesi kullanılabilir.
-- Sonrasında kullanılan CASCADE ifadesi, diziye bağlı olan objelerin ve bağımlı nesnelere bağlı olan nesnelerin vb. tekrarlı silinmesi istendiğinde kullanılır.

PostgreSQL DROP SEQUENCE ifadesi örneği;

-- order_details tablosunu sileceğiz.  order_item_id dizisi, order_details tablosundaki item_id ile ilişkili olduğundan, bu da otomatik olarak silinir.
DROP TABLE order_details; 
