import 'package:flutter/material.dart';
import 'package:jersey_mobile/models/jersey_entry.dart';
import 'package:jersey_mobile/screens/jersey_detailpage.dart';
import 'package:jersey_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class JerseyEntryPage extends StatefulWidget {
  const JerseyEntryPage({super.key});

  @override
  State<JerseyEntryPage> createState() => _JerseyEntryPageState();
}

class _JerseyEntryPageState extends State<JerseyEntryPage> {
  Future<List<JerseyEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object MoodEntry
    List<JerseyEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(JerseyEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jersey List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return const Center(
            child: Text(
              'Belum ada jersey kawan!',
              style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
            ),
          );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data!.map<Widget>((productData) {
                    final product = productData.fields;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product, // Kirim objek 'Fields' ke halaman detail
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (product.image != null && product.image.isNotEmpty)
                          ? ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.network(
                                product.image,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return const Text('Failed to load image');
                                },
                              ),
                            )
                          : const SizedBox(height: 120),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name.toString(), 
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text("Rp${product.price}"),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
                  }).toList(), // Tambahkan koma di sini sebelum toList()
                ),
              );

            }
          }
        },
      ),
    );
  }
}