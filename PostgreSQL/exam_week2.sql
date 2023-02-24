/* Nomor 9 */
select 
	nama
from rakamin_customer
where (nama like 'F%') and (umur > 20);

/* Nomor 10 */
select
	case when tanggal_pembelian < '2018-01-01'and metode_bayar = 'ovo' then 1
		else 0
	end as lala
from rakamin_order;

/* Nomor 11 */
select
	max(harga) as haha
from rakamin_order;


/* Nomor 12 */
select
	kota,
	count(1) as siapa
from rakamin_customer_address
group by 1;

/* Nomor 13 */
with ayam 
as (
	select
		id_pelanggan,
		avg(harga) as ikan
	from rakamin_order
	group by 1
)
select max(ikan) as beli
from ayam;

/* Nomor 14 */
select
	rc.telepon,
	rca.kota
from rakamin_customer as rc
left join rakamin_customer_address as rca
	on rca.id_pelanggan = rc.id_pelanggan
where (rc.telepon like '62896%') and (rca.kota = 'Jakarta Selatan');

/* Nomor 15 */
with
tmp as (
	select id_pelanggan, avg(harga) as avg_harga
	from rakamin_order
	group by 1
)
select avg_harga
from tmp
order by avg_harga;
