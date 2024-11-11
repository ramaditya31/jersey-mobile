import 'package:flutter/material.dart';
import 'package:jersey_mobile/widgets/left_drawer.dart';
import 'package:jersey_mobile/widgets/jersey_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Product List", Icons.list, Color.fromRGBO(41, 51, 64, 1)),
    ItemHomepage("Add Jersey", Icons.add, Color(0xff2a2828)),
    ItemHomepage("Logout", Icons.logout, Color(0xff8b1a1a)),
  ];

  @override
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
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        // Mengubah warna ikon hamburger (menu) menjadi putih
        iconTheme: const IconThemeData(
          color: Colors.white, // Set warna ikon menjadi putih
        ),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
}
