/* Created by: Tegas Gagas Impian P N */

/* Jawaban nomor 1 */
SELECT 
	rakamin_customer.nama, 
	rakamin_customer.email, 
	rakamin_customer.bulan_lahir, 
	rakamin_customer.tanggal_registrasi
FROM
	public.rakamin_customer
WHERE
	(rakamin_customer.tanggal_registrasi BETWEEN '2012-01-01' and '2012-03-31') and
	(rakamin_customer.email LIKE '%roketmail.com' or rakamin_customer.email LIKE '%yahoo.com') and
	(LOWER(rakamin_customer.bulan_lahir) IN ('januari', 'februari', 'maret'))
ORDER by rakamin_customer.tanggal_registrasi;	

/* Jawaban nomor 2 */
SELECT 
	rakamin_order.id_order, 
	rakamin_order.id_pelanggan, 
	rakamin_order.harga,
	(rakamin_order.harga * rakamin_order.ppn + rakamin_order.harga) as harga_ppn, -- Harga setelah PPN
	CASE WHEN (rakamin_order.harga * rakamin_order.ppn + rakamin_order.harga) <= 20000 then 'LOW' 
		 WHEN (rakamin_order.harga * rakamin_order.ppn + rakamin_order.harga) <= 50000 then 'MEDIUM' 
		 ELSE 'HIGH'
		 END as spending_bucket
FROM
	public.rakamin_order
ORDER by rakamin_order.harga DESC; -- Urutan harga setelah PPN dan sebelum PPN sama
	
/* Jawaban nomor 3 */
SELECT
	rakamin_order.id_merchant, 
		count(rakamin_order.id_merchant) as jumlah_order, -- Jumlah_order diambil dari kumulatif id_merchant
	sum(rakamin_order.harga) as jumlah_pendapatan -- Diambil kumulatif dari harga setiap order
FROM 
	public.rakamin_order
GROUP by rakamin_order.id_merchant
ORDER by jumlah_pendapatan DESC; -- Jumlah pendapatan sebelum PPN

/* Jawaban nomor 4 */
SELECT
	rakamin_order.metode_bayar, 
		count(rakamin_order.metode_bayar) as frekuensi -- Jumlah penggunaan metode bayar
FROM public.rakamin_order
GROUP by rakamin_order.metode_bayar
	HAVING count(rakamin_order.metode_bayar) > 10
ORDER by frekuensi DESC;

/* Jawaban nomor 5 */
SELECT 
	max(pelanggan.jumlah_pelanggan) as kota_pelanggan_terbanyak,
	min(pelanggan.jumlah_pelanggan) as kota_pelanggan_terkecil
FROM -- Mendefinisikan jumlah pelanggan untuk tiap kota
(
	SELECT 
		rakamin_customer_address.kota,
			count(kota) as jumlah_pelanggan
	FROM public.rakamin_customer_address
	GROUP by rakamin_customer_address.kota
	ORDER by jumlah_pelanggan
) as pelanggan;

/* Jawaban nomor 6 */
SELECT 
	rm.id_merchant,
	rm.nama_merchant,
	tmp.metode_bayar,
	tmp.frekuensi
FROM 
	public.rakamin_merchant as rm 
LEFT JOIN -- Mengambil kolom nama merchant dari rm
( 
	SELECT -- Mendefinisikan frekuensi metode bayar setiap merchant dan disimpan sebagai tmp
		ro.id_merchant,
		ro.metode_bayar,
			count(ro.metode_bayar) as frekuensi
	FROM public.rakamin_order as ro
	GROUP by ro.id_merchant, ro.metode_bayar
	ORDER by ro.id_merchant, ro.metode_bayar
) as tmp
		on rm.id_merchant = tmp.id_merchant
ORDER by rm.id_merchant, tmp.metode_bayar;

/* Jawaban nomor 7 */
WITH tmp as -- Menentukan jumlah kuantitas untuk setiap cust dan disimpan sebagai tmp
(
	SELECT 
		ro.id_pelanggan,
			sum(ro.kuantitas) as total_kuantitas
	FROM 
		public.rakamin_order as ro
	GROUP by ro.id_pelanggan
		HAVING sum(ro.kuantitas) > 5
)
SELECT 
	tmp.id_pelanggan,
	tmp.total_kuantitas,
	rc.nama,
	rc.email
FROM  
	tmp
LEFT JOIN  -- Mengambil kolom nama dan email cust dari rm
	public.rakamin_customer as rc
		on tmp.id_pelanggan = rc.id_pelanggan
ORDER by tmp.total_kuantitas DESC;
		
/* EoF */