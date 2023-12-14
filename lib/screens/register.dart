// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/screens/login.dart';

// Main function to run the application
void main() {
  runApp(const RegisterApp());
}

// Main application widget for the register feature
class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Building the MaterialApp with the specified theme and initial route
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const RegisterPage(),
    );
  }
}

// RegisterPage widget, which is a StatefulWidget
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// State class for the RegisterPage widget
class _RegisterPageState extends State<RegisterPage> {
  // Controllers for handling user input in text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Accessing the CookieRequest provider
    final request = context.watch<CookieRequest>();

    // Building the main scaffold with app bar and body
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // Column layout for organizing widgets vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text field for entering the username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 12.0),
            // Text field for entering the password (obscured for security)
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            // Text field for confirming the password (obscured)
            TextField(
              controller: _passwordConfirmationController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.black),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            // Elevated button for initiating the registration process
            ElevatedButton(
              onPressed: () async {
                // Extracting username and password from text fields
                String username = _usernameController.text;
                String password = _passwordController.text;
                String passwordConfirmation =
                    _passwordConfirmationController.text;

                // Checking if password and confirmation match
                if (password != passwordConfirmation) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                        content: Text(
                            "Register failed, password confirmation incorrect.")));
                  return;
                }
                // Sending registration request to Django backend
                final response =
                    await request.post("http://127.0.0.1:8001/auth/register/", {
                  'username': username,
                  'password': password,
                });

                // Handling the response based on registration success or failure
                if (response['status']) {
                  String message = response['message'];

                  // Navigating to the login page on successful registration
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                  // Showing a snackbar with a success message
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text("$message")));
                } else {
                  // Showing an alert dialog on registration failure
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Register failed.'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
