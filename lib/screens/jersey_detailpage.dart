import 'package:flutter/material.dart';
import 'package:jersey_mobile/models/jersey_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Fields product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Jersey",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent, // Make background transparent to show gradient
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar produk di bagian atas
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: Colors.grey[200],
                child: ( product.image.isNotEmpty)
                    ? Image.network(
                        product.image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain, // Menjaga proporsi gambar
                        alignment: Alignment.center,
                      )
                    : const SizedBox(
                        height: 250,
                        child: Center(child: Text("No Image Available")),
                      ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama Produk
            Text(
              product.name as String,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Informasi Produk
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jersey Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(41, 51, 64, 1),
                      ),
                    ),
                    const Divider(),
                    
                    // Harga
                        const Text("Price:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text(
                          "Rp ${product.price}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      
                    
                    const SizedBox(height: 10),

                    // Deskripsi
                    const Text("Description:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      product.description as String,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Stok
                    const Text("Quantity:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      "${product.quantity}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Kembali
            // Back to Products Button with new style
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text("Back to Products", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff8b1a1a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}