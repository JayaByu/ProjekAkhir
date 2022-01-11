USE test;

CREATE PROCEDURE penc1 @Masyarakat NVARCHAR(55), @Provinsi NVARCHAR(25) AS
    SELECT Masyarakat.Idmasya, Masyarakat.Nama, Masyarakat.Gender, Masyarakat.Alamat, Pempu.NamaPempus, Pemda.NamaPemda
    FROM Masyarakat
    JOIN Pempu ON 

CREATE PROCEDURE nama1 @
--Pencarian melalui nama masyarakat