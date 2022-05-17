use surucu_kursu;

CREATE TABLE kan_grubu(
kan_grubu varchar(20) NOT NULL,
PRIMARY KEY(kan_grubu)
)

CREATE TABLE ehliyet_turleri(
ehliyet_turleri varchar(2) NOT NULL,
PRIMARY KEY(ehliyet_turleri)
)

CREATE TABLE ogrenim_durumu(
ogrenim_durumu varchar(20) NOT NULL,
PRIMARY KEY(ogrenim_durumu)
)

CREATE TABLE medeni_hal(
medeni_hal varchar(20) NOT NULL,   
PRIMARY KEY(medeni_hal)
)


CREATE TABLE borc(
adayid varchar(10),
kalan_borc INT,
son_odenen_tutar INT,
son_odeme_turu varchar(20),
kart_no varchar(16),
kart_sahibinin_adi varchar(45),
kart_sahibinin_soyad varchar(45),
cvv INT,
son_ay INT,
son_yil INT,
PRIMARY KEY(adayid)
)
CREATE TABLE nufus_bilgileri(
seri_no varchar(9) NOT NULL,
baba_adi varchar(45),
anne_adi varchar(45),
dogum_yeri varchar(45),
dogum_tarih DATE,
kan_grubu varchar(20),
PRIMARY KEY (seri_no),
medeni_hal varchar(20),
FOREIGN KEY (medeni_hal) REFERENCES medeni_hal(medeni_hal),
FOREIGN KEY (kan_grubu) REFERENCES kan_grubu(kan_grubu)
)
CREATE TABLE aday_bilgileri( 
adayid varchar(10),
seri_no varchar(9) NOT NULL,
tc varchar(11) NOT NULL,
ad varchar(20) NOT NULL,
soyad varchar(100) NOT NULL,
yas INT NOT NULL,
telefon varchar(10) NOT NULL,
saglik_raporu varchar(10) NOT NULL,
adli_belge varchar(10) NOT NULL,
kayit_tarihi DATE NOT NULL,
ehliyet_tur varchar(2) NOT NULL,
ogrenim_durumu varchar(20) NOT NULL,
sinav_tarihi DATE,
trafik_sinav_notu INT,
motor_sinav_notu INT,
FOREIGN KEY (adayid) REFERENCES borc(adayid),
FOREIGN KEY (ehliyet_tur) REFERENCES ehliyet_turleri(ehliyet_turleri),
FOREIGN KEY(ogrenim_durumu) REFERENCES ogrenim_durumu(ogrenim_durumu),
FOREIGN KEY(seri_no) REFERENCES nufus_bilgileri(seri_no),
PRIMARY KEY (tc)
)


CREATE TABLE personel_bilgileri(
per_tc varchar(11) NOT NULL,
per_ad varchar(45) NOT NULL,
per_soyad varchar(45) NOT NULL,
e_posta varchar(45) NOT NULL,
gorev varchar(45) NOT NULL,
adres varchar(300) NOT NULL,
telefon varchar(10) NOT NULL,
PRIMARY KEY (per_tc)
)

CREATE TABLE kullanici(
kullanici_adi varchar(10) NOT NULL,
sifre varchar(10) NOT NULL,
PRIMARY KEY(kullanici_adi)
)
