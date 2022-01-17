USE x00;
GO 
CREATE TRIGGER trig1
    ON Bank
    AFTER INSERT AS
        BEGIN
            DELETE TOP(1)
            FROM Bank
        END
BEGIN TRANSACTION
    INSERT INTO Bank(
        IdBank,
        IdPempu,
        IdPemda,
        IdPenerima,
        IdBansos,
        NamaBank,
        Transaksi
    ) VALUES (
        'BK002',
        '',
        'PD003',
        'MS003',
        'TB003',
        'BNI',
        '2022/1/25'
    )
    SELECT * FROM Bank WHERE IdBank = 'BK002'

GO
CREATE TRIGGER trig2
    ON Ekspedisi
    AFTER INSERT AS
        BEGIN
            DELETE TOP(1)
            FROM Ekspedisi
        END
BEGIN TRANSACTION
    INSERT INTO Ekspedisi(
        IdEkspedisi,
        IdPempu,
        IdPemda,
        IdPenerima,
        IdBansos,
        JenisBarang,
        TanggalPengiriman,
        IdDestinasi
    ) VALUES (
        'EX002',
        '',
        'PU003',
        'KU002',
        'TB003',
        10000000,
        'Buah',
        '2022/1/25',
        'JL Suparno Blok 66 NO 66'
    )
    SELECT * FROM Bank WHERE IdBank = 'EX002'
GO 

CREATE TRIGGER trig3
    ON Kurir
    FOR INSERT AS
        BEGIN
        DECLARE @MaxUsia INT = 18
            IF (@MaxUsia < 19)
                BEGIN
                    PRINT 'Usia anda kurang dari 19thn'
                    DELETE FROM Kurir WHERE Usia < 19 
                END
            ELSE
                BEGIN
                    PRINT 'Welcome Kurir'
                    SELECT IdKurir,Nama,Alamat,Gender,Usia 
                    FROM INSERTED 
                END
        END

DROP TRIGGER trig3

INSERT INTO Kurir(
    IdKurir,
    Nama,
    Alamat,
    Gender,
    Usia
) VALUES (
    'KU006',
    'Supr',
    'Jalan',
    'Laki',
    20
)

DELETE FROM Kurir WHERE IdKurir = 'KU006'


SELECT      Bank.IdPenerima,
            Ekspedisi.IdPenerima,
            Masyarakat.Nama
FROM        Bank,Ekspedisi,Masyarakat


CREATE DATABASE revisi