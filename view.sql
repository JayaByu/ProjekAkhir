USE x00;
GO

CREATE VIEW TransaksiEkspedisi AS 
    SELECT			Kurir.Nama 'Nama Kurir',
                    Masyarakat.Nama 'Penerima',
                    Ekspedisi.IdBansos 'Id Bansos',
                    CONVERT(DATE, Ekspedisi.TanggalPengiriman,107) 'Pemberangkatan',
                    'Rp. ' + CAST(Ekspedisi.Harga AS VARCHAR) 'Ongkir',
                    RIGHT(IdDestinasi, CHARINDEX(' ',REVERSE(IdDestinasi))-1) 'Destinasi'
    FROM			Kurir,Masyarakat,Ekspedisi
    WHERE           Kurir.IdKurir = Ekspedisi.IdKurir
    AND             Masyarakat.IdMasya = Ekspedisi.IdPenerima
     
GO

CREATE VIEW TransaksiBank AS
SELECT          Masyarakat.Nama,
                Bank.IdBansos,
                CONVERT(DATE,Bank.Transaksi,106) 'Transaksi',
                Bank.NamaBank,
                'Rp. ' + CAST(TipeBansos.JumlahBansos AS varchar) 'Dana Bantuan'
FROM            Masyarakat,Bank,TipeBansos
WHERE           Masyarakat.IdMasya = Bank.IdPenerima
AND             TipeBansos.IdBansos = Bank.IdBansos

GO

CREATE VIEW KecamatanKramat AS
    SELECT              Masyarakat.Nama,
                        Masyarakat.Gender,
                        DBKecamatan.IdKecamatan,
                        DBKecamatan.Kecamatan
    FROM                Masyarakat
    INNER JOIN          DBKecamatan 
    ON                  Masyarakat.IdMasya = DBKecamatan.IdMasyarakat
    WHERE               Kecamatan = 'Kramat' 

GO

SELECT * FROM TransaksiEkspedisi
SELECT * FROM TransaksiBank
SELECT * FROM KecamatanKramat            
