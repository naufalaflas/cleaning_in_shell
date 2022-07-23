#!/bin/bash

csvstack 2019-Oct-sample.csv 2019-Nov-sample.csv > 2019_oct_nov_sample.csv

csvcut -c 2,3,4,5,6,7,8 2019_oct_nov_sample.csv > sudah_di_seleksi_kolom.csv

csvgrep -c "event_type" -m purchase sudah_di_seleksi_kolom.csv > sudah_di_filter_baris_purchase.csv

csvcut -c 5 sudah_di_filter_baris_purchase.csv | awk -F "." '{print $1,$NF}' >  2019_kategori_produk_nama.csv

csvcut -c 1,2,3,4,6,7 sudah_di_filter_baris_purchase.csv > kolom_kategori_dihapus.csv

csvjoin kolom_kategori_dihapus.csv 2019_kategori_produk_nama.csv > data_clean.csv

rm 2019_oct_nov_sample.csv
rm sudah_di_seleksi_kolom.csv
rm sudah_di_filter_baris_purchase.csv
rm kolom_kategori_dihapus.csv
rm 2019_kategori_produk_nama.csv

echo selesai
