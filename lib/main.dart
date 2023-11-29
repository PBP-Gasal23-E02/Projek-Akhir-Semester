import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Creating a provider for CookieRequest
    return Provider(
      create: (_) {
        // Creating an instance of CookieRequest
        CookieRequest request = CookieRequest();
        return request;
      },
      // Defining the root MaterialApp
      child: MaterialApp(
        title: 'Flutter App',
        // Setting the theme
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        // Setting the initial route to the LoginPage
        home: const LoginPage(),
      ),
    );
  }
}
