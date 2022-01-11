USE x00;
GO
CREATE PROCEDURE proc1 @IdMasyarakat NVARCHAR(6), @NmMasyarakat NVARCHAR(255), @GdMasyarakat NVARCHAR(10), @AlmMasyarakat NVARCHAR(255), @PhnMasyarakat NVARCHAR(12) AS
IF EXISTS (SELECT * FROM Masyarakat WHERE IdMasya = @IdMasyarakat)
	BEGIN
		UPDATE Masyarakat
		SET Nama = @NmMasyarakat,
		Masyarakat.Gender = @GdMasyarakat,
		Masyarakat.Alamat = @AlmMasyarakat,
		Masyarakat.Phone = @PhnMasyarakat
		WHERE IdMasya = @IdMasyarakat
		PRINT 'Data Updated'
	END
ELSE
	INSERT INTO Masyarakat(
		IdMasya,
		Nama,
		Gender,
		Alamat,
		Phone
	) VALUES (
		@IdMasyarakat,
		@NmMasyarakat,
		@GdMasyarakat,
		@AlmMasyarakat,
		@PhnMasyarakat
	)

EXEC proc1 'MS003','Yuki','Perempuan','JL.Neko','02155912755'

GO

