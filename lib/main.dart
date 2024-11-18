import 'package:flutter/material.dart';
import 'package:jersey_mobile/screens/login.dart';
import 'package:jersey_mobile/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Jerseyku Mobile',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey,
            ).copyWith(secondary: Colors.blueGrey[800]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}