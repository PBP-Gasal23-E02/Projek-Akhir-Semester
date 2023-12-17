// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/wishlist/models/model_wishlist.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/apps/wishlist/screens/menu_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/widgets/left_drawer.dart';

// Sebuah list untuk menyimpan item yang ditambahkan melalui formulir.
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
    // Mendapatkan instance dari CookieRequest menggunakan Provider
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Wishlist Form',
          ),
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // TextFormField untuk memasukkan nama judul Wishlist
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
            // TextFormField untuk memasukkan deskripsi Wishlist
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
            // Tombol untuk menyimpan Wishlist baru
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var _dateAdded = DateTime.now();
                      final response = await request.postJson(
                          "https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/wishlist/create-flutter/",
                          jsonEncode(<String, String>{
                            'title': _title,
                            'description': _description,
                            'dateAdded':
                                "${_dateAdded.year}-${_dateAdded.month}-${_dateAdded.day}",
                          }));
                      if (response['status'] == 'success') {
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
