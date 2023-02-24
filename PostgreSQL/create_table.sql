create table rakamin_customer (
	id_pelanggan INT PRIMARY KEY NOT NULL,
	nama VARCHAR,
	email VARCHAR,
	telepon VARCHAR,
	umur INT,
	bulan_lahir VARCHAR,
	tanggal_registrasi DATE,
	konfirmasi_telepon INT,
	penipu INT,
	pengguna_aktif INT
)

create table rakamin_customer_address (
	id_alamat INT PRIMARY KEY NOT NULL,
	id_pelanggan INT ,
	alamat VARCHAR,
	kota VARCHAR,
	propinsi VARCHAR
)

create table rakamin_order (
	id_order INT PRIMARY KEY NOT NULL,
	id_pelanggan INT,
	id_merchant INT,
	tanggal_pembelian DATE,
	kuantitas INT,
	harga INT,
	ppn float8,
	bayar_cash INT,
	metode_bayar VARCHAR
)

create table rakamin_merchant (
	id_merchant INT PRIMARY KEY NOT NULL,
	nama_merchant VARCHAR,
	tanggal_registrasi DATE
)

create table rakamin_merchant_copy as
SELECT * from rakamin_merchant