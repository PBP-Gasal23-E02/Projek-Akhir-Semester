// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

// Importing necessary packages and files
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// Main function to run the application
void main() {
  runApp(const LoginApp());
}

// Main application widget
class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Building the MaterialApp with the specified theme and initial route
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

// LoginPage widget, which is a StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

// State class for the LoginPage widget
class _LoginPageState extends State<LoginPage> {
  // Controllers for handling user input in text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Accessing the CookieRequest provider
    final request = context.watch<CookieRequest>();

    // Building the main scaffold with app bar and body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
              ),
            ),
            const SizedBox(height: 12.0),
            // Text field for entering the password (obscured for security)
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            // Elevated button for initiating the login process
            ElevatedButton(
              onPressed: () async {
                // Extracting username and password from text fields
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Sending login request to Django backend
                final response =
                    await request.login("http://127.0.0.1:8001/auth/login/", {
                  'username': username,
                  'password': password,
                });

                // Handling the response based on login success or failure
                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  // Navigating to the home page on successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  // Showing a snackbar with a welcome message
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("$message Welcome, $uname.")));
                } else {
                  // Showing an alert dialog on login failure
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Failed'),
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
              child: const Text('Login'),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Register Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}
