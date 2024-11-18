import 'package:flutter/material.dart';
import 'package:jersey_mobile/screens/addjersey_form.dart';
import 'package:jersey_mobile/screens/list_jerseyentry.dart';
import 'package:jersey_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You clicked the ${item.name} button!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Jersey") {
             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddJerseyFormPage(),
                    ));
          }
          else if (item.name == "Product List") {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const JerseyEntryPage()
                  ),
              );
          }
          else if (item.name == "Logout") {
              final response = await request.logout(
                  "http://127.0.0.1:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message Goodbye, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
          }
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
