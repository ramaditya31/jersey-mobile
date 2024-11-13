__Rama__ __Aditya__ __Rifki__ __Harmono__ __(2306165502)__

<details>
<summary> TUGAS 7 </summary>


1. **Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**

**Stateless Widget** merupakan widget yang tidak memiliki *state* internal yang berubah dan memiliki tampilan dan perilakunya tetap konstan selama siklus hidupnya. Contoh penggunaannya adalah dalam menampilkan teks statis, ikon, atau gambar yang tidak interaktif.

**Stateful Widget** merupakan widget yang memiliki *state* internal yang dapat berubah dan dapat memperbarui tampilan sebagai respons terhadap interaksi pengguna atau perubahan data. Contoh penggunaannya adalah tombol yang dapat ditekan, form input, atau animasi yang responsif.

**Perbedaan Utama**:
- **Perubahan State**: Stateless Widget tidak berubah setelah dibuat, sementara Stateful Widget dapat berubah seiring waktu.
- **Interaktivitas**: Stateless Widget bersifat statis, sedangkan Stateful Widget mampu merespons interaksi dan event.
- **Penggunaan**: Pilih Stateless Widget untuk elemen UI yang tetap, dan Stateful Widget untuk elemen yang membutuhkan perubahan atau interaksi.

2. **Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

- **MyHomePage:** Kelas ini merepresentasikan halaman utama aplikasi yang mengextends StatelessWidget, yang berarti tidak mempertahankan state apapun antar pemanggilan build.
- **Column:** Sebuah box yang menampilkan anak-anaknya dalam urutan vertikal.
- **Scaffold:** Widget yang menyediakan struktur dasar tampilan visual untuk aplikasi, termasuk AppBar dan body.
- **Container:** Sebuah box yang berisikan widget lain.
- **AppBar:** Sebuah Material Design app bar yang menampilkan judul aplikasi, navbar, dll.
- **MaterialApp:** Sebuah widget yang memberikan tampilan berdasarkan Material Design.
- **Text:** Widget yang menampilkan serangkaian karakter dengan gaya yang dapat disesuaikan.
- **Padding:** Widget yang memberikan padding pada widget anaknya.
- **InkWell:** Sebuah rectangle area yang dapat diklik dan akan memberikan efek visual saat ditekan(message box).
- **Icon:** Widget yang akan menampilkan sebuah ikon Material Design.
- **Center:** Sebuah widget yang memposisikan anaknya ke tengah.
- **GridView:** Sebuah scrollable grid yang menampilkan widget sebagai tiles.


3. **Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

`setState()` adalah metode yang digunakan dalam Stateful Widget di Flutter untuk memberi tahu framework bahwa state internal widget telah berubah. Ketika dipanggil, `setState()` akan memicu proses rebuild widget, sehingga UI akan diperbarui sesuai dengan perubahan state terbaru.

Variabel yang terdampak:

- **Variabel State:** Setiap perubahan nilai variabel ini di dalam `setState()` akan menyebabkan UI yang menggunakan variabel tersebut untuk diperbarui.

- **Properti yang Digunakan dalam `build()`:** Jika properti ini diubah di dalam `setState()`, widget yang menggunakannya akan direbuild dengan nilai terbaru.

4. **Jelaskan perbedaan antara const dengan final.**

   - `final`: Variabel yang nilainya hanya dapat diassign satu kali dan nilai ditetapkan saat runtime. Secara imutabilitas, pada final hanya referensinya yang tidak bisa diubah setelah diassign. Secara ringkas, final digunakan ketika nilai hanya perlu diassign sekali tetapi tidak diketahui hingga runtime.

   - `const`: Variabel yang nilainya bersifat konstan dan dapat ditentukan pada waktu kompilasi. Nilai ditetapkan saat compile-time dan secara imutabilitas, baik referensi maupun objeknya sepenuhnya immutable. Secara ringkas, const digunakan untuk nilai yang benar-benar tetap dan bisa diketahui pada saat kompilasi.

5. **Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**

1. Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
- Jalankan command flutter create jersey_mobile untuk membuat proyek Flutter baru.
- Berpindah direktori ke proyek flutter baru dengan menjalankan command cd jersey_mobile.

2. Membuat tiga tombol sederhana dengan ikon dan teks

**Pada main.dart :**
hapus MyHomePage(title: 'Flutter Demo Home Page') menjadi MyHomePage()

**Pada menu.dart:**


- Tambahkan teks dan card dengan menambahkan barang-barang yang dijual. Define tipe pada list seperti berikut:

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}



- Ubah sifat widget halaman dari stateful menjadi stateless. Lakukan perubahan pada bagian ({super.key, required this.title}) menjadi ({Key? key}) : super(key: key);. Selain itu, tambahkan barang-barang yang dijual (nama, icon, dan warna) dengan code berikut:

final List<ItemHomepage> items = [
  ItemHomepage("Lihat Daftar Produk", Icons.list, Color.fromRGBO(41, 51, 64, 1)),
  ItemHomepage("Tambah Produk", Icons.add, Color(0xff2a2828)),
  ItemHomepage("Logout", Icons.logout, Color(0xff8b1a1a)),
];


- Ubah method Widget build(BuildContext context) menjadi seperti berikut:

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Jerseyku Mobile App',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Menghapus backgroundColor untuk menggunakan warna transparan
      backgroundColor: Colors.transparent,
      elevation: 0, // Menghilangkan bayangan pada AppBar
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffd3b89c),
              Color(0xffd3b89c),
              Color.fromRGBO(63, 82, 83, 1.0),
              Color.fromRGBO(63, 82, 83, 1.0),
              Color(0xffd3b89c),
              Color(0xffd3b89c),
            ],
            stops: [0.0, 0.05, 0.05, 0.95, 0.95, 1.0],
          ),
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      // Menyusun widget secara vertikal dalam sebuah kolom.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16.0),
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Welcome to Jerseyku Mobile App',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: items.map((ItemHomepage item) {
                    return ItemCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


- Membuat widget stateless baru untuk menampilkan card dengan code berikut:

import 'package:flutter/material.dart';
import 'item_homepage.dart'; 

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


3. Memunculkan Snackbar

Tambahkan kode berikut di dalam child InkWell

onTap: () {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
    );
},

</details>

<details>

<summary>TUGAS 8</summary>

1. **Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**

Dalam Flutter, `const` digunakan untuk menginisialisasi objek yang nilai tetapnya ditentukan selama compile-time, sehingga meningkatkan performa dan efisiensi memori karena objek menggunakan instance yang sama dan melindungi nilai dari perubahan yang tidak diinginkan. Idealnya, `const` cocok untuk widget statis, nilai yang tetap, dan koleksi dengan isi konstan. Namun, sebaiknya tidak digunakan untuk data yang berubah selama runtime, widget yang memiliki state, atau data yang diperoleh dari API atau database, serta widget yang tergantung pada konteks.

2. **Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**

Column digunakan untuk menyusun widget secara vertikal (atas ke bawah), sedangkan Row digunakan untuk menyusun widget secara horizontal (kiri ke kanan).

Contoh implementasi:
- Column digunakan untuk menyusun judul dan form fields di addjersey_form.dart
- Row digunakan untuk menyusun card NPM, Nama, dan Kelas di menu.dart

3. **Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**

Pada tugas kali ini saya menggunakan TextFieldForm pada semua input rincinya sebagai berikut:

- Jersey Name (text)
- Description (text)
- Price (number)
- Quantity (number)

Elemen input Flutter lain yang tidak saya gunakan dalam tugas kali ini adalah: `Switch`, `Slider`, `TimePicker`, `CheckboxListTile`

4. **Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**

Pada tugas ini tema aplikasi di main.dart menggunakan ThemeData dan colorScheme untuk menetapkan warna utama aplikasi. Tema ini dapat diimplementasikan secara konsisten di seluruh aplikasi melalui penggunaan Theme.of(context). Tetapi karena saya memilih untuk menggunakan warna gradient untuk beberapa elemen-elemen pada Flutter saya, maka tidak seluruhnya mengimplementasikan primary colour.

5. **Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**

Dalam tugas kali ini, saya menggunakan `Navigator.push()` dan `Navigator.pushReplacement()` untuk navigasi. Navigasi ini diimplementasikan dalam drawer untuk berpindah ke halaman utama dan form penambahan jersey. Saya juga mengimplementasikan tombol "Tambah Item" pada card yang juga menggunakan `MaterialPageRoute` untuk mengarah ke form tersebut.

</details>