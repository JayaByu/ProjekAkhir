USE x00;
GO
SELECT * FROM Pempu;
GO
SELECT * FROM Pemda;
GO
SELECT * FROM  Masyarakat;
GO
SELECT * FROM DBKecamatan;
GO
SELECT * FROM TipeBansos;
GO
SELECT * FROM Kurir;
GO
SELECT * FROM Bank;
GO
SELECT * FROM Ekspedisi;
GO

-- SELECT      Nama.Kurir,

-- FROM        Ekspedisi
-- JOIN        Kurir ON Kurir.IdKurir = Ekspedisi.IdKurir
-- JOIN        Masyarakat ON Masyarakat.IdMasya = Ekspedisi.IdPenerima

SELECT          Kurir.Nama,
                TipeBansos.JenisBansos
FROM            Kurir,TipeBansos
WHERE           TipeBansos.IdBansos = Kurir.IdKurir
AND             TipeBansos.JenisBansos = 'NonTunai'


SELECT          Kurir.Nama,
                TipeBansos.JenisBansos
FROM            TipeBansos
WHERE           JenisBansos = 'NonTunai'

GO


