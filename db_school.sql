create unique index idx_fk_sinif_sube on mo_sinif(fk_sinif_sube);

CREATE TABLE MO_GUNLER(GUN_ID serial  PRIMARY KEY NOT NULL,
					  gun_ad varchar(15) not null);
create table mo_ders_gun(
	ders_gun_id serial primary key not null,
	fk_ders_id int not null,
	fk_gun_id int not null
);

alter table mo_ders_gun add foreign key(fk_ders_id) references mo_ders(ders_id);
alter table mo_ders_gun add foreign key (fk_gun_id) references mo_gunler(gun_id); 

insert into mo_gunler(gun_ad) values('Pazartesi');
insert into mo_gunler(gun_ad) values('Salı');
insert into mo_gunler(gun_ad) values('Çarşamba');
insert into mo_gunler(gun_ad) values('Perşembe');
insert into mo_gunler(gun_ad) values('Cuma');

CREATE TABLE MO_DERS_OGRETMEN_SINIF(
	DERS_OGRETMEN_SINIF_ID serial PRIMARY KEY NOT NULL,
	fk_ogretmen_id int not null,
	fk_ders_id int not null,
	fk_sinif_id int not null
);

alter table mo_ders_ogretmen_sinif add foreign key (fk_ogretmen_id) references mo_ogretmen(ogrt_id);
alter table mo_ders_ogretmen_sinif add foreign key (fk_ders_id) references mo_ders(ders_id);
alter table mo_ders_ogretmen_sinif add foreign key (fk_sinif_id) references mo_sinif(sinif_id);

create unique index idx_ogrt_ders on mo_ders_ogretmen_sinif(fk_ogretmen_id,fk_ders_id);
create unique index idx_sinif_ders on mo_ders_ogretmen_sinif(fk_sinif_id,fk_ders_id);


create unique index idx_ogrt_sinif_ders on mo_ders_ogretmen_sinif(fk_sinif_id,fk_ogretmen_id,fk_ders_id);

insert into mo_ders_ogretmen_sinif(fk_ogretmen_id,fk_ders_id,fk_sinif_id) values(7,12,1);
insert into mo_ders_ogretmen_sinif(fk_ogretmen_id,fk_ders_id,fk_sinif_id) values(7,11,1);

alter table mo_ders_ogrenci add fk_gun_id int;
alter table mo_ders_ogrenci add foreign key (fk_gun_id) references mo_gunler(gun_id);


select ogrt_ad,ders_ad,ogr_ad from mo_ders_ogretmen_sinif as dos 
inner join mo_ogretmen as ogrt on ogrt.ogrt_id = dos.fk_ogretmen_id
inner join mo_ders as d on d.ders_id = dos.fk_ders_id
inner join mo_ders_ogrenci as od on od.fk_ogrenci_id =  ;

select ders_ad, ogrt_ad, sinif_numarasi_ad, sube_ad from mo_ogretmen as ogrt
inner join mo_sinif as s on s.fk_ogrt_id = ogrt.ogrt_id 
inner join mo_sinif_sube as ss on ss.sinif_sube_id = s.fk_sinif_sube
inner join mo_sinif_numarasi as sn on sn.sinif_numarasi_id = ss.fk_sinif_numarasi_id
inner join mo_sube as sube on sube.sube_id=ss.fk_sube_id
inner join mo_ders as d on d.ders_id = ogrt.fk_ders_id

alter table mo_ders_ogrenci add fk_ders_ogrt_sinif_id int;
alter table mo_ders_ogrenci add foreign key (ogretmen_id) references mo_ogretmen(ogrt_id);
alter table mo_ders_ogrenci add foreign key (fk_ders_ogrt_sinif_id) references mo_ders_ogretmen_sinif(ders_ogretmen_sinif_id);
alter table mo_ders_ogrenci rename sinif_id  to fk_sinif_id;
alter table mo_ders_ogrenci rename ogretmen_id  to fk_ogretmen_id;
alter table mo_ders_ogrenci add ders_id int;
alter table mo_ders_ogrenci rename ders_id  to fk_ders_id;

alter table mo_ders_ogrenci add foreign key (ders_id) references mo_ders(ders_id);
alter table mo_ders_ogrenci add foreign key (fk_ogretmen_id) references mo_ogretmen(ogrt_id);
alter table mo_ders_ogrenci add foreign key (fk_sinif_id) references mo_sinif(sinif_id);

create unique index idx_ders_sinif on  mo_ders_ogrenci(fk_ders_id,fk_sinif_id); 
create unique index idx_ders_ogrenci on  mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id); 
create unique index idx_ders_ogrenci_sinif on  mo_ders_ogrenci(fk_ders_id,fk_ogrenci_id,fk_sinif_id);
create unique index idx_ogrt on  mo_ders_ogrenci(fk_ogretmen_id); 
create unique index idx_fk_sinif_sube on  mo_sinif(fk_sinif_sube); 
create unique index idx_fk_sinif_ders on  mo_ders_ogrenci(fk_sinif_id,fk_ders_id); 
create unique index idx_ogretmen on  mo_ders_ogretmen_sinif(fk_ogretmen_id); 

create unique index idx_ogrenci_gun_ders on  mo_ders_ogrenci(fk_gun_id,fk_ogrenci_id,fk_ders_ogrt_sinif_id); 

create view mo_ogrenci_ders_programi_v as
select ogr_ad, ders_ad, ders_saat, ogrt_ad, gun_ad , sinif_numarasi_ad, sube_ad
from mo_ders_ogrenci as od
inner join mo_ogrenci as o on o.ogr_id = od.fk_ogrenci_id
inner join mo_ders_ogretmen_sinif as ods on ods.ders_ogretmen_sinif_id = od.fk_ders_ogrt_sinif_id
inner join mo_ders as d on d.ders_id = ods.fk_ders_id
inner join mo_ogretmen as ogrt on ogrt.ogrt_id = ods.fk_ogretmen_id
inner join mo_sinif as s on s.sinif_id = ods.fk_sinif_id
inner join mo_sinif_sube as ss on ss.sinif_sube_id = s.fk_sinif_sube
inner join mo_sinif_numarasi as sn on sn.sinif_numarasi_id = ss.fk_sinif_numarasi_id
inner join mo_sube as sube on sube.sube_id=ss.fk_sube_id
inner join mo_gunler as g  on g.gun_id = od.fk_gun_id;

select ders_ad,ogr_ad,ders_saat from mo_ogrenci_ders_programi_v;
select * from mo_ogrenci_ders_programi_v where ogr_ad= 'Nesrin';
select sum(ders_saat), ogr_ad from mo_ogrenci_ders_programi_v where ders_ad='Edebiyat' group by ogr_ad;

select sum(ders_saat) , ogrt_ad,ders_ad from mo_ogrenci_ders_programi_v group by ogrt_Ad,ders_ad;
select * from mo_ogrenci_ders_programi_v;


create materialized view mo_ogrenci_ders_programi_mv as
select ogr_ad, ders_ad, ders_saat, ogrt_ad, gun_ad , sinif_numarasi_ad, sube_ad
from mo_ders_ogrenci as od
inner join mo_ogrenci as o on o.ogr_id = od.fk_ogrenci_id
inner join mo_ders_ogretmen_sinif as ods on ods.ders_ogretmen_sinif_id = od.fk_ders_ogrt_sinif_id
inner join mo_ders as d on d.ders_id = ods.fk_ders_id
inner join mo_ogretmen as ogrt on ogrt.ogrt_id = ods.fk_ogretmen_id
inner join mo_sinif as s on s.sinif_id = ods.fk_sinif_id
inner join mo_sinif_sube as ss on ss.sinif_sube_id = s.fk_sinif_sube
inner join mo_sinif_numarasi as sn on sn.sinif_numarasi_id = ss.fk_sinif_numarasi_id
inner join mo_sube as sube on sube.sube_id=ss.fk_sube_id
inner join mo_gunler as g  on g.gun_id = od.fk_gun_id;

select * from mo_ogrenci_ders_programi_mv where ogr_ad='Hasan';
refresh materialized view mo_ogrenci_ders_programi_mv ;
