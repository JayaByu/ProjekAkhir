USE test;
INSERT INTO Pempu(
    IdPusat,
    NamaPempus,
    Gender,
    Alamat,
    Phone
) VALUES (
    'PU001',
    'Sukijan',
    'Laki',
    'Kompleks Kantor Gubernur, Jl. Soa Siu Dok 2, Jayapura, Papua.',
    '(0967)537523'
),(
    'PU002',
    'Sukimin',
    'Perempuan',
    'Jl. Bumijo No.5, Bumijo, Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta.',
    '(0274)589074'
);

INSERT INTO Pemda(
    IdPemda,
    NamaPemda,
    Gender,
    Alamat,
    Phone
) VALUES (
    'PD001',
    'Suparno',
    'Laki',
    'Jl. Medan Merdeka Selatan 8-9 Blok G Lantai 3 Jakarta.',
    '(0642)21399'
),(
    'PD002',
    'Suparni',
    'Perempuan',
    'Jl. Jend.Sudirman No.51, Padang.',
    '(0751)31549'
);

INSERT INTO Masyarakat(
    IdMasya,
    Nama,
    Gender,
    Alamat,
    Phone
) VALUES (
    'MS001',
    'Issei',
    'Laki',
    'Jl Kramat Raya 3 H Kompl Maya Indah II, Dki Jakarta.',
    '02131613390'
),(
    'MS002',
    'Rias',
    'Perempuan',
    'Jl Sediyatmo Ged Ranujaya Benda, Jakarta',
    '02155912755'
);

INSERT INTO DBKecamatan(
    IdKecamatan,
    IdMasyarakat,
    Kecamatan
) VALUES (
    'KC001',
    'MS001',
    'Kramat'
),(
    'KC002',
    'MS002',
    'RanuJoyo'
)

INSERT INTO TipeBansos(
    IdBansos,
    JenisBansos,
    JumlahBansos
) VALUES (
    'TB001',
    'NonTunai',
    '2'
),(
    'TB002',
    'Tunai',
    '2000000'
)

INSERT INTO Kurir(
    IdKurir,
    Nama,
    Alamat,
    Gender,
    Usia
) VALUES (
    'KU001',
    'Supratno',
    'Jalan Cheras Mewah 10, Taman Cheras Mewah',
    'Laki',
    20
),(
    'KU002',
    'Supratman',
    'Jalan Sulam, Taman Sentosa.',
    'Laki',
    19
)

INSERT INTO Bank(
    IdBank,
    IdPempu,
    IdPemda,
    IdPenerima,
    IdBansos,
    NamaBank,
    Transaksi
) VALUES (
    'BK001',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
);

INSERT INTO Ekspedisi(
    IdEkspedisi,
    IdPempu,
    IdPemda,
    IdKurir,
    IdPenerima,
    IdBansos,
    Harga,
    JenisBarang,
    TanggalPengiriman,
    IdDestinasi
) VALUES (
    'EX001',
    '',
    'PD002',
    'KU002',
    'MS002',
    'TB001',
    30000000,
    'Beras',
    '2022/1/1',
    'Jl Sediyatmo Ged Ranujaya Benda, Jakarta'
);