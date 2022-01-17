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

--2
CREATE TABLE MsKelurahan(
	IdKelurahan CHAR(5) NOT NULL,
	NmKelurahan VARCHAR(55),
	NmLurah VARCHAR(55),
	IdKecamatan CHAR(5) NOT NULL,
	NmaPerwakilan VARCHAR(55),
	PRIMARY KEY (IdKelurahan),
	FOREIGN KEY (IdKecamatan) REFERENCES MsKecamatan(IdKecamatan)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_Kelurahan CHECK (
        IdKelurahan LIKE'KL[0-9][0-9][0-9]'
	),
)

--3
CREATE TABLE MsKurir(
    IdKurir CHAR(5) NOT NULL,
    Nama VARCHAR(55),
    Gender VARCHAR(10),
    PRIMARY KEY (IdKurir),
    CONSTRAINT CHK_Kurir CHECK (
        IdKurir LIKE 'KU[0-9][0-9][0-9]' AND
        Gender IN ('Male', 'Female')
    ),
)

--4
CREATE TABLE MsAgen(
	IdAgen CHAR(5) NOT NULL,
	NmAgen VARCHAR(55),
	PRIMARY KEY (IdAgen),
	CONSTRAINT CHK_Agen CHECK (
        IdAgen LIKE 'AG[0-9][0-9][0-9]'
    )
)

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

--6
CREATE TABLE MsTipeBansos (
	IdTipeBansos CHAR(5) NOT NULL,
	JnsBansos VARCHAR(55)  -- Tunai/NonTunai
	PRIMARY KEY(IdTipeBansos),
	CONSTRAINT CHK_TipeBansos CHECK (
		IdTipeBansos LIKE 'TB[0-9][0-9][0-9]'
	)
)

--7
CREATE TABLE MsBansos (
	IdBansos CHAR(5) NOT NULL,
	NmBansos VARCHAR(55)
	PRIMARY KEY(IdBansos),
	CONSTRAINT CHK_Bansos CHECK (
		IdBansos LIKE 'BS[0-9][0-9][0-9]'
	)
)

--8
CREATE TABLE MsPemerintah (
	IdPemerintah CHAR(5) NOT NULL,
	NmPemerintah VARCHAR(55),
	PRIMARY KEY (IdPemerintah),
	CONSTRAINT CHK_Pemerintah CHECK (
		IdPemerintah LIKE 'PM[0-9][0-9][0-9]'
	)
)

--9
CREATE TABLE MsPengiriman (
	IdPengiriman CHAR(5) NOT NULL,
	IdPemerintah CHAR(5) NOT NULL,
	IdKecamatan CHAR(5) NOT NULL,
	IdEkspedisi CHAR(5) NOT NULL,
	IdBansos CHAR(5) NOT NULL,
	TtlBansos NUMERIC(11,2),
	TglPengiriman DATE,
    Ongkir NUMERIC(11,2)
	PRIMARY KEY (IdPengiriman),
	FOREIGN KEY (IdPemerintah) REFERENCES MsPemerintah(IdPemerintah)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdKecamatan) REFERENCES MsKecamatan(IdKecamatan)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdEkspedisi) REFERENCES MsEkspedisi(IdEkspedisi)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdBansos) REFERENCES MsBansos(IdBansos)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_Pengiriman CHECK (
		IdPengiriman LIKE 'PM[0-9][0-9][0-9]'
	)
)