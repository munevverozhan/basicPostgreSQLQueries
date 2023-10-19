create table mo_okul(
	okul_id serial primary key not null,
	okul_ad varchar (30) not null,
	fk_ogrt_id int 
);

create table mo_sinif(
	sinif_id serial primary key not null,
	sube_ad varchar(1) not null,
	sinif_numarasi int not null,
	fk_ogrt_id int 
);

create table mo_ders(
	ders_id serial primary key not null,
	ders_ad varchar(30) not null,
	ders_saat int not null,
	fk_ogr_id int,
	fk_sinif_id int 
);

create table mo_ogretmen(
	ogrt_id serial primary key not null,
	ogrt_ad varchar(50) not null,
	fk_ders_id int 
);

create table mo_ogrenci(
	ogr_id serial primary key not null,
	ogr_ad varchar(50) not null,
	fk_sinif_id int
);

insert into mo_okul (okul_ad) values ('Malatya Anadolu Lisesi');
insert into mo_okul (okul_ad) values ('Yusuf Kenan Anadolu Lisesi');
insert into mo_okul (okul_ad) values ('Beydağı Anadolu Lisesi');
insert into mo_okul (okul_ad) values ('Cumhuriyet Anadolu Lisesi');
insert into mo_okul (okul_ad) values ('Fatih Fen Lisesi');

insert into mo_sinif (sube_ad,sinif_numarasi) values ('A',10);
insert into mo_sinif (sube_ad,sinif_numarasi) values ('A',9);
insert into mo_sinif (sube_ad,sinif_numarasi) values ('A',11);
insert into mo_sinif (sube_ad,sinif_numarasi) values ('D',10);
insert into mo_sinif (sube_ad,sinif_numarasi) values ('E',12);

insert into mo_ders (ders_ad,ders_saat) values ('Matematik',6);
insert into mo_ders (ders_ad,ders_saat) values ('Fizik',4);
insert into mo_ders (ders_ad,ders_saat) values ('Edebiyat',5);
insert into mo_ders (ders_ad,ders_saat) values ('Kimya',5);
insert into mo_ders (ders_ad,ders_saat) values ('Biyoloji',6);
insert into mo_ders (ders_ad,ders_saat) values ('Beden Eğitimi',2);
insert into mo_ders (ders_ad,ders_saat) values ('Felsefe',3);

insert into mo_ogretmen (ogrt_ad) values ('Bilal Geleri');
insert into mo_ogretmen (ogrt_ad) values ('Güngör Şireci');
insert into mo_ogretmen (ogrt_ad) values ('Ahmet Dilaver');
insert into mo_ogretmen (ogrt_ad) values ('Başak Eken');
insert into mo_ogretmen (ogrt_ad) values ('Osman Şahin');
insert into mo_ogretmen (ogrt_ad) values ('Emre Ergün');

insert into mo_ogrenci (ogr_ad) values ('Hasan');
insert into mo_ogrenci (ogr_ad) values ('Çağrı');
insert into mo_ogrenci (ogr_ad) values ('Yağmur');
insert into mo_ogrenci (ogr_ad) values ('Nesrin');
insert into mo_ogrenci (ogr_ad) values ('Nuri');
insert into mo_ogrenci (ogr_ad) values ('Mert');


ALTER TABLE MO_OKUL ADD
FOREIGN KEY (FK_OGRT_ID) REFERENCES MO_OGRETMEN(OGRT_ID) ON
DELETE CASCADE;

ALTER TABLE MO_SINIF ADD
FOREIGN KEY (FK_OGRT_ID) REFERENCES MO_OGRETMEN(OGRT_ID) ON
DELETE CASCADE;

ALTER TABLE MO_DERS ADD
FOREIGN KEY (FK_OGR_ID) REFERENCES MO_OGRENCI(OGR_ID) ON
DELETE CASCADE;

ALTER TABLE MO_DERS ADD
FOREIGN KEY (FK_SINIF_ID) REFERENCES MO_OGRETMEN(OGRT_ID) ON
DELETE CASCADE;

ALTER TABLE MO_OGRETMEN ADD
FOREIGN KEY (FK_DERS_ID) REFERENCES MO_DERS(DERS_ID) ON
DELETE CASCADE;

ALTER TABLE MO_OGRENCI ADD
FOREIGN KEY (FK_SINIF_ID) REFERENCES MO_SINIF(SINIF_ID) ON
DELETE CASCADE;