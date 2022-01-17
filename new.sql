CREATE DATABASE NEKO

use NEKO

CREATE TABLE Pemerintah(
    IdPemerintah CHAR(6) NOT NULL,
    NamaPemerintah VARCHAR(255) NOT NULL,
    Gender VARCHAR(10),
    Alamat VARCHAR(255),
    NoHp VARCHAR(12),
    PRIMARY KEY(IdPemerintah),
    CONSTRAINT CekPemerinah CHECK (
        IdPemerintah LIKE (
            'PH[0-9][0-9][0-9]'
        )AND(
            Gender IN (
                'Male','Female'
            )
        )
    )
)

CREATE TABLE Penerima(
    IdPenerima CHAR(6) NOT NULL,
    NamaPerwakilan VARCHAR(255),
    Gender CHAR(10),
    Alamat VARCHAR(255),
    IdCamat CHAR(6) NOT NULL,
    Phone VARCHAR(12)
    PRIMARY KEY(IdPenerima),
    FOREIGN KEY (IdCamat)
        REFERENCES Kecamatan(IdKecamatan) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekPenerima CHECK(
        IdPenerima LIKE(
            'PN[0-9][0-9][0-9]'
        )AND(
            Gender IN (
                'Male','Female'
            )
        )
    )
)

CREATE TABLE Kecamatan(
    IdKecamatan CHAR(6) NOT NULL,
    NamaCamat VARCHAR(255),
    IdPerwakilan CHAR(6) NOT NULL,
    Kecamatan VARCHAR(255)
    PRIMARY KEY (IdKecamatan),
    CONSTRAINT CekCamat CHECK(
        IdKecamatan LIKE(
            'KC[0-9][0-9][0-9]'
        )
    )
)

ALTER TABLE Kecamatan
ADD FOREIGN KEY (IdPerwakilan)REFERENCES Penerima(IdPenerima) 



CREATE TABLE Kurir(
    IdKurir CHAR(6) NOT NULL,
    Nama VARCHAR(255),
    Alamat VARCHAR(255),
    Gender VARCHAR(255),
    Usia INT,
    PRIMARY KEY (IdKurir),
    CONSTRAINT Chk_Kurir CHECK (
        IdKurir LIKE(
            'KU[0-9][0-9][0-9]'
        ) AND
        Gender IN (
            'Male','Female'
        )
    ),
);

CREATE TABLE Bank(
    IdBank CHAR(6) NOT NULL,
    IdPemerintah CHAR(6) NOT NULL,
    IdPenerima CHAR(6) NOT NULL,
    JumlahUang VARCHAR(255),
    NamaBank VARCHAR(255)
    PRIMARY KEY(IdBank),
    FOREIGN KEY(IdPemerintah)
        REFERENCES Pemerintah(IdPemerintah) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPenerima)
        REFERENCES Penerima(IdPenerima) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekBank CHECK(
        IdBank LIKE (
            'BK[0-9][0-9][0-9]'
        )
    )
)

DROP TABle Pengiriman

CREATE TABLE TransaksiBank(
    IdTransaksiBank CHAR(6) NOT NULL,
    IdBank CHAR(6) NOT NULL,
    Tanggal DATE
    PRIMARY KEY (IdTransaksiBank),
    FOREIGN KEY (IdTransaksiBank)
        REFERENCES Bank(IdBank) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekTransacBank CHECK(
        IdTransaksiBank LIKE 'TB[0-9][0-9][0-9]'
    )
)

CREATE TABLE Ekspedisi(
    IdEkspedisi CHAR(6) NOT NULL,
    Agen VARCHAR(255),
	PRIMARY KEY(IdEkspedisi),
    CONSTRAINT CekEkspedisi CHECK (
        IdEkspedisi LIKE 'EK[0-9][0-9][0-9]'
    )
)

CREATE TABLE Pengiriman (
	IdPengiriman CHAR(6) NOT NULL,
    IdPemerintah CHAR(6) NOT NULL,
	IdPenerima CHAR(6) NOT NULL,
	IdKurir CHAR(6) NOT NULL,
    JenisPengiriman VARCHAR(255),
    Ongkir NUMERIC(11,2),
    IdEkspedisi CHAR(6) NOT NULL
	PRIMARY KEY (IdPengiriman),
    FOREIGN KEY (IdPenerima)
        REFERENCES Penerima(IdPenerima) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdKurir)
        REFERENCES Kurir(IdKurir) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdEkspedisi)
        REFERENCES Ekspedisi(IdEkspedisi) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPemerintah)
        REFERENCES Pemerintah(IdPemerintah) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_Pengiriman CHECK (
		IdPengiriman LIKE 'PM[0-9][0-9][0-9]'
	)
)

CREATE TABLE TransaksiPengiriman(
    IdTransaksiPengiriman CHAR(6) NOT NULL,
    IdPengiriman CHAR(6) NOT NULL,
    Tanggal DATE
    PRIMARY KEY(IdTransaksiPengiriman),
    FOREIGN KEY (IdPengiriman)
        REFERENCES Pengiriman(IdPengiriman) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekTransakPeng CHECK (
        IdTransaksiPengiriman LIKE 'TP[0-9][0-9][0-9]'
    )
)

CREATE TABLE TotalBansos(
    IdTotal CHAR(6) NOT NULL,
    IdTransaksiPengiriman CHAR(6) NOT NULL,
    IdTransaksiBank CHAR(6) NOT NULL,
    IdKecamatan CHAR(6) NOT NULL
    PRIMARY KEY (IdTotal),
    FOREIGN KEY (IdTransaksiPengiriman)
        REFERENCES TransaksiPengiriman(IdTransaksiPengiriman),
    FOREIGN KEY(IdTransaksiBank)
        REFERENCES TransaksiBank(IdTransaksiBank),
    FOREIGN KEY (IdKecamatan)
        REFERENCES Kecamatan(IdKecamatan),
    CONSTRAINT cekTotal CHECK (
        IdTotal LIKE 'TO[0-9][0-9][0-9]'
    )
)