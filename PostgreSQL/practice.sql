-- -- CTE
WITH tmp as (
	SELECT 
		ro.id_pelanggan,
			SUM(ro.kuantitas) as total_kuantitas
	FROM 
		public.rakamin_order as ro
	GROUP by ro.id_pelanggan
		HAVING SUM(kuantitas) > 5
)
SELECT 
	tmp.id_pelanggan,
	tmp.total_kuantitas,
	rc.nama,
	rc.email
FROM  
	tmp
JOIN public.rakamin_customer as rc
	on tmp.id_pelanggan = rc.id_pelanggan;

-- select *
-- from rakamin_order
-- limit(1)


-- select
-- 	metode_bayar, kuantitas,
-- 	count(metode_bayar) as transaksi
-- -- 	sum(kuantitas)
-- from rakamin_order
-- group by 1, 2


