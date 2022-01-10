USE test;
--- 1
--- Pempus
---
CREATE TABLE Pemerintah_Pusat(
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
    CONSTRAINT CekGenPmda CHECK (
        JenisKelamin IN (
            'Laki','Perempuan'
        )
    ),
    CONSTRAINT CekidPemda CHECK (
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
    Daerah VARCHAR(255) NOT NULL,
    PRIMARY KEY(IdNama,Daerah),
    CONSTRAINT CekidPB CHECK (
        IdNama IN (
            'PB[0-9][0-9][0-9][0-9]'
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
    IdDestinasi VARCHAR(255) NOT NULL,
    PRIMARY KEY (IdKurir,IdDestinasi),
    FOREIGN KEY (IdDestinasi) REFERENCES Penerima_Bansos(Daerah) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Cekid CHECK (
        IdKurir IN (
            'EK[0-9][0-9][0-9][0-9]'
        )
    )
);
--- 5
--- Bank
--- 
CREATE TABLE Bank (
    IdBank CHAR(6) NOT NULL,
    NamaBank VARCHAR(MAX),
    NamaPengguna VARCHAR(MAX),
    Transaksi DATE,
    PRIMARY KEY (IdBank),
    FOREIGN KEY (IdBank) REFERENCES Pemerintah_Pusat(Pempusid) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdBank) REFERENCES Pemerintah_Daerah(Pemdaid) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CekidBK CHECK (
        IdBank IN (
            'BK[0-9][0-9][0-9][0-9]'
        )
    )
)
--- 6
--- Kurir
---
CREATE TABLE Kurir (
    IdKurir CHAR(6) NOT NULL,
    Nama CHAR(255),
    Alamat VARCHAR(MAX),
    JenisKelamin VARCHAR(MAX),
    Usia VARCHAR(MAX),
    PRIMARY KEY (Nama),
    CONSTRAINT CekidKU CHECK (
        IdKurir IN (
            'KU[0-9][0-9][0-9][0-9]'
        )
    )
)
--- 7
--- Jenis Bansos
---
CREATE TABLE JenisBansos (
    IdBansos CHAR(6) NOT NULL,
    JenisBansos VARCHAR(MAX),
    JenisBarang VARCHAR(MAX),
    JumlahBansos INT,
    PRIMARY KEY (IdBansos),
    FOREIGN KEY (IdBansos) REFERENCES JenisBarang(IdBarang) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT CekidBN CHECK (
        IdBansos IN (
            'BN[0-9][0-9][0-9][0-9]'
        )
    )
)
--- 8
--- Jenis Barang
---
CREATE TABLE JenisBarang (
    IdBarang CHAR(6) NOT NULL,
    JenisBarang VARCHAR(MAX),
    Quantity VARCHAR(MAX),
    PRIMARY KEY(IdBarang),
    CONSTRAINT Cekid CHECK (
        IdBarang IN (
            'JB[0-9][0-9][0-9][0-9]'
        )
    )
);