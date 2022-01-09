--- 1
--- Pempus
---
CREATE TABLE Pemerintah_Pusat (
    Pempusid CHAR(6) NOT NULL,
    Nama VARCHAR(MAX),
    JenisKelamin CHAR(255),
    Alamat VARCHAR(MAX),
    Phone VARCHAR(MAX),
    PRIMARY KEY (Pempusid),
    CONSTRAINT CekGen CHECK (
        JenisKelamin IN (
            'Laki','Perempuan'
        )
    ),
    CONSTRAINT Cekid CHECK (
        Pempusid IN (
            'PU[0-9][0-9][0-9][0-9]'
        )
    )
);
--- 2
--- Pemda
---
CREATE TABLE Pemerintah_Daerah (
    Pemdaid CHAR(6) NOT NULL,
    Nama VARCHAR(MAX),
    JenisKelamin CHAR(255),
    Daerah VARCHAR(MAX),
    Alamat VARCHAR(MAX),
    Phone VARCHAR(MAX),
    PRIMARY KEY (Pemdaid),
    CONSTRAINT CekGen CHECK (
        JenisKelamin IN (
            'Laki','Perempuan'
        )
    ),
    CONSTRAINT Cekid CHECK (
        Pemdaid IN (
            'PD[0-9][0-9][0-9][0-9]'
        )
    )
);

--- 3
--- Penerima
---
CREATE TABLE Penerima_Bansos (
    IdNama CHAR(6) NOT NULL,
    Nama   VARCHAR(MAX),
    Email  VARCHAR(MAX),
    Usia   CHAR(255),
    Daerah VARCHAR(MAX) NOT NULL,
    PRIMARY KEY(IdNama,Daerah),
    CONSTRAINT Cekid CHECK (
        IdNama IN (
            'PB[0-9][0-9][0-9][0-9]'
        )
    ),
    CONSTRAINT CekEmail CHECK (
        Email IN (
            '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'
        )
    )
);
--- 4
--- Data Ekspedisi 
---
CREATE TABLE Ekspedisi (
    IdKurir CHAR(6) NOT NULL,
    JenisPaket VARCHAR(MAX) NOT NULL,
    Harga INT NOT NULL,
    IdDestinasi CHAR(6) NOT NULL,
    PRIMARY KEY (IdKurir),
    FOREIGN KEY (IdDestinasi) REFERENCES Penerima_Bansos(Daerah) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Cekid CHECK (
        IdKurir IN (
            'EK[0-9][0-9][0-9][0-9]'
        )
    )
)
--- 5
--- Bank
--- 
CREATE TABLE Bank (
    IdBank CHAR(6) NOT NULL,
    NamaBank VARCHAR(MAX),
    PRIMARY KEY (IdBank),
    FOREIGN KEY (IdBank) REFERENCES Pemerintah_Pusat(Pempusid) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdBank) REFERENCES Pemerintah_Daerah(Pemdaid) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Cekid CHECK (
        IdBank IN (
            'BN[0-9][0-9][0-9][0-9]'
        )
    )
)
--- 6
--- Jenis Kurir
---
CREATE TABLE Kurir (
    IdKurir CHAR(6) NOT NULL,
    Nama CHAR(255),
    Alamat VARCHAR(MAX),
    JenisKelamin VARCHAR(MAX),
    Usia VARCHAR(MAX),
    PRIMARY KEY (Nama),
    CONSTRAINT Cekid CHECK (
        IdKurir IN (
            'KU[0-9][0-9][0-9][0-9]'
        )
    )
)