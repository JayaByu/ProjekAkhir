CREATE DATABASE NW
GO 
USE NW
DROP DATABASE NEW

CREATE TABLE Pemerintah(
    IdPem CHAR(6) NOT NULL,
    Nama VARCHAR(225) NOT NULL,
    Gender VARCHAR(10),
    Alamat VARCHAR(225),
    NoHp VARCHAR(225)
    PRIMARY KEY(IdPem),
    CONSTRAINT CekPem CHECK(
        IdPem LIKE (
            'PM[0-9][0-9][0-9]'
        )AND 
        Gender IN (
            'Male','Female'
        )
    )
)
GO
CREATE TABLE Penerima(
    IdPenerima CHAR(6) NOT NULL,
    Nama VARCHAR(225),
    Gender VARCHAR(10),
    Alamat VARCHAR(225),
    NoHp VARCHAR(225)
    PRIMARY KEY (IdPenerima),
    CONSTRAINT CekPen CHECK(
        IdPenerima LIKE (
            'PN[0-9][0-9][0-9]'
        )AND 
        Gender IN (
            'Male','Female'
        )
    )
)
GO
CREATE TABLE Kecamatan(
    IdCamat CHAR(6) NOT NULL,
    IdPenerima CHAR(6) NOT NULL,
    Kecamatan VARCHAR(255) NOT NULL,
    PRIMARY KEY (IdCamat),
    FOREIGN KEY (IdPenerima)
        REFERENCES Penerima(IdPenerima) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekCamat CHECK (
        IdCamat LIKE(
            'KC[0-9][0-9][0-9]'
        )
    )
)
GO
CREATE TABLE Kurir(
    IdKurir CHAR(6) NOT NULL,
    Nama VARCHAR(225),
    Alamat VARCHAR(225),
    Gender VARCHAR(225),
    Usia INT,
    PRIMARY KEY(IdKurir),
    CONSTRAINT Chk_Kurir CHECK (
        IdKurir LIKE(
            'KU[0-9][0-9][0-9]'
    ) AND
        Gender IN (
            'Male','Female'
        )
    )
)
GO
CREATE TABLE Bansos(
    IdBansos CHAR(6) NOT NULL,
    IdPemerintah CHAR(6) NOT NULL,
    IdCamat CHAR(6) NOT NULL,
    TypeBansos VARCHAR(225),
    JumlahBansos VARCHAR(255),
    IdPenerima CHAR(6) NOT NULL,
    PRIMARY KEY(IdBansos),
    FOREIGN KEY (IdPenerima)
        REFERENCES Penerima(IdPenerima) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPemerintah)
        REFERENCES Pemerintah(IdPem) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekBansos CHECK (
        IdBansos LIKE(
            'BN[0-9][0-9][0-9]'
        )
    )
)
GO
CREATE TABLE Bank(
    IdBank CHAR(6) NOT NULL,
    IdBansos CHAR(6) NOT NULL,
    NamaBank VARCHAR(225),
    IdPenerima CHAR(6) NOT NULL
    PRIMARY KEY(IdBank),
    FOREIGN KEY (IdBansos)
        REFERENCES Bansos(IdBansos) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekBank CHECK (
        IdBank LIKE(
            'BK[0-9][0-9][0-9]'
        )
    )
)
GO
CREATE TABLE TransacBank(
    IdTransacBank CHAR(6) NOT NULL,
    IdBank CHAR(6) NOT NULL,
    Tanggal DATE
    PRIMARY KEY(IdTransacBank)
    FOREIGN KEY(IdBank)
        REFERENCES Bank(IdBank) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekTB CHECK (
        IdTransacBank LIKE(
            'TB[0-9][0-9][0-9]'
        )
    )
)
GO
CREATE TABLE Pengiriman(
    IdKirim CHAR(6) NOT NULL,
    IdBansos CHAR(6) NOT NULL,
    IdKurir CHAR(6) NOT NULL,
    IdPenerima CHAR(6) NOT NULL,
    Ongkir VARCHAR(255),
    PRIMARY KEY (IdKirim),
    FOREIGN KEY (IdBansos)
        REFERENCES Bansos(IdBansos) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdKurir)
        REFERENCES Kurir(IdKurir) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekPengirim CHECK (
        IdKirim LIKE (
            'PK[0-9][0-9][0-9]'
        )
    )
)
GO
CREATE TABLE TransacPengirim(
    IdTransacKirim CHAR(6) NOT NULL,
    IdPengiriman CHAR(6) NOT NULL,
    Tanggal DATE
    PRIMARY KEY(IdTransacKirim),
    FOREIGN KEY (IdPengiriman) 
    REFERENCES Pengiriman(IdKirim) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekTransac CHECK (
        IdTransacKirim LIKE (
            'TP[0-9][0-9][0-9]'
        )
    )
)