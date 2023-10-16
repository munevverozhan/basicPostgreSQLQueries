create database dbUrun;
create table musteri(
	id integer primary key not null ,
	ad varchar(15)  not null,
	soyad varchar (10) not null,
	sehir text,
	bakiye integer
);
create table urun(
	id integer primary key not null,
	ad varchar(15) not null,
	marka varchar(20),
	stok integer,
	kategori varchar(15)
);
create table kategori(
	id integer primary key not null,
	ad text
);
