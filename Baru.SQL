USE Test

--1
CREATE TABLE MsKecamatan(
    IdKecamatan CHAR(5) NOT NULL,
	NmKecamatan VARCHAR(55),
    NmCamat VARCHAR(55),
    PRIMARY KEY (IdKecamatan),
    CONSTRAINT CHK_Kecamatan CHECK (
        IdKecamatan LIKE'KC[0-9][0-9][0-9]'
	),
)

INSERT INTO MsKecamatan(IdKecamatan, NmKecamatan, NmCamat)
VALUES ('KC001', 'Merah', 'Bayu'),
('KC002', 'Biru', 'Ernes'),
('KC003', 'Putih', 'Valen'),
('KC004','Taman','Neko'),
('KC005','Waru','Surati'),
('KC006','Pokcan','Suratno'),
('KC007','Sidorjo','Suratan'),
('KC008','KedungTuri','Ratna'),
('KC009','Pakis','Sari'),
('KC0010','Panjang','Rastu')

--2
CREATE TABLE MsKelurahan(
	IdKelurahan CHAR(5) NOT NULL,
	NmKelurahan VARCHAR(55),
	NmLurah VARCHAR(55),
	IdKecamatan CHAR(5) NOT NULL,
	JmlhPerwakilan VARCHAR(55),
	PRIMARY KEY (IdKelurahan),
	FOREIGN KEY (IdKecamatan) REFERENCES MsKecamatan(IdKecamatan)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_Kelurahan CHECK (
        IdKelurahan LIKE'KL[0-9][0-9][0-9]'
	),
)

INSERT INTO MsKelurahan(IdKelurahan, NmKelurahan, NmLurah, IdKecamatan, JmlhPerwakilan)
VALUES ('KL001', 'Melati', 'Budi', 'KC001', '500'),
('KL002', 'Mawar', 'Ilum', 'KC001', '350'),
('KL003', 'Sepatu', 'Anton', 'KC001', '750'),
('KL004', 'Matahari', 'Harti', 'KC002', '340'),
('KL005', 'Kemuning', 'Kinan', 'KC002', '400'),
('KL006', 'Anggrek', 'Arta', 'KC002', '250'),
('KL007', 'Alamanda', 'Bona', 'KC002', '460'),
('KL008', 'Kenanga', 'Jiyan', 'KC003', '340'),
('KL009', 'Asoka', 'Kiri', 'KC003', '650'),
('KL010', 'Tapei', 'Kanan', 'KC003', '650')


--3
CREATE TABLE MsKurir(
    IdKurir CHAR(5) NOT NULL,
    NmKurir VARCHAR(55),
    GndrKurir VARCHAR(10),
    PRIMARY KEY (IdKurir),
    CONSTRAINT CHK_Kurir CHECK (
        IdKurir LIKE 'KU[0-9][0-9][0-9]' AND
        GndrKurir IN ('Laki-laki', 'Perempuan')
    ),
)

INSERT INTO MsKurir(IdKurir, NmKurir, GndrKurir)
VALUES ('KU001', 'Sawachi', 'Laki-laki'),
('KU002', 'Utoni', 'Laki-laki'),
('KU003', 'Titran', 'Perempuan'),
('KU004', 'Emfryon', 'Laki-laki'),
('KU005', 'Livego', 'Perempuan'),
('KU006', 'Ensiro', 'Perempuan'),
('KU007', 'Tuvena', 'Laki-laki'),
('KU008', 'Deightchi', 'Laki-laki'),
('KU009', 'Senikyu', 'Laki-laki'),
('KU010', 'Setenju', 'Perempuan')

--4
CREATE TABLE MsAgen(
	IdAgen CHAR(5) NOT NULL,
	NmAgen VARCHAR(55),
	PRIMARY KEY (IdAgen),
	CONSTRAINT CHK_Agen CHECK (
        IdAgen LIKE 'AG[0-9][0-9][0-9]'
    )
)

INSERT INTO MsAgen(IdAgen, NmAgen) 
VALUES ('AG001', 'JNE'),
('AG002', 'JNT'),
('AG003', 'Grab'),
('AG004', 'Ninja Express'),
('AG005', 'POS Indonesia')

--5
CREATE TABLE MsEkspedisi(
    IdEkspedisi CHAR(5) NOT NULL,
	IdKurir CHAR(5) NOT NULL,
	IdAgen CHAR(5) NOT NULL,
	PRIMARY KEY(IdEkspedisi),
	FOREIGN KEY (IdKurir) REFERENCES MsKurir(IdKurir)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdAgen) REFERENCES MsAgen(IdAgen)
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CHK_Ekspedisi CHECK (
        IdEkspedisi LIKE 'EK[0-9][0-9][0-9]'
    )
)

INSERT INTO MsEkspedisi(IdEkspedisi, IdKurir, IdAgen)
VALUES ('EK001', 'KU001', 'AG001'),
('EK002', 'KU003', 'AG001'),
('EK003', 'KU008', 'AG002'),
('EK004', 'KU009', 'AG002'),
('EK005', 'KU005', 'AG003'),
('EK006', 'KU010', 'AG003'),
('EK007', 'KU002', 'AG004'),
('EK008', 'KU006', 'AG004'),
('EK009', 'KU004', 'AG005'),
('EK010', 'KU007', 'AG005')

--6
CREATE TABLE MsTipeBansos (
	IdTipeBansos CHAR(5) NOT NULL,
	JnsBansos VARCHAR(55)  -- Tunai/NonTunai
	PRIMARY KEY(IdTipeBansos),
	CONSTRAINT CHK_TipeBansos CHECK (
		IdTipeBansos LIKE 'TB[0-9][0-9][0-9]'
	)
)

INSERT INTO MsTipeBansos(IdTipeBansos, JnsBansos)
VALUES ('TB001', 'Tunai'),
('TB002', 'Non-Tunai')

--7
CREATE TABLE MsBansos (
	IdBansos CHAR(5) NOT NULL,
	IdTipeBansos CHAR(5) NOT NULL,
	NmBansos VARCHAR(55)
	PRIMARY KEY(IdBansos),
	FOREIGN KEY (IdTipeBansos) REFERENCES MsTipeBansos(IdTipeBansos)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_Bansos CHECK (
		IdBansos LIKE 'BS[0-9][0-9][0-9]'
	)
)

INSERT INTO MsBansos(IdBansos, IdTipeBansos, NmBansos)
VALUES ('BS001', 'TB001', 'Uang lembar'),
('BS002', 'TB001', 'Uang keping'),
('BS003', 'TB002', 'Pakaian'),
('BS004', 'TB002', 'Beras'),
('BS005', 'TB002', 'Gula'),
('BS006', 'TB002', 'Tepung')

--8
CREATE TABLE MsPemerintah (
	IdPemerintah CHAR(5) NOT NULL,
	NmPemerintah VARCHAR(55),
	PRIMARY KEY (IdPemerintah),
	CONSTRAINT CHK_Pemerintah CHECK (
		IdPemerintah LIKE 'PM[0-9][0-9][0-9]'
	)
)

INSERT INTO MsPemerintah (IdPemerintah, NmPemerintah)
VALUES ('PM001', 'Joko Mi')

--9
CREATE TABLE MsPengiriman (
	IdPengiriman CHAR(5) NOT NULL,
	IdPemerintah CHAR(5) NOT NULL,
	IdKelurahan CHAR(5) NOT NULL,
	IdEkspedisi CHAR(5) NOT NULL,
	IdBansos CHAR(5) NOT NULL,
	TtlBansos NUMERIC(11,2),
    Ongkir NUMERIC(11,2),
	TglPengiriman DATE
	PRIMARY KEY (IdPengiriman),
	FOREIGN KEY (IdPemerintah) REFERENCES MsPemerintah(IdPemerintah)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdKelurahan) REFERENCES MsKelurahan(IdKelurahan)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdEkspedisi) REFERENCES MsEkspedisi(IdEkspedisi)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdBansos) REFERENCES MsBansos(IdBansos)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_Pengiriman CHECK (
		IdPengiriman LIKE 'PN[0-9][0-9][0-9]'
	)
)

INSERT INTO MsPengiriman (IdPengiriman, IdPemerintah, IdKelurahan, IdEkspedisi, IdBansos, TtlBansos, Ongkir, TglPengiriman)
VALUES ('PN001', 'PM001', 'KL005', 'EK003', 'BS001', '300000000', '2000000', '2019/1/16'),
('PN002', 'PM001', 'KL003', 'EK002', 'BS004', '100000000', '1500000', '2019/3/19'),
('PN003', 'PM001', 'KL001', 'EK003', 'BS001', '250000000', '2000000', '2020/4/4'),
('PN004', 'PM001', 'KL007', 'EK010', 'BS005', '150000000', '1200000', '2020/6/7'),
('PN005', 'PM001', 'KL004', 'EK007', 'BS003', '230000000', '1700000', '2020/8/28'),
('PN006', 'PM001', 'KL009', 'EK006', 'BS006', '200000000', '1800000', '2021/9/1'),
('PN007', 'PM001', 'KL009', 'EK002', 'BS002', '20000000', '1800000', '2021/6/2'),
('PN007', 'PM001', 'KL009', 'EK002', 'BS002', '20000000', '1800000', '2021/6/2')