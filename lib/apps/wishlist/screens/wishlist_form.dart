// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/wishlist/models/model_wishlist.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/apps/wishlist/screens/menu_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/widgets/left_drawer.dart';

// A list to store items added through the form.
List<Wishlist> items = [];

class WishlistFormPage extends StatefulWidget {
  const WishlistFormPage({super.key});

  @override
  State<WishlistFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<WishlistFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    // Accessing the CookieRequest provider
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar
        title: const Center(
          child: Text(
            'Add Wishlist Form',
          ),
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      // OK TODO: Add the previously created drawer here
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Text input for Item Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Title Name",
                  labelText: "Title Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _title = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Title cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            // Text input for Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            // Save button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Send data to Django and wait for response
                      final response = await request.postJson(
                          "http://127.0.0.1:8000/wishlist/create-flutter/",
                          jsonEncode(<String, String>{
                            'title': _title,
                            'description': _description,
                          }));
                      if (response['status'] == 'success') {
                        // Show success message and navigate to the home page
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("New item successfully saved!"),
                        ));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWishlistPage()),
                        );
                      } else {
                        // Show error message if there is an issue
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("There is an error, please try again."),
                        ));
                      }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
