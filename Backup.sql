CREATE DATABASE x00;
USE x00;
DROP DATABASE test;

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
    Usia VARCHAR(100),
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

DROP TABLE Bank;



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

DROP TABLE Ekspedisi;


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






INSERT INTO Pempu(
    IdPusat,
    NamaPempus,
    Gender,
    Alamat,
    Phone
) VALUES (
    'PU001',
    'Sukijan',
    'Laki',
    'Kompleks Kantor Gubernur, Jl. Soa Siu Dok 2, Jayapura, Papua.',
    '(0967)537523'
),(
    'PU002',
    'Sukimin',
    'Perempuan',
    'Jl. Bumijo No.5, Bumijo, Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta.',
    '(0274)589074'
);

INSERT INTO Pemda(
    IdPemda,
    NamaPemda,
    Gender,
    Alamat,
    Phone
) VALUES (
    'PD001',
    'Suparno',
    'Laki',
    'Jl. Medan Merdeka Selatan 8-9 Blok G Lantai 3 Jakarta.',
    '(0642)21399'
),(
    'PD002',
    'Suparni',
    'Perempuan',
    'Jl. Jend.Sudirman No.51, Padang.',
    '(0751)31549'
);

INSERT INTO Masyarakat(
    IdMasya,
    Nama,
    Gender,
    Alamat,
    Phone
) VALUES (
    'MS001',
    'Issei',
    'Laki',
    'Jl Kramat Raya 3 H Kompl Maya Indah II, Dki Jakarta.',
    '02131613390'
),(
    'MS002',
    'Rias',
    'Perempuan',
    'Jl Sediyatmo Ged Ranujaya Benda, Jakarta',
    '02155912755'
);

INSERT INTO DBKecamatan(
    IdKecamatan,
    IdMasyarakat,
    Kecamatan
) VALUES (
    'KC001',
    'MS001',
    'Kramat'
),(
    'KC002',
    'MS002',
    'RanuJoyo'
);

INSERT INTO TipeBansos(
    IdBansos,
    JenisBansos,
    JumlahBansos
) VALUES (
    'TB001',
    'NonTunai',
    '2'
),(
    'TB002',
    'Tunai',
    '2000000'
);

INSERT INTO Kurir(
    IdKurir,
    Nama,
    Alamat,
    Gender,
    Usia
) VALUES (
    'KU001',
    'Supratno',
    'Jalan Cheras Mewah 10, Taman Cheras Mewah',
    'Laki',
    '20th'
),(
    'KU002',
    'Supratman',
    'Jalan Sulam, Taman Sentosa.',
    'Laki',
    '19th'
);

INSERT INTO Bank(
    IdBank,
    IdPempu,
    IdPemda,
    IdPenerima,
    IdBansos,
    NamaBank,
    Transaksi
) VALUES (
    'BK001',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
);

INSERT INTO Ekspedisi(
    IdEkspedisi,
    IdPempu,
    IdPemda,
    IdKurir,
    IdPenerima,
    IdBansos,
    Harga,
    JenisBarang,
    TanggalPengiriman,
    IdDestinasi
) VALUES (
    'EX001',
    '',
    'PD002',
    'KU002',
    'MS002',
    'TB001',
    30000000,
    'Beras',
    '2022/1/1',
    'Jl Sediyatmo Ged Ranujaya Benda, Jakarta'
);

SELECT * FROM Ekspedisi;