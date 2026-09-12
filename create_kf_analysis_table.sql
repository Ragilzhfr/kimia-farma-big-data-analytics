-- =========================================================
-- Membuat tabel analisa "kf_analysis_table"
-- Hasil gabungan dari: kf_final_transaction, kf_kantor_cabang, kf_product
-- Project: Rakamin_KF_Analytics | Dataset: kimia_farma
-- =========================================================

CREATE OR REPLACE TABLE `grand-sweep-508303-r4.kimia_farma.kf_analysis_table` AS
SELECT
  t.transaction_id,
  t.date,
  t.branch_id,
  c.branch_name,
  c.branch_category,
  c.kota,
  c.provinsi,
  c.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  p.product_category,
  t.price AS actual_price,
  t.discount_percentage,

  -- Persentase gross laba berdasarkan tier harga
  CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    WHEN t.price > 500000 THEN 0.30
  END AS persentase_gross_laba,

  -- Nett sales = harga setelah diskon
  t.price - (t.price * t.discount_percentage) AS nett_sales,

  -- Nett profit = nett sales x persentase gross laba
  (t.price - (t.price * t.discount_percentage)) *
  CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    WHEN t.price > 500000 THEN 0.30
  END AS nett_profit,

  t.rating AS rating_transaksi

FROM `grand-sweep-508303-r4.kimia_farma.kf_final_transaction` AS t
LEFT JOIN `grand-sweep-508303-r4.kimia_farma.kf_kantor_cabang` AS c
  ON t.branch_id = c.branch_id
LEFT JOIN `grand-sweep-508303-r4.kimia_farma.kf_product` AS p
  ON t.product_id = p.product_id;
