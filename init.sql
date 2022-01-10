CREATE DATABASE test;
USE test;
DROP DATABASE testt;

CREATE TABLE Pempu(
    IdPusat CHAR(6) NOT NULL,
    NamaPempus VARCHAR(255) NOT NULL,
    Gender CHAR(10),
    Alamat VARCHAR(255),
    Phone VARCHAR(12),
    PRIMARY KEY (IdPusat),
    CONSTRAINT CekIdPusat CHECK (
        IdPusat IN (
            'PU[0-9][0-9][0-9][0-9]'
        )
    ),
    CONSTRAINT CekGenPusat CHECK (
        Gender IN (
            'Laki','Perempuan'
        )
    )
);

CREATE TABLE Pemda(
    IdPemda CHAR(6) NOT NULL,
    NamaPemda VARCHAR(255) NOT NULL,
    Gender CHAR(10),
    Alamat VARCHAR(255),
    Phone VARCHAR(12),
    PRIMARY KEY (IdPemda),
    CONSTRAINT CekIdDaerah CHECK (
        IdPemda IN (
            'PD[0-9][0-9][0-9][0-9]'
        )
    ),
    CONSTRAINT CekGenDaerah CHECK (
        Gender IN (
            'Laki','Perempuan'
        )
    )
);

CREATE TABLE Masyarakat(
    IdMasya CHAR(6) NOT NULL,
    Nama VARCHAR(255),
    Gender CHAR(10),
    Alamat VARCHAR(255),
    Phone VARCHAR(12),
    PRIMARY KEY (IdMasya),
    CONSTRAINT CekIdMasya CHECK (
        IdMasya IN(
            'MS[0-9][0-9][0-9][0-9]'
        )
    ),
        CONSTRAINT CekGenMasya CHECK (
        Gender IN (
            'Laki','Perempuan'
        )
    )
);

CREATE TABLE DBKecamatan(
    IdKecamatan CHAR(6) NOT NULL,
    IdMasyarakat CHAR(6) NOT NULL,
    Kecamatan VARCHAR(225) NOT NULL,
    PRIMARY KEY (IdKecamatan),
    FOREIGN KEY (IdMasyarakat)
        REFERENCES Masyarakat(IdMasya) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE TipeBansos(
    IdBansos CHAR(6) NOT NULL,
    JenisBansos VARCHAR(255) NOT NULL,
    JumlahBansos INT,
    PRIMARY KEY(IdBansos),
    CONSTRAINT CekIdBansos CHECK(
        IdBansos IN(
            'TB[0-9][0-9][0-9][0-9]'
        )
    ),
    CONSTRAINT CekJenis CHECK(
        JenisBansos IN(
            'NonTunai','Tunai'
        )
    )
);

CREATE TABLE Kurir(
    IdKurir CHAR(6) NOT NULL,
    Nama VARCHAR(255),
    Alamat VARCHAR(255),
    Gender VARCHAR(255),
    Usia VARCHAR(100),
    PRIMARY KEY (IdKurir),
    CONSTRAINT CekIdKurir CHECK (
        IdKurir IN(
            'KU[0-9][0-9][0-9][0-9]'
        )
    ),
    CONSTRAINT CekGenKurir CHECK (
        Gender IN (
            'Laki','Perempuan'
        )
    )
);

CREATE TABLE Bank(
    IdBank CHAR(6) NOT NULL,
    IdPempu CHAR(6) NOT NULL,
    IdPemda CHAR(6) NOT NULL,
    IdPenerima CHAR(6) NOT NULL,
    IdBansos CHAR(6) NOT NULL,
    NamaBank VARCHAR(255),
    Transaksi DATE,
    PRIMARY KEY (IdBank),
    FOREIGN KEY (IdPempu) 
        REFERENCES Pempu(IdPusat) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPemda)
        REFERENCES Pemda(IdPemda) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPenerima)
        REFERENCES Masyarakat(IdMasya) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdBansos)
        REFERENCES TipeBansos(IdBansos) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekIdBank CHECK(
        IdBank IN(
            'BK[0-9][0-9][0-9][0-9]'
        )
    )
); 

CREATE TABLE Ekspedisi(
    IdEkspedisi CHAR(6) NOT NULL,
    IdPempu CHAR(6) NOT NULL,
    IdPemda CHAR(6) NOT NULL,
    IdKurir CHAR(6) NOT NULL,
    IdPenerima CHAR(6) NOT NULL,
    IdBansos CHAR(6) NOT NULL,
    Harga INT NOT NULL,
    JenisBarang VARCHAR(255),
    TanggalPengiriman DATE,
    IdDestinasi VARCHAR(255) NOT NULL,
    PRIMARY KEY (IdEkspedisi),
    FOREIGN KEY (IdPempu)
        REFERENCES Pempu(IdPusat) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPemda)
        REFERENCES Pemda(IdPemda) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPenerima)
        REFERENCES Masyarakat(IdMasya) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdBansos)
        REFERENCES TipeBansos(IdBansos) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekIdEkspedisi CHECK (
        IdEkspedisi IN (
            'EX[0-9][0-9][0-9][0-9]'
        )
    )
);






