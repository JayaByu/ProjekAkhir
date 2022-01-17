USE revisi;

CREATE TABLE Pempu(
    IdPusat CHAR(6) NOT NULL,
    NamaPempus VARCHAR(255) NOT NULL,
    Gender VARCHAR(10),
    Alamat VARCHAR(255),
    Phone VARCHAR(12),
    PRIMARY KEY (IdPusat),
    CONSTRAINT CekIdPusat CHECK (
        IdPusat LIKE (
            'PU[0-9][0-9][0-9]'
        )),
    CONSTRAINT CekGenPusat CHECK (
        Gender IN (
            'Laki','Perempuan'
        ))
);

CREATE TABLE Pemda(
    IdPemda CHAR(6) NOT NULL,
    NamaPemda VARCHAR(255) NOT NULL,
    Gender CHAR(10),
    Alamat VARCHAR(255),
    Phone VARCHAR(12),
    PRIMARY KEY (IdPemda),
    CONSTRAINT Chk_Pemda CHECK (
        IdPemda LIKE(
            'PD[0-9][0-9][0-9]')
        AND
        Gender IN (
            'Laki','Perempuan')
    ),
);


CREATE TABLE Masyarakat(
    IdMasya CHAR(6) NOT NULL,
    Nama VARCHAR(255),
    Gender CHAR(10),
    Alamat VARCHAR(255),
    Phone VARCHAR(12),
    PRIMARY KEY (IdMasya),
        CONSTRAINT CekIdMasya CHECK (
        IdMasya LIKE(
            'MS[0-9][0-9][0-9]'
        )),
        CONSTRAINT CekGenMasya CHECK (
        Gender IN(
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
        REFERENCES Masyarakat(IdMasya) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Chk_DBKecamatan CHECK (
        IdKecamatan LIKE(
            'KC[0-9][0-9][0-9]'
        )
    )
);

CREATE TABLE TipeBansos(
    IdBansos CHAR(6) NOT NULL,
    JenisBansos VARCHAR(255) NOT NULL,
    JumlahBansos VARCHAR(255),
    PRIMARY KEY(IdBansos),
    CONSTRAINT Chk_TipeBansos CHECK(
        IdBansos LIKE(
            'TB[0-9][0-9][0-9]'
        )
        AND
        JenisBansos IN(
            'NonTunai','Tunai'
        )
    ),
);


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
            'Laki','Perempuan'
        )
    ),
);


CREATE TABLE Bank(
    IdBank CHAR(6) NOT NULL,
    IdPempu CHAR(6),
    IdPemda CHAR(6),
    IdPenerima CHAR(6) NOT NULL,
    IdBansos CHAR(6) NOT NULL,
    NamaBank VARCHAR(255),
    Transaksi DATE,
    PRIMARY KEY (IdBank),
    FOREIGN KEY (IdPenerima)
        REFERENCES Masyarakat(IdMasya) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdBansos)
        REFERENCES TipeBansos(IdBansos) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Chk_Bank CHECK(
        IdBank LIKE(
            'BK[0-9][0-9][0-9]'
        )
    )
); 


CREATE TABLE Ekspedisi(
    IdEkspedisi CHAR(6) NOT NULL,
    IdPempu CHAR(6),
    IdPemda CHAR(6),
    IdKurir CHAR(6) NOT NULL,
    IdPenerima CHAR(6) NOT NULL,
    IdBansos CHAR(6) NOT NULL,
    Harga NUMERIC(11,2),
    JenisBarang VARCHAR(255),
    TanggalPengiriman DATE,
    IdDestinasi VARCHAR(255),
    PRIMARY KEY (IdEkspedisi),
    FOREIGN KEY (IdKurir)
        REFERENCES Kurir(IdKurir) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPenerima)
        REFERENCES Masyarakat(IdMasya) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdBansos)
        REFERENCES TipeBansos(IdBansos) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Chk_Ekspedisi CHECK (
        IdEkspedisi LIKE (
            'EX[0-9][0-9][0-9]'
        )
    )
);
    



