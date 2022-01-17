CREATE PROCEDURE procPem1 @IdPem NVARCHAR(6), @Nama NVARCHAR(255), @Gender NVARCHAR(10), @Alamat NVARCHAR(255), @NoHp NVARCHAR(255) AS
IF EXISTS (SELECT IdPem FROM Pemerintah WHERE IdPem LIKE @IdPem)
        UPDATE Pemerintah
        SET Nama = @Nama,
        Gender = @Gender,
        Alamat = @Alamat,
        NoHp = @NoHp
        WHERE IdPem LIKE @IdPem
ELSE
        INSERT INTO Pemerintah (IdPem, Nama, Gender, Alamat, NoHp)
        VALUES (@Idpem, @Nama, @Gender, @Alamat, @NoHp)

EXEC procPem1 'PM011', 'NEKO', 'Male', 'JL Neko', '081234567898'
GO 
CREATE PROCEDURE procPen1 @IdPenerima NVARCHAR(6), @Nama NVARCHAR(255), @Gender NVARCHAR(10), @Alamat NVARCHAR(255), @NoHp NVARCHAR(255) AS
IF EXISTS (SELECT IdPenerima FROM Penerima WHERE IdPenerima LIKE @IdPenerima)
        UPDATE Penerima
        SET Nama = @Nama,
        Gender = @Gender,
        Alamat = @Alamat,
        NoHp = @NoHp
        WHERE IdPenerima LIKE @IdPenerima
ELSE
        INSERT INTO Penerima (IdPenerima, Nama, Gender, Alamat, NoHp)
        VALUES (@IdPenerima, @Nama, @Gender, @Alamat, @NoHp)

EXEC procPen1 'PN011', 'SURINEM', 'Female', 'JL Minem', '086221313323'
GO 
CREATE PROCEDURE procKur1 @IdKurir NVARCHAR(6), @Nama NVARCHAR(255), @Gender NVARCHAR(10), @Alamat NVARCHAR(255), @Usia NVARCHAR(255) AS
IF EXISTS (SELECT IdKurir FROM Kurir WHERE IdKurir LIKE @IdKurir)
        UPDATE Kurir
        SET Nama = @Nama,
        Gender = @Gender,
        Alamat = @Alamat,
        Usia = @Usia
        WHERE @IdKurir LIKE @IdKurir
ELSE
        INSERT INTO Kurir (IdKurir, Nama, Gender, Alamat, Usia)
        VALUES (@IdKurir, @Nama, @Gender, @Alamat, @Usia)

EXEC procKur1 'KU011', 'KuroNeko', 'Male', 'JL Shiro Neko', '18'