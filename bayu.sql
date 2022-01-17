USE Nko
CREATE DATABASE Nko
GO 
USE Nko
DROP DATABASE N

CREATE TABLE Pemerintah(
    IdPem CHAR(6) NOT NULL,
    Nama VARCHAR(225),
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
    IdPem CHAR(6) NOT NULL,
    IdCamat CHAR(6) NOT NULL,
    TypeBansos VARCHAR(225),
    JumlahBansos VARCHAR(255)
    PRIMARY KEY(IdBansos),
	FOREIGN KEY (IdPem)
		REFERENCES Pemerintah(IdPem) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (IdCamat)
		REFERENCES Kecamatan(IdCamat) ON DELETE CASCADE ON UPDATE CASCADE,
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
GO

INSERT INTO Pemerintah(IdPem,Nama,Gender,Alamat,NoHp) VALUES
('PM001','Alen','Male','Jalan Apel','081234567891'),
('PM002','Bale','Male','Jalan Belimbing','081234567892'),
('PM003','Ciko','Male','Jalan Ceri','081234567893'),
('PM004','Dwi','Female','Jalan Durian','081234567894'),
('PM005','Ekawati','Female','Jalan Erbis','081234567895'),
('PM006','Fifo','Male','Jalan Flamboyan','081234567896'),
('PM007','Jett','Female','Jalan Nekopara','08213172546'),
('PM008','Helen','Female','Jalan Halba','081234567898'),
('PM009','Isabel','Female','Jalan Ilama','081234567899'),
('PM010','Justin','Male','Jalan Jeruk','081234567890');

INSERT INTO Penerima(IdPenerima,Nama,Gender,Alamat,NoHp)VALUES
('PN001','Sukiman','Male','Jl Pasundan No 4 Kec Kedungturi','086231231313'),
('PN002','Ratna','Female','Jl Parane No 5 Kec Taman','086234329718'),
('PN003','Lesong','Male','Jl Neko No 5 Kec Waru','081232134534'),
('PN004','Nasuru','Male','JL Pesawat No 2 Kec Juanda','085232423452'),
('PN005','Retni','Female','JL Paimon NO 10 Kec Pokcan','086221313323'),
('PN006','Valen','Male','JL Padarno NO 50 Kec Sepanjang','0812312434512'),
('PN007','Suarti','Female','JL Pramuro NO 10 Kec Sepanjang','0875645435343'),
('PN008','Minem','Female','JL Pradana NO 2 Kec Sidoarjo','0843432311233'),
('PN009','Sutu','Female','JL Sari NO 1 Kec Taman','0865523423444'),
('PN010','Paredon','Male','JL Venalu No 8 Kec Kedungturi','0812333443331');

INSERT INTO Kecamatan(IdCamat,IdPenerima,Kecamatan)VALUES
('KC001','PN001','Kedungturi'),
('KC002','PN002','Taman'),
('KC003','PN003','Waru'),
('KC004','PN004','Juanda'),
('KC005','PN005','Pokcan'),
('KC006','PN006','Sepanjang'),
('KC007','PN007','Sepanjang'),
('KC008','PN008','Sidoarjo'),
('KC009','PN009','Taman'),
('KC010','PN010','Kedungturi')

INSERT INTO Kurir (IdKurir, Nama, Alamat, Gender, Usia)
VALUES ('KU001', 'Sawachi','Jl Apel','Female',21),
    ('KU002', 'Utoni','Jl Mangga','Female',21),
    ('KU003', 'Titran', 'Jl Anggur', 'Male', 22),
    ('KU004', 'Emfryon', 'Jl Jeruk', 'Male', 23),
    ('KU005', 'Livego', 'Jl Salak', 'Female', 25),
    ('KU006', 'Ensiro', 'Jl Melon', 'Male', 27),
    ('KU007', 'Tuvena', 'Jl Manggis', 'Male', 29),
    ('KU008', 'Deightchi', 'Jl Kelapa', 'Female', 23),
    ('KU009', 'Senikyu', 'Jl Pir', 'Female', 22),
    ('KU010', 'Setenju', 'Jl Semangka', 'Male', 20)


INSERT INTO Bansos(IdBansos,IdPem,IdCamat,TypeBansos,JumlahBansos)VALUES
('BN001','PM001','KC001','Non Tunai','1'),
('BN002','PM002','KC002','Tunai','300000'),
('BN003','PM003','KC003','Tunai','115000'),
('BN004','PM004','KC004','Tunai','200000'), 
('BN005','PM005','KC005','Non Tunai','1'),
('BN006','PM006','KC006','Non Tunai','1'),
('BN007','PM007','KC007','Non Tunai','1'),
('BN008','PM008','KC008','Tunai','500000'),
('BN009','PM009','KC009','Non Tunai','1'),
('BN010','PM010','KC010','Tunai','400000')


INSERT INTO Bank(IdBank,IdBansos,NamaBank,IdPenerima) VALUES
('BK001','BN002','Mandiri','PN002'),
('BK002','BN003','BNI','PN003'),
('BK003','BN004','BNI','PN004'),
('BK004','BN008','BRI','PN008'),
('BK005','BN010','Bank Jatim','PN010')

INSERT INTO TransacBank(IdTransacBank,IdBank,Tanggal) VALUES
('TB001','BK001','2021/05/12'),
('TB002','BK002','2021/06/12'),
('TB003','BK003','2021/05/10'),
('TB004','BK004','2021/04/1'),
('TB005','BK005','2021/03/13')




-- INSERT INTO Ekspedisi(
--     IdEkspedisi,
--     Agen
-- ) VALUES (
--     'EK001',
--     'JNE'
-- ),(
--     'EK002',
--     'JNT'
-- ),(
--     'EK003',
--     'Lion'
-- ),(
--     'EK004',
--     'Ninja Express'
-- ),(
--     'EK005',
--     'Wahana'
-- ),(
--     'EK006',
--     'Grab'
-- ),(
--     'EK007',
--     'Gosend'
-- ),(
--     'EK008',
--     'Tiki'
-- ),(
--     'EK009',
--     'POS Indonesia'
-- ),(
--     'EK010',
--     'Indah Cargo'
-- )

INSERT INTO Pengiriman (IdKirim, IdBansos, IdKurir, IdPenerima, Ongkir)
VALUES 
('PK001', 'BN001', 'KU001', 'PN001','50000'),
('PK002', 'BN005', 'KU002', 'PN005','45000'),
('PK003', 'BN006', 'KU003', 'PN006','100000'),
('PK004', 'BN007', 'KU004', 'PN007','70000'),
('PK005', 'BN009', 'KU005', 'PN009','85000');

INSERT INTO TransacPengirim(IdTransacKirim,IdPengiriman,Tanggal) VALUES
('TP001','PK001','2021/03/21'),
('TP002','PK002','2021/03/16'),
('TP003','PK003','2021/04/05'),
('TP004','PK004','2021/11/21'),
('TP005','PK005','2021/12/25');

--- Bayu no 1
--- Non Tunai
SELECT      Pengiriman.IdPenerima 'Id Penerima',
            MONTH(TransacPengirim.Tanggal) 'Bulan',
            COUNT(Bansos.JumlahBansos) 'Total NonTunai'
FROM        Pengiriman,TransacPengirim,Bansos
WHERE       TransacPengirim.idPengiriman = Pengiriman.IdKirim
AND			Pengiriman.IdBansos = Bansos.IdBansos
GROUP BY    Pengiriman.IdPenerima,
			TransacPengirim.Tanggal,
			Bansos.JumlahBansos
ORDER BY	'Bulan' DESC

--- Tunai
SELECT		Bank.IdPenerima 'Id Penerima',
			MONTH(TransacBank.Tanggal) 'Bulan',
			Bansos.TypeBansos,
			Bansos.JumlahBansos 'Total Tunai'
FROM		Bank,TransacBank,Bansos
WHERE		TransacBank.IdBank = Bank.IdBank
AND			Bank.IdBansos = Bansos.IdBansos
GROUP BY	Bank.IdPenerima,
			TypeBansos,
			TransacBank.Tanggal,
			Bansos.JumlahBansos
ORDER BY    'Total Tunai' DESC

--- no 2 kelompok 
SELECT		Kecamatan.IdPenerima,
			Kecamatan.Kecamatan,
			Bansos.JumlahBansos 'Total Bansos'
FROM		Kecamatan,Bansos
WHERE		Kecamatan.IdCamat = Bansos.IdCamat
ORDER BY	[Total Bansos] DESC
--- Dari nilai besar hingga terkecil

SELECT		Kecamatan.IdPenerima,
			Kecamatan.Kecamatan,
			Bansos.JumlahBansos 'Total Bansos'
FROM		Kecamatan,Bansos
WHERE		Kecamatan.IdCamat = Bansos.IdCamat
ORDER BY	[Total Bansos] ASC
--- Dari nilai kecil hingga terbesaar

--- no 1 kelompok 

SELECT		Pengiriman.IdPenerima,
			TransacPengirim.Tanggal,
			COUNT(Bansos.JumlahBansos) 'Total NonTunai',
			Bank.IdPenerima,
			TransacBank.Tanggal,
			Bansos.JumlahBansos 'Total Tunai'
FROM		Pengiriman,Bank,Bansos,TransacBank,TransacPengirim
WHERE		TransacPengirim.IdPengiriman = Pengiriman.IdKirim
AND			TransacBank.IdBank = Bank.IdBank
GROUP BY	Pengiriman.IdPenerima,
			TransacPengirim.Tanggal,
			Bansos.JumlahBansos,
			Bank.IdPenerima,
			TransacBank.Tanggal
order by	'Total NonTunai' DESC,'Total Tunai' DESC
