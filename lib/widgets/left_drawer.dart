import 'package:flutter/material.dart';
import 'package:jersey_mobile/screens/addjersey_form.dart';
import 'package:jersey_mobile/screens/menu.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffd3b89c),
                  Color(0xffd3b89c),
                  Color.fromRGBO(63, 82, 83, 1.0),
                  Color.fromRGBO(63, 82, 83, 1.0),
                  Color(0xffd3b89c),
                  Color(0xffd3b89c),
                ],
                stops: [0.0, 0.05, 0.05, 0.95, 0.95, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Column(
              children: [
                Text(
                  'Jerseyku Official Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  """“Become a legend? But I am already.” 

                                      - Eric Cantona""",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Redirection to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Jersey'),
            // Redirection to AddJerseyFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddJerseyFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
