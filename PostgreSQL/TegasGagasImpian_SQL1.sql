/* Created by: Tegas Gagas Impian */

/* Jawaban nomor 1*/
SELECT 
	DISTINCT rakamin_customer_address.kota
FROM 
	rakamin_customer_address
	ORDER BY kota;

/* Jawaban nomor 2*/
SELECT *
FROM 
	rakamin_order 
	ORDER BY tanggal_pembelian DESC
	LIMIT(10);

/* Jawaban nomor 3*/
SELECT *
FROM 
	rakamin_customer
	WHERE penipu = 1
	ORDER BY nama;
/* Saya mengasumsikan 1 sebagai true pada kolom penipu */

/* Jawaban nomor 4*/
SELECT *
FROM 
	rakamin_order 
	WHERE LOWER(metode_bayar) = 'shopeepay'
	ORDER BY harga DESC;
/* Saya membuat asusmsi jumlah transaksi yang terbesar dilihat dari harga*/

/* Jawaban nomor 5*/
CREATE TABLE IF NOT EXISTS 
	rakamin_customer_address_tangerang as
SELECT *
FROM
	rakamin_customer_address
	WHERE LOWER(kota) = 'tangerang';
/*Melihat hasil tabel customer tangerang*/
SELECT *
FROM
	rakamin_customer_address_tangerang;
	
/* Jawaban nomor 6 */
UPDATE rakamin_customer_address_tangerang
	SET propinsi = 'Banten'
	WHERE LOWER(kota) = 'tangerang';
UPDATE rakamin_customer_address_tangerang
	SET alamat = 'Karawaci'
	WHERE id_pelanggan = 10 ;
/* Melihat hasil perubahan data */
SELECT *
FROM
	rakamin_customer_address_tangerang;
	
/* Jawaban nomor 7 */
INSERT INTO
	rakamin_customer_address_tangerang (Id_alamat, id_pelanggan, alamat, kota, propinsi)
VALUES 
	(101, 70, 'Ciledug', 'Tangerang', 'Banten');
/* Melihat hasil perubahan data */
SELECT *
FROM
	rakamin_customer_address_tangerang;

/* Jawaban nomor 8 */
DELETE FROM
	rakamin_customer_address_tangerang
	WHERE id_alamat in (54);
/* Melihat hasil perubahan data */
SELECT *
FROM
	rakamin_customer_address_tangerang;
	
/* EoF */