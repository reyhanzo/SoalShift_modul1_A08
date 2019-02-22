# SoalShift_modul1_A08
hasil pengerjaan soal shift modul 1 A08

1.
```
#!/bin/bash
a=1

cd ~/Downloads

unzip nature.zip

for file in nature/*.jpg
do
base64 -d $file | xxd -r > "images/"$a"_pic.jpg"
a=$((a+1))
done
```
a. pindah direktori di Downloads
b. lalu unzip file yg didownload dari drive (nature.zip) dan akan muncul di file Downloads 
(jika tidak bisa unzip, perlunya menggunakan perintah  “sudo install apt-get unzip”)
c. lalu didalam file nature, terdapat file .jpg tetapi tidak bisa dibuka karena masih berbentuk code base64, maka kita perlu men-decode dari base64 menjadi file aslinya dengan “base64 -d” dan hasil decode itu akan berubah dalam bentuk hexdump.
d. karena menjadi hexdump, kita perlu me-reverse file hexdump tersebut menjadi file aslinya dengan menambahkan “xxd -r” 
e. agar file bisa berurutan, diberi variable a (dari 1) sebagai nama file agar urut. Jika ingin tertata, file tersebut harus berada di file baru yang bernama “images”.
f. setelah melakukan proses ini, file tersebut akan berubah menjadi  kumpulan foto (file asli tersebut)
g. tambahkan cron sesuai konteks soal.
14 14 14 2 * /bin/bash ~/script1.sh
* * * 2 5 /bin/bash ~/script1.sh

2.
```
#(a)
echo "2a)"
awk -F ',' '{if($7 -eq '2012') a[$1]+=$10} END {for(x in a) print a[x] , x}' WA_Sales_Products_2012-14.csv | sort -nr | head -1 | awk '{print $2,$3}'
```
Penjelasan :
awk -F, untuk mencari data pada file.
Apabila field ke-7 (year) bernilai 2012 maka array dengan setiap nama negara akan menyimpan jumlah dari field ke-10 (quantity). 
Print quantity dan nama negara. 
Mengurutkan numeric reverse yaitu dari quantity yang terbesar ke terkecil.
Mengambil baris pertama yaitu baris dengan negara yang memiliki quantity terbanyak. Dari hasil sebelumnya, tercetak dengan format Quantity,Nama_Negara (nama_negara dipisahkan spasi jadi masuk field selanjutnya).
Karena yang diinginkan adalah nama negaranya saja maka digunakan awk  '{print $2,$3}' pada bagian akhir. Output yang dihasilkan berdasarkan script diatas yaitu “United States”.

```
echo "2b)"
awk -F, '{if($1 -eq "United States" && $7 == "2012") a[$4]+=$10} END {for(x in a) print a[x], x}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk '{print $2,$3}'
```
Sama dengan nomor dua, if($7 == '2012' && $1=="United States") iter[$4]+=$10 dengan tambahan syarat yaitu negara yang diinginkan adalah “United States” (berdasarkan hasil dari 2a) 
Menyimpan quantity dari product line pada array. Mencetak Quantity dan Product_Line. 
Mengurutkan dari terbesar ke terkecil dan mengambil 3 baris pertama yaitu baris yang memiliki quantity terbanyak dan product line-nya.
Karena yang diinginkan hanya nama product line, digunakan perintah awk '{print $2,$3}'. Output yang dihasilkan adalah "Personal Accessories", "Camping Equipment", dan "Outdoor Protection"

```
echo "2c)"
echo "Personal Accesories : "
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Personal Accessories") a[$6]+=$10} END {for(x in a) print a[x],x}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk '{print $2,$3, $4}'

echo "Camping Equipment :"
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Camping Equipment") a[$6]+=$10} END {for(x in a) print a[x],x}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk '{print $2, $3, $4}'

echo "Outdoor Protection : "
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Outdoor Protection") a[$6] += $10} END {for(x in a) print i[x],x}' WA_Sales_Products_2012-14.csv | sort -nr| head -3 | awk '{print $2,$3,$4}'

```
Berdasarkan output yang dihasilkan pada 2b, akan dicari tiga produk yang memberikan penjualan terbanyak. Menggunakan 3 awk. Sesuai dengan Produk Line nya.
Menyimpan quantity dari product line pada array. Mencetak Quantity dan Product_Line. 
Mengurutkan dari terbesar ke terkecil dan mengambil 3 baris pertama yaitu baris yang memiliki quantity terbanyak dan product line-nya.
Karena yang diinginkan hanya nama product line, digunakan perintah awk '{print $2,$3}'.

3.
```
#!/bin/bash

name='password'
number=0
suffix=1
while test -e "$name$suffix.txt";
do
(( ++number ))
suffix="$(printf -- '%d' "$number")"
done

PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
echo "$PASS" >> "$name$suffix.txt"
```
a. pada awalnya, nama file harus bertuliskan “password” yang berisi kumpulan char secara random dan tidak boleh sama dengan file password yg lain. Yang pertama, membuat file berurutan yang berisi kumpulan char dalam satu kata (dengan while) dengan konteks password1.txt, password2.txt, …., dst.
b. untuk membuat kumpulan char tersebut random, maka dideklarasikan “PASS” agar bisa menyusun kumpulan char (a-z, A-Z, 0-9) secara random. Dan dibuat sesuai konteks soal (panjang sebanyak 12 char).
c. setelah program dibuat, di bash sebanyak lebih dari 2x, agar bisa melihat perbedaan terhadap kumpulan char yg dibuat (seperti gambar di bawah). 

5.
```
SCRIPT
awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF <= 12 {print}' >> /home/lutfiy/modul1/syslog5.log
```
    a. Untuk menampilkan string “cron” yang tidak bersifat case sensitive dengan mengunakan perintah “/cron/ || /CRON/” sedangkan untuk menampilkan string yang tidak mengandung kata “sudo” dengan menggunakan perintah “!/sudo/”
    b. Perintah “NF<=12” untuk menampilkan jumlah field pada baris yang berjumlah kurang dari 13 teratas.
    c. Perintah “>> /home/andhika/modul1/no_5_sisop.log” untuk memasukkan record tadi ke dalam file logs pada direktori.

```
nomor 5
2-30/6 * * * * /bin/bash/home/lutfiy/soal5.sh

```
    d. Membuat crontab jalankan dengan mengetikkan crontab -l

