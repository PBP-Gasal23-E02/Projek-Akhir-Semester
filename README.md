### 🧝🏼KELOMPOK E02🧝🏼
| Nama | NPM |
| --- | --- |
| Aaron Kwek | 2206827610 |
| Erstevan Laurel Lucky Almeida | 2206082493 |
| Putri Indah Lestari | 2206814412 |
| Rakha Bima Arya Sambarana | 2206083262 |
| Vina Myrnauli Abigail Siallagan | 2206825776 |
<hr>

### 🥖🥗GOURMETLABS🥗🥖

> **GourmetLabs** adalah aplikasi yang menyediakan informasi, resep, dan pengalaman membaca yang menarik tentang budaya kuliner dari berbagai negara serta memungkinkan pengguna untuk menikmati bacaan eksklusif terkait kuliner.
<hr>

## About GourmetLabs
Bayangkan kita menjelajahi suatu aplikasi di mana kita dengan mudah menemukan kekayaan budaya kuliner yang tidak terbatas. Selamat datang di GourmetLabs, portal kuliner yang menghadirkan kekayaan budaya kuliner. Didukung dengan tampilan antarmuka yang ramah pengguna, GourmetLabs memberikan pengalaman membaca mengenai informasi kuliner yang menarik dan menyenangkan.

Di GourmetLabs, Anda akan menemukan informasi bacaan terkait cooking books. Mulai dari sejarah, resep, hingga ilmu dan pengetahuan terkait masakan yang berasal dari mancanegara. Pengguna dapat dengan mudah mencari buku bacaan terkait kuliner yang sesuai dengan preferensinya. 

Pengguna yang mendaftarkan akunnya sebagai Admin dapat menambahkan informasi bacaan terkait cooking books yang dimilikinya di website GourmetLabs. Hal ini memungkinkan pembaca untuk menikmati bacaan terkait kuliner secara eksklusif di GourmetLabs. Pembaca juga dapat menulis ulasan dan feedback terkait buku yang dipublikasikan.

GourmetLabs memberikan pengalaman membaca yang menarik dan menyenangkan sehingga diharapkan dapat meningkatkan minat membaca pada masyarakat. Tak hanya itu, GourmetLabs juga dapat diakses melalui berbagai macam perangkat, mulai dari desktop pc, laptop, tablet, hingga smartphone. Hal ini memungkinkan pengguna dapat mengakses website GourmetLabs di manapun dan kapanpun.
<br>

## List of Modules, Pages, and Data Sources
**1. Halaman *Authentication*** 
> Mengelola proses otentikasi pengguna (pembaca *premium* atau *regular* dan admin), di antaranya terdapat *register* dan *login*. Selain itu, terdapat mode *Night Mode* yang berfungsi untuk meningkatkan pengalaman pengguna saat menggunakan aplikasi pada malam hari atau dalam kondisi cahaya yang rendah.

**2. Modul Kategori Buku Masak** --- Aaron Kwek
> Menampilkan daftar buku masak dari sumber dataset katalog buku. Pembaca dapat memilih kategori buku sesuai yang mereka minati.

**3. Halaman *detail* Buku Masak**
> Terdiri dari *cover*, judul, sinopsis, dan ulasan atau *review* dari pembaca.

**4. Modul Penilaian dan Ulasan** ---  Putri Indah Lestari
> Memungkinkan pengguna untuk dapat memberikan ulasan pada buku yang telah dibaca sehingga dapat membantu pengguna lainnya dalam memilih buku bacaan yang tepat.

**5. Modul Publikasi** --- Erstevan Laurel Lucky Almeida
> Ruang bagi Admin untuk mempublikasikan karya-karyanya secara eksklusif.

**6. Modul *Wishlist* Buku** --- Vina Myrnauli Abigail Siallagan
> Memungkinkan pengguna user untuk menandai atau menyimpan buku yang mereka minati serta admin untuk menyimpan dan menambah buku sementara. Pengguna dapat kembali ke *wishlist* untuk melihat daftar buku yang sudah ditandai dan dapat memilih untuk membaca buku.

**7. Modul Daftar Buku Masak Favorit atau *Bookmark*** --- Rakha Bima Arya Sambarana
> Pengguna dapat menandai buku masak favorit mereka. Dengan *bookmark*, pengguna dapat dengan mudah menemukan dan merujuk kembali ke buku masak favorit mereka. 

**8. Halaman Informasi *User***
> Menampilkan informasi user, di antaranya adalah nama pengguna, *wishlist* buku yang ingin dibaca, daftar buku masak favorit atau *bookmark*, status pengguna (Admin atau Pembaca), *logout*, dan lainnya. 
<br>

## User Roles and Their Descriptions
**1. Pembaca**
> Melihat informasi buku dan memberi *review* atau komentar.

**2. Admin**
> Merilis atau menambahkan buku.
<br>

## Alur Pengintegrasian dengan *Web Service* untuk Terhubung dengan Aplikasi Web yang Sudah Dibuat Saat Proyek Tengah Semester
* Pertama, kami mengubah atau memodifikasi modul-modul yang ada pada Proyek Tengah Semester agar dapat mengimplementasikan *REST API* menggunakan *serializers* dan *JsonResponse* agar tiap data pada server Django. 

* Kedua, kami juga menggunakan *library dart pbp_django_auth* untuk mengimplementasikan *authentication* dengan *cookie*.

* Ketiga, kita juga membuat tampilan dengan memakai *widget* pada Flutter yang terintegrasi dengan *API Django* yang menggunakan *event-handling* dan *asynchronous programming* agar pengalaman *user* menjadi lebih menarik dan interaktif. 
<br>

## Alur *Build*, *Run*, dan *Release*
**1. Build**
Jika ingin membuat aplikasi, langkah pertama adalah menginstal Flutter. Setelah sudah berhasil instal dan dependensinya, aplikasi dapat di *build*. 

Berikut adalah perintah untuk memulai inisialisasi aplikasi:
`flutter create <NAMA_APLIKASI>`

Setelah selesai, kode dapat dimasukkan ke dalam file `main.dart` sebagai file utama untuk aplikasi atau dapat ditambahkan ke dalam file baru di dalam folder lib/. Dengan mengikuti langkah-langkah ini, aplikasi siap dijalankan. 
<br>

**2. Run**
Berikut adalah perintah untuk menjalankan aplikasi secara lokal:
`flutter run`

Kemudian, pilihlah *browser* untuk menjalankan aplikasi, contohnya *Chrome, Browser Windows,* dan lainnya. Saat dijalankan di *browser*, aplikasi dapat diakses melalui *localhost*.
<br>

**3. Deploy dan Release**
Aplikasi dapat didistribusikan melalui *Github Releases*. Pengaturan Dasar untuk Persetujuan Aplikasi Flutter Untuk publikasi aplikasi di App Center, aplikasi Flutter harus ditandatangani atau diotorisasi menggunakan *key* agar aplikasi yang dirilis memiliki keabsahan yang dijamin. Oleh karena itu, kita akan membuat *key* untuk aplikasi dan mengaturnya untuk otomatisasi agar skrip CI/CD berjalan dengan baik.
<br>

Berikut adalah langkah-langkahnya:
1. Pertama, membuat *keystore*.
Berikut adalah perintah yang harus dijalankan di terminal bagi pengguna Mac OS atau Linux:
`keytool -genkey -v -keystore ~/release-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release`

Sedangkan, berikut adalah perintah ang harus dijalankan di terminal bagi pengguna Windows:
`keytool -genkey -v -keystore %userprofile%\release-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias release`

2. Pindahkan file *keystore* ke dalam folder proyek aplikasi dan tambahkan sintaks berikut ke file `.gitignore` di folder proyek aplikasi agar *keystore* tidak diikutsertakan sebagai file dalam repositori Git.

3. Bukalah file `/android/app/build.gradle`. Cari bagian `buildTypes` dan ubahlah bagian tersebut.

4. Lalu, modifikasikan skrip *GitHub Actions* (jika belum ada) dan membuat skrip baru untuk *build* di *App Center*.
<br>

Berikut adalah langkah-langkah membuat skrip *GitHub Actions*:
1. Pertama, Hasilkan `string base64` sebagai representasi file *keystore* yang akan disimpan sebagai variabel lingkungan nanti. kemudian, jalankan perintah `openssl base64 -in release-keystore.jks` di folder *root* untuk menghasilkan `string base64`. Simpan *string* tersebut untuk sementara.

2. Kedua, buatlah *secret repository* di repositori Github dengan ketentuan:
`GH_TOKEN`: berisi Token Akses Pribadi GitHub dari salah satu admin repositori untuk *release* otomatis 
`KEY_JKS`: berisi string base64 dari file keystore yang telah dibuat sebelumnya 
`KEY_PASSWORD`: berisi kata sandi yang digunakan saat membuat file *keystore* 

<br>

[![Staging](https://github.com/PBP-Gasal23-E02/Projek-Akhir-Semester/actions/workflows/staging.yml/badge.svg)](https://github.com/PBP-Gasal23-E02/Projek-Akhir-Semester/actions/workflows/staging.yml) [![Pre-Release](https://github.com/PBP-Gasal23-E02/Projek-Akhir-Semester/actions/workflows/pre-release.yml/badge.svg)](https://github.com/PBP-Gasal23-E02/Projek-Akhir-Semester/actions/workflows/pre-release.yml) [![Release](https://github.com/PBP-Gasal23-E02/Projek-Akhir-Semester/actions/workflows/release.yml/badge.svg)](https://github.com/PBP-Gasal23-E02/Projek-Akhir-Semester/actions/workflows/release.yml) [![Build status](https://build.appcenter.ms/v0.1/apps/c0066952-3bf4-4cab-ae2d-ea2272cb636e/branches/main/badge)](https://appcenter.ms)
<br>
link app : install.appcenter.ms/users/aaron.kwek-ui.ac.id/apps/gourmetlabs/distribution_groups/public
<br> 
## Berita Acara
[LINK BERITA ACARA](https://docs.google.com/spreadsheets/d/1n_Jr3YN25hIqkiWLAXWucOkXikMt0hyNhiT75TY3zc8/edit#gid=226615022)
