-- QUERIES

ALTER TABLE MO_OKUL
DROP COLUMN FK_OGRT_ID;


ALTER TABLE MO_OGRETMEN ADD FK_OKUL_ID int ;


ALTER TABLE MO_OGRETMEN ADD
FOREIGN KEY (FK_OKUL_ID) REFERENCES MO_OKUL(OKUL_ID);


ALTER TABLE MO_OGRENCI ADD FK_OKUL_ID int;


ALTER TABLE MO_OGRENCI ADD
FOREIGN KEY (FK_OKUL_ID) REFERENCES MO_OKUL(OKUL_ID);


ALTER TABLE MO_SINIF
DROP COLUMN SUBE_AD;


ALTER TABLE MO_SINIF
DROP COLUMN SINIF_NUMARASI;


ALTER TABLE MO_SINIF
DROP CONSTRAINT MO_SINIF_FK_OGRT_ID_FKEY ;


CREATE TABLE MO_SINIF_NUMARASI(SINIF_NUMARASI_ID serial PRIMARY KEY NOT NULL,
																																SINIF_NUMARASI_AD int NOT NULL);

CREATE TABLE MO_SUBE(SUBE_ID serial PRIMARY KEY NOT NULL,SUBE_AD VARCHAR(1) NOT NULL,FK_SINIF_NUMARASI_ID int);

ALTER TABLE MO_SUBE ADD
FOREIGN KEY (FK_SINIF_NUMARASI_ID) REFERENCES MO_SINIF_NUMARASI(SINIF_NUMARASI_ID);




ALTER TABLE MO_SINIF ADD COLUMN FK_SINIF_SUBE int;


ALTER TABLE MO_SINIF RENAME COLUMN FK_SINIF_SUBE TO FK_SUBE_ID;


ALTER TABLE MO_SINIF ADD
FOREIGN KEY (FK_SUBE_ID) REFERENCES MO_SUBE(SUBE_ID);


INSERT INTO MO_SINIF_NUMARASI(SINIF_NUMARASI_AD)
VALUES (9);


INSERT INTO MO_SINIF_NUMARASI(SINIF_NUMARASI_AD)
VALUES (10);


INSERT INTO MO_SINIF_NUMARASI(SINIF_NUMARASI_AD)
VALUES (11);


INSERT INTO MO_SINIF_NUMARASI(SINIF_NUMARASI_AD)
VALUES (12);


ALTER TABLE MO_SUBE
DROP COLUMN FK_SINIF_NUMARASI_ID;


ALTER TABLE MO_SINIF
DROP COLUMN FK_SUBE_ID;


CREATE TABLE MO_SINIF_SUBE (SINIF_SUBE_ID serial PRIMARY KEY NOT NULL,
							FK_SINIF_NUMARASI_ID int,
							FK_SUBE_ID int);

ALTER TABLE MO_SINIF_SUBE ADD
FOREIGN KEY (FK_SINIF_NUMARASI_ID) REFERENCES MO_SINIF_NUMARASI(SINIF_NUMARASI_ID);

ALTER TABLE MO_SINIF_SUBE ADD
FOREIGN KEY (FK_SUBE_ID) REFERENCES MO_SUBE(SUBE_ID);
 



insert into mo_sube (sube_ad) values ('A');
insert into mo_sube (sube_ad) values ('B');
insert into mo_sube (sube_ad) values ('C');
insert into mo_sube (sube_ad) values ('D');
insert into mo_sube (sube_ad) values ('E');

select * from mo_sinif;
select * from mo_sube;
select * from mo_sinif_numarasi;
select * from mo_sinif_sube;

insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(1,6);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(2,6);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(3,7);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(4,9);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(1,8);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(2,7);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(3,6);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(4,7);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(1,8);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(2,9);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(3,9);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(4,8);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(2,7);
insert into mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id) values(1,7);


select * from mo_okul;

create table mo_ders_ogrenci(
	ders_ogrenci_id serial primary key not null,
	fk_ders_id int not null ,
	fk_ogrenci_id int not null
);

alter table mo_ders_ogrenci add foreign key(fk_ders_id) references mo_ders(ders_id);
alter table mo_ders_ogrenci add foreign key(fk_ogrenci_id) references mo_ogrenci(ogr_id);

alter table mo_ders drop column fk_ogr_id;
alter table mo_ders drop column fk_sinif_id;

create table mo_ders_sinif(
	ders_sinif_id serial primary key not null,
	fk_ders_id int not null,
	fk_sinif_id int not null
);

ALTER TABLE MO_DERS_SINIF ADD
FOREIGN KEY (FK_DERS_ID) REFERENCES MO_DERS(DERS_ID);


ALTER TABLE MO_DERS_SINIF ADD
FOREIGN KEY (FK_SINIF_ID) REFERENCES MO_SINIF(SINIF_ID);

select * from mo_ders_sinif;

insert into mo_sinif(fk_ogrt_id) values(1);
insert into mo_sinif(fk_ogrt_id) values(1);
insert into mo_sinif(fk_ogrt_id) values(3);
insert into mo_sinif(fk_ogrt_id) values(6);
insert into mo_sinif(fk_ogrt_id) values(5);
insert into mo_sinif(fk_ogrt_id) values(2);
insert into mo_sinif(fk_ogrt_id) values(4);

insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (8,1);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (8,2);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (9,1);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (9,3);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (9,5);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (10,3);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (10,5);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (10,6);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (11,1);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (11,2);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (11,3);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (11,7);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (11,5);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (12,1);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (12,7);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (12,8);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (13,8);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (13,7);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (13,6);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (13,3);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (14,1);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (14,7);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (14,8);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (14,3);
insert into mo_ders_sinif(fk_ders_id,fk_sinif_id) values (14,1);

create unique index idx_mo_ders_ogrenci on mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id);


insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (14,1);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (8,1);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (8,4);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (8,2);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (8,3);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (8,5);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (8,6);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (9,1);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (9,3);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (9,4);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (9,5);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (10,1);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (10,6);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (10,5);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (11,1);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (11,2);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (11,3);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (11,4);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (11,5);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (11,6);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (12,1);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (12,5);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (12,4);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (13,2);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (13,3);
insert into mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id) values (13,4);

create unique index idx_mo_ders_sinif on mo_ders_sinif(fk_ders_id,fk_sinif_id);

insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Eren',5,5);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Eda',6,4);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Gülsen',7,3);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Ebru',8,1);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Dilara',8,1);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Yağız',8,2);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Kerem',7,5);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Oğuz',6,3);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Oğuzhan',6,4);
insert into mo_ogrenci(ogr_ad,fk_sinif_id,fk_okul_id) values('Buket',2,4);

create unique index idx_mo_ogretmen on mo_ogretmen(ogrt_ad,fk_ders_id);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Sena Şen',13,5);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Ahmet Kandemir',14,5);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Hakan Çevik',12,5);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Beyza Erkuran',11,4);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Gizem Tüten',10,4);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Melike Öztürk',10,4);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Çağatay Vural',10,3);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Enes Yücel',9,3);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Melike Erdem',9,3);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Ege Arseven',9,2);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Nesrin Orhon',9,2);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Mazhar Işık',8,2);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Ercan Yiğit',8,1);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Yağmur Demir',9,1);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Cemile Sezer',10,1);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Murat Kaya',11,4);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Yiğit Atik',13,5);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Yıldız Güler',14,3);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Can Bilgiç',12,2);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Seda Kaya',11,5);
insert into mo_ogretmen(ogrt_ad,fk_ders_id,fk_okul_id) values ('Berk Akyol',11,4);

create unique index idx_mo_sinif_sube on mo_sinif_sube (fk_sinif_numarasi_id,fk_sube_id);

alter table mo_sinif add fk_sinif_sube int;
alter table mo_sinif add foreign key (fk_sinif_sube) references mo_sinif_sube (sinif_sube_id);
create unique index idx_mo_sinif on mo_sinif (fk_ogrt_id,fk_sinif_sube);


create table mo_ogrt_ogr_ders (
	ogrt_ogr_id serial primary key not null,
	fk_ogrt_id int not null,
	fk_ogr_id int not null
);

alter table mo_ogrt_ogr
add foreign key (fk_ogrt_id) references mo_ogretmen(ogrt_id);

alter table mo_ogrt_ogr add foreign key (fk_ogr_id) references mo_ogrenci(ogr_id);
create unique index idx_mo_ogrt_ogr on mo_ogrt_ogr(fk_ogrt_id,fk_ogr_id);


-- Bir öğretmenin verdiği derslerin; adını, kaç saat ders verdiğini,
-- öğretmenin adını, ders verdiği sınıfların şubesini ve sınıf numarasını veren sorgu:
SELECT DERS_AD,
	OGRT_AD,
	DERS_SAAT,
	sube_ad,
	sinif_numarasi_ad
FROM MO_OGRETMEN AS OGRT
INNER JOIN MO_DERS AS DERS ON OGRT.FK_DERS_ID = DERS.DERS_ID
inner join mo_sinif as sinif on sinif.fk_ogrt_id = ogrt.ogrt_id 
inner join mo_sinif_sube as ss on ss.sinif_sube_id = sinif.fk_sinif_sube
inner join mo_sube as sube on sube.sube_id = ss.fk_sube_id
inner join mo_sinif_numarasi as numara on numara.sinif_numarasi_id = ss.fk_sinif_numarasi_id
GROUP BY DERS_AD,
	OGRT_AD,
	DERS_SAAT,
	sube_ad,
	sinif_numarasi_ad;
	
 
select ogrt_ad,sube_ad,sinif_numarasi_ad from mo_sinif inner join mo_ogretmen on mo_ogretmen.ogrt_id = mo_sinif.fk_ogrt_id 
inner join mo_sinif_sube as ss on ss.sinif_sube_id = mo_sinif.fk_sinif_sube
inner join mo_sube as sube on sube.sube_id = ss.fk_sube_id
inner join mo_sinif_numarasi as numara on ss.fk_sinif_numarasi_id= numara.sinif_numarasi_id;



select  sinif_numarasi_ad,sube_ad from mo_sinif_sube as sinif_sube inner join mo_sinif_numarasi as numara on numara.sinif_numarasi_id= sinif_sube.fk_sinif_numarasi_id
inner join mo_sube as sube on sube.sube_id =sinif_sube.fk_sube_id order by sinif_numarasi_ad desc;


-- bir öğretmenin toplam kaç saat ders verdiğini gösteren sorgu:
select ogrt_ad,sum(ders_saat) from mo_ogretmen as ogrt inner join mo_ders as ders on ogrt.fk_ders_id = ders.ders_id
group by ogrt_ad order by sum(ders_saat) desc;

-- öğrencilerin aldığı dersleri, bu dersi veren öğretmenleri ve bu dersi alan öğrencileri listeleyen sorgu:
select ogr_ad,ogrt_ad,ders_ad from mo_ogrenci as ogr inner join mo_ders_ogrenci as od on od.fk_ogrenci_id = ogr.ogr_id
left join mo_ders as ders on ders.ders_id = od.fk_ders_id 
inner join mo_ogrt_ogr as oo on oo.fk_ogr_id = ogr.ogr_id
inner join mo_ogretmen as ogrt on oo.fk_ogrt_id= ogrt.ogrt_id;

-- Hasan isimli öğrencinin aldığı dersleri , bu dersleri veren ve adı Güngör Şireci olan öğretmenleri listeleyen sorgu.
select ogr_ad ,ogrt_ad,ders_ad from mo_ogrenci as ogr inner join mo_ders_ogrenci as od on od.fk_ogrenci_id = ogr.ogr_id
inner join mo_ders as ders on ders.ders_id = od.fk_ders_id
inner join mo_ogrt_ogr as oo on oo.fk_ogr_id = ogr.ogr_id
inner join mo_ogretmen as ogrt on oo.fk_ogrt_id= ogrt.ogrt_id
where ogr_ad = 'Hasan' and ogrt_ad='Güngör Şireci';

-- Çağrı adlı öğrencinin aldığı dersin adını, sayısını , dersi hangi öğretmenden aldığını ve toplam ders saat sayısını veren sorgu.
select ders_ad , count(ders_ad),sum(ders_saat) , ogrt_ad from  mo_ogrenci as ogr
inner join mo_ders_ogrenci as od on od.fk_ogrenci_id= ogr. ogr_id
inner join mo_ders as ders on ders.ders_id = od.fk_ders_id
inner join mo_ogretmen as ogrt on ogrt.fk_ders_id = ders.ders_id
group by ogr_ad,ders_ad,ogrt_ad  having ogr_ad='Çağrı';

-- Bir öğretmenin, içinde e harfi geçen, ders saat'i 3 den büyük olan hangi dersleri verdiğini ve bu derslerin sayısını ders_saat'i azalan şekilde listeleyen sorgu.
select ogrt_ad,ders_ad,ders_saat ,count(ders_ad) from mo_ogretmen as o inner join mo_ders as d on o.fk_ders_id=  d.ders_id
group by ogrt_ad,ders_ad,ders_saat having ders_ad like '%e%' and ders_saat>3 
order by ders_saat desc ;