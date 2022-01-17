USE Nko;
GO 

CREATE VIEW ListPenerimaBansos AS 
    SELECT      Bansos.IdBansos 'Id Bansos',
                Bansos.TypeBansos,
                Kecamatan.Kecamatan 'Nama Kecamatan',
                Penerima.Nama 'Nama Penerima'
    FROM        Bansos,Kecamatan,Penerima
    WHERE       Bansos.IdCamat = Kecamatan.IdCamat
    AND         Kecamatan.IdPenerima = Penerima.IdPenerima
GO 


CREATE VIEW ListPenerimaBansosTunai AS
    SELECT      'Rp. ' + CAST(Bansos.JumlahBansos AS VARCHAR) 'Dana Bantuan',
                Pemerintah.Nama 'Pengirim',
                Penerima.Nama 'Penerima',
    FORMAT      (TransacBank.Tanggal,'MMMM dd yyyy') 'Tanggal Transaksi' 
    FROM        Bansos,Bank,Pemerintah,Penerima,TransacBank
    WHERE       Bansos.IdPem = Pemerintah.IdPem
    AND         Bank.IdBansos = Bansos.IdBansos
    AND         Bank.IdPenerima = Penerima.IdPenerima
    AND         TransacBank.IdBank = Bank.IdBank
GO

CREATE VIEW ListPenerimaBansosNonTunai AS
    SELECT      Bansos.JumlahBansos + ' Sembako' AS 'Jumlah Bansos',
                Pemerintah.Nama 'Pengirim',
                Penerima.Nama 'Penerima',
                Kurir.Nama 'Kurir',
                'Kec. ' + CAST(Kecamatan.Kecamatan AS VARCHAR) 'Tujuan',
    FORMAT      (TransacPengirim.Tanggal,'MMMM dd yyyy') 'Tanggal Transaksi'
    FROM        Bansos,Pemerintah,Penerima,Pengiriman,Kurir,Kecamatan,TransacPengirim
    WHERE       Bansos.IdPem = Pemerintah.IdPem
    AND         Pengiriman.IdBansos = Bansos.IdBansos
    AND         Pengiriman.IdPenerima = Penerima.IdPenerima
    AND         Pengiriman.IdKurir = Kurir.IdKurir
    AND         Bansos.IdCamat = Kecamatan.IdCamat
    AND         TransacPengirim.IdPengiriman = Pengiriman.IdKirim
GO


