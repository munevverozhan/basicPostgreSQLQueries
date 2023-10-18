-- age: 2 tarih arasındaki farkı postgresql'in bize sunduğu formatta görüntüleyebilmektir. Fark genellikle; yıl-ay-gün bazında verilir.
-- ilk parametre timestamp , 2. parametre farkını almak istediğimiz tarih.
select age(TIMESTAMP '08-06-2000'); -- sonuç: "23 years 2 mons 12 days"

-- Tablo bazlı kullanım için;
select ad,tarih,age(now(),tarih) from mo_kitaplar;
