USE Nko;

GO 
CREATE TRIGGER ValidateUsia 
    ON Kurir
    FOR INSERT AS
        BEGIN
            DECLARE @MaxUsia INT = 18
            IF  (@MaxUsia < 19)
                BEGIN
                    PRINT 'Usia Anda Kurang Dari 19Th Untuk Jadi Kurir -/-'
                    DELETE FROM Kurir WHERE Usia < 19
                END 
            ELSE
                BEGIN
                    PRINT 'Selamat Anda Telah Terdaftar Sebagai Kurir >.<'
                    SELECT IdKurir,Nama,Alamat,Gender,Usia
                    FROM inserted
                END
        END

INSERT INTO Kurir (IdKurir, Nama, Alamat, Gender, Usia)
VALUES ('KU011', 'neko','Jl gaya','Female',18)

SELECT * FROM Kurir

GO 
DROP TRIGGER CekPen

GO 

CREATE TRIGGER Cekpeng
    ON Pengiriman
    INSTEAD OF INSERT AS 
        BEGIN 
            INSERT INTO Pengiriman
            SELECT IdKirim, IdBansos, IdKurir, IdPenerima, 
            CASE 
                WHEN Ongkir > 1000000 then Ongkir
            END
            FROM INSERTED
        END
GO 
CREATE TRIGGER Stat
    ON TransacPengirim
    AFTER UPDATE AS 
        BEGIN 
			SET NOCOUNT ON
            UPDATE TransacPengirim
            SET StatusPengiriman = 'Shipped'
            WHERE StatusPengiriman IS NULL
        END
    
ALTER TABLE TransacPengirim
ADD StatusPengiriman VARCHAR(255)

DROP TRIGGER Stat

SELECT * FROM TransacPengirim