USE test;

GO
CREATE PROCEDURE procMasyarakat1 @IdMasyarakat NVARCHAR(6), @NmMasyarakat NVARCHAR(255), @GdMasyarakat NVARCHAR(10), @AlmMasyarakat NVARCHAR(255), @PhnMasyarakat NVARCHAR(12) AS
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
;
GO
EXEC procMasyarakat1 '', '', '', '', '';
GO
DROP PROCEDURE procMasyarakat1;
GO
SELECT * FROM Masyarakat;
GO
DELETE FROM Masyarakat WHERE IdMasya = '';

GO
CREATE PROCEDURE procPempu1 @IdPempu NVARCHAR(6), @NmPempu NVARCHAR(255), @GdPempu NVARCHAR(10), @AlmPempu NVARCHAR(255), @PhnPempu NVARCHAR(12) AS
IF EXISTS (SELECT * FROM Pempu WHERE IdPusat = @IdPempu)
	BEGIN
		UPDATE Pempu
		SET Pempu.NamaPempus = @NmPempu,
		Pempu.Gender = @GdPempu,
		Pempu.Alamat = @AlmPempu,
		Pempu.Phone = @PhnPempu
		WHERE IdPusat = @IdPempu
		PRINT 'Data Updated'
	END
ELSE
	INSERT INTO Pempu(
		IdPusat,
		NamaPempus,
		Gender,
		Alamat,
		Phone
	) VALUES (
		@IdPempu,
		@NmPempu,
		@GdPempu,
		@AlmPempu,
		@PhnPempu
	)
;
GO
EXEC procPempu1 '', '', '', '', '';
GO
DROP PROCEDURE EXEC procPempu1 '', '', '', '', '';
GO
SELECT * FROM Pempu;
GO
DELETE FROM Pempu WHERE IdPusat = '';

GO
CREATE PROCEDURE procPemda1 @IdPemda NVARCHAR(6), @NmPemda NVARCHAR(255), @GdPemda NVARCHAR(10), @AlmPemda NVARCHAR(255), @PhnPemda NVARCHAR(12) AS
IF EXISTS (SELECT * FROM Pemda WHERE IdPemda = @IdPemda)
	BEGIN
		UPDATE Pemda
		SET Pemda.NamaPemda = @NmPemda,
		Pemda.Gender = @GdPemda,
		Pemda.Alamat = @AlmPemda,
		Pemda.Phone = @PhnPemda
		WHERE IdPemda = @IdPemda
		PRINT 'Data Updated'
	END
ELSE
	INSERT INTO Pemda(
		IdPemda,
		NamaPemda,
		Gender,
		Alamat,
		Phone
	) VALUES (
		@IdPemda,
		@NmPemda,
		@GdPemda,
		@AlmPemda,
		@PhnPemda
	)
;
GO
EXEC procPemda1 '', '', '', '', '';
GO
DROP PROCEDURE procPemda1;
GO
SELECT * FROM Pemda;
GO
DELETE FROM Pemda WHERE IdPemda = '';

GO
USE x00;
GO
CREATE PROCEDURE procBank1 @IdBank NVARCHAR(6), @IdPem NVARCHAR(6), @IdMas NVARCHAR(6), @IdBansos NVARCHAR(6), @NmBank NVARCHAR(255), @TglTransaksi DATE AS
IF EXISTS (SELECT * FROM Bank WHERE IdPempu = @IdPem OR IdPemda = @IdPem)
	BEGIN
		IF EXISTS (SELECT * FROM Bank WHERE IdPempu = @IdPem)
			UPDATE Bank
			SET IdBank = @IdBank,
			IdPenerima = @IdMas,
			IdBansos = @IdBansos,
			NamaBank = @NmBank,
			Transaksi = @TglTransaksi
			WHERE IdPempu = @IdMas
			PRINT 'Data Updated'
		IF EXISTS (SELECT * FROM Bank WHERE IdPemda = @IdPem)
			UPDATE Bank
			SET IdBank = @IdBank,
			IdPenerima = @IdMas,
			IdBansos = @IdBansos,
			NamaBank = @NmBank,
			Transaksi = @TglTransaksi
			WHERE IdPemda = @IdMas
			PRINT 'Data Updated'
	END
ELSE
	IF (@IdPem LIKE 'PU%')
		PRINT 'Error'
		INSERT INTO Bank(
			IdBank,
			IdPempu,
			IdPenerima,
			IdBansos,
			NamaBank,
			Transaksi
		) VALUES (
			@IdBank,
			@IdPem,
			@IdMas,
			@IdBansos,
			@NmBank,
			@TglTransaksi
		)
	IF (@IdPem LIKE 'PD%')
		PRINT 'Error'
		INSERT INTO Bank(
		IdBank,
		IdPemda,
		IdPenerima,
		IdBansos,
		NamaBank,
		Transaksi
		) VALUES (
			@IdBank,
			@IdPem,
			@IdMas,
			@IdBansos,
			@NmBank,
			@TglTransaksi
		)

go 

DROP PROCEDURE procBank1;
go

SELECT * FROM Bank

EXEC procBank1 'BK001','PD001','MS001','TB002','Mandiri','2022/12/24';

go 

SELECT * FROM Pemda,Pempu