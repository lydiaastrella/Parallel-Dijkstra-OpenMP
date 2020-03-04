# Petunjuk Penggunaan Program
Untuk menjalankan program serial, gunakan perintah ‘make serial’. <br>
Untuk menjalankan program paralel dengan jumlah thread 6, gunakan perintah ‘make paralel’. <br>
Setelah menjalankan perintah make, masukan jumlah node  yang diinginkan.

# Pembagian Tugas
| Nama | NIM | Pembagian Tugas |
| ------ | ------ | ------ |
| Lydia Astrella Wiguna | 13517019 | Inisiasi, Implementasi program paralel berdasarkan program serial, Dokumen |
| Karina Iswara | 13517031 | Implementasi program paralel berdasarkan program serial, Dokumen |

# Deskripsi Solusi Paralel
Setelah pengguna memasukkan jumlah Node yang diinginkan untuk dicari jarak terdekatnya, graf diinisialisasi. Lalu dengan menggunakan pragma omp parallel for sebanyak jumlah thread (6). Dengan iterasi for yang dibagi-bagi ke 6 buah thread. Algoritma dijkstra yang dijalankan setiap iterasi merupakan dijkstra untuk mendapatkan jarak terdekat dari suatu node. Jadi jumlah iterasi dijkstra sebanyak jumlah node yang ditentukan pengguna.  Lalu hasil dari dijkstra yang berupa array jarak terdekat dari suatu node ke semua node yang ada disusun menjadi matriks yang berisi jarak terdekat dari semua node ke semua node yang ada pada graf. Setelah matriks terbentuk, matriks di-print ke file output.

## Analisis Solusi
Pada solusi paralel yang kami lakukan, waktu eksekusi yang dibutuhkan seharusnya menjadi lebih cepat jika dibandingkan dengan program serial karena pencarian jarak terdekat dari setiap sumber node pada solusi paralel dilakukan pada beberapa thread secara bersamaan sedangkan solusi serial mengeksekusi jarak terdekat dari semua sumber node dalam 1 proses (dalam solusi paralel beban kerja terbagi menjadi sejumlah thread).  Namun tentu saja dapat terjadi kasus dimana solusi paralel tidak lebih cepat dibandingkan solusi serial (bergantung pada jumlah thread dan node). Hal ini disebabkan oleh overhead pembuatan thread dan penghacuran thread.

Seharusnya terdapat kemungkinan masih ada solusi yang memberikan kinerja lebih baik. Sebagai contohnya membuat paralel pada pencarian jarak terdekat dari satu titik (node) ke titik lainnya. Yakni mengimplementasikan algoritma paralel langsung dalam fungsi dijkstra yang terdapat dalam algoritma kami.

# Jumlah Thread
Thread yang digunakan berjumlah 6 karena untuk proses komputasi, menggunakan jumlah thread lebih dari jumlah host/core tidak menambah performa. Sedangkan untuk jumlah thread di bawah 6 memakan waktu eksekusi lebih lama dari 6 thread.

# Pengukuran Kinerja
### N = 100
Serial : <br>
![Serial-100](img/serial-100.png)


Paralel : <br>
![Paralel-100](img/paralel-100.png)


### N = 500
Serial : <br>
![Serial-500](img/serial-500.png)

Paralel : <br>
![Paralel-500](img/paralel-500.png)

### N = 1000
Serial : <br>
![Serial-1000](img/serial-1000.png)

Paralel : <br>
![Paralel-1000](img/paralel-1000.png)

### N = 3000
Serial : <br>
![Serial-3000](img/serial-3000.png)

Paralel : <br>
![Paralel-3000](img/paralel-3000.png)

# Analisis Perbandingan Kinerja
Dari hasil pengukuran kinerja pada serial dan paralel dengan N = 100, 500, 1000, dan 3000, dapat dilihat bahwa waktu pengukuran hasil dari algoritma Dijkstra Paralel memiliki waktu performa yang lebih kecil (lebih cepat). Hal ini disebabkan oleh beban untuk menjalankan algoritma Dijkstra pada algoritma Dijkstra Paralel dibagi menjadi 6, yakni sejumlah thread sedangkan pada algoritma Dijkstra Serial semua beban tersebut ditangani sendiri.
