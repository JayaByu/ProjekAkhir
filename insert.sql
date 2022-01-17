USE revisi;

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
    'Kompleks Kantor Gubernur, Jl. Soa Siu Dok 2, Kec Jayapura, Papua.',
    '(0967)537523'
),(
    'PU002',
    'Sukimin',
    'Perempuan',
    'Jl. Bumijo No.5, Bumijo, Kec Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta.',
    '(0274)589074'
),(
    'PU004',
    'ratno',
    'Perempuan',
    'Jl. Dahlia No 4 Kecamatan Jalaporo ',
    '(0274)589074'
),(
    'PU005',
    'Supratman',
    'Laki',
    'Jl. Lompok No 10 Kecamatan Jetis',
    '(0274)589074'
),(
    'PU006',
    'Ratna',
    'Perempuan',
    'Jl. Jelangkung No 190 Kecamatan Saroto',
    '(0274)589074'
),(
    'PU007',
    'Parmin',
    'Laki',
    'Jl. Paradox No 10 Kecamatan Dodo',
    '(0274)589074'
),(
    'PU008',
    'Valan',
    'Laki',
    'Jl. Dendrobium No 20 Kecamatan Saroto',
    '(0274)589074'
),(
    'PU009',
    'Viana',
    'Perempuan',
    'Jl. Paradox No 20 Kecamatan Dodo',
    '(0274)589074'
),(
    'PU010',
    'Ernes',
    'Laki',
    'Jl. Bumijo No.6, Bumijo, Kec Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta.',
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
    '    19'
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
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK002',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK003',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK004',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK005',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK006',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK007',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK008',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK009',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
),(
    'BK0010',
    '',
    'PD001',
    'MS001',
    'TB002',
    'Mandiri',
    '2022/12/24'
)
    
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
  

INSERT INTO Kurir(
    IdKurir,
    Nama,
    Alamat,
    Gender,
    Usia
) VALUES (
    'KU001',
    'Sawachi',
    'Jl Apel',
    'Laki',
    '21'
),(
    'KU002',
    'Utoni',
    'Jl Mangga',
    'Perempuan',
    '21'
),(
    'KU003',
    'Titran',
    'Jl Anggur',
    'Laki',
    '22'
),(
    'KU004',
    'Emfryon',
    'Jl Jeruk',
    'Laki',
    '23'
),(
    'KU005',
    'Livego',
    'Jl Salak',
    'Perempuan',
    '25'
),(
    'KU006',
    'Ensiro',
    'Jl Melon',
    'Laki',
    '27'
),(
    'KU007',
    'Tuvena',
    'Jl Manggis',
    'Laki',
    '29'
),(
    'KU008',
    'Deightchi',
    'Jl Kelapa',
    'Perempuan',
    '23'
),(
    'KU009',
    'Senikyu',
    'Jl Pir',
    'Perempuan',
    '22'
),(
    'KU010',
    'Setenju',
    'Jl Semangka',
    'Laki',
    '20'
)'Jl Sediyatmo Ged Ranujaya Benda, Jakarta'
);  