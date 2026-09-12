# Kimia Farma – Big Data Analytics (Performance Analytics 2020–2023)

Project ini merupakan bagian dari Virtual Internship Experience (VIX) Rakamin Academy x Kimia Farma,
sebagai Big Data Analytics Intern. Tugas utama: mengevaluasi kinerja bisnis Kimia Farma periode 2020–2023.

## Dataset
- kf_final_transaction.csv — data transaksi & rating transaksi
- kf_inventory.csv — data stok produk per cabang
- kf_kantor_cabang.csv — profil & rating cabang
- kf_product.csv — katalog & kategori produk

## Tabel Analisa
Tabel `kf_analysis_table` dibuat dari hasil JOIN 3 tabel sumber (kf_final_transaction, kf_kantor_cabang,
kf_product), berisi 15 kolom wajib + 2 kolom tambahan (branch_category, product_category), lengkap
dengan perhitungan persentase_gross_laba, nett_sales, dan nett_profit.

Syntax lengkap: lihat file `create_kf_analysis_table.sql`.

## Dashboard
Dashboard interaktif dibuat di Google Looker Studio, terhubung ke tabel kf_analysis_table.
🔗 Link dashboard: (https://datastudio.google.com/reporting/30cb182e-aabe-4c9e-8982-e64a571ba7a9)

