// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/widgets/left_drawer.dart';
import 'package:gourmet_labs/widgets/menu_card.dart';

List<Items> items = [];

class PublicationFormPage extends StatefulWidget {
  const PublicationFormPage({super.key});

  @override
  State<PublicationFormPage> createState() => _PublicationFormPageState();
}

class _PublicationFormPageState extends State<PublicationFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _author = "";
  String _title = "";
  String _issued = "";
  String _subjects = "";
  String _language = "";
  String _bookshelves = "Cookbooks and Cooking";
  String _locc = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Publication',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 65, 51),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(
          //         'https://i.ibb.co/nQYv36L/abstract-smooth-blur-background-backdrop-for-your-design-wallpaper-template-with-color-transition-gr.jpg'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Book Title",
                            labelText: "Book Title",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _title = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Author",
                            labelText: "Author",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _author = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Issued",
                            labelText: "Issued",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _issued = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Subjects",
                            labelText: "Subjects",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _subjects = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Language",
                            labelText: "Language",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _language = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Bookshelves",
                            labelText: "Bookshelves",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _bookshelves = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "LoCC",
                            labelText: "LoCC",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? value) {
                          setState(() {
                            _locc = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Input is Invalid!";
                          }
                          return null;
                        }),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 248, 224, 104)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await request.postJson(
                                "https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/publication/new-publication-flutter/",
                                jsonEncode(<String, String>{
                                  'author': _author,
                                  'title': _title,
                                  'issued': _issued,
                                  'subjects': _subjects,
                                  'language': _language,
                                  'bookshelves': _bookshelves,
                                  'locc': _locc,
                                }));
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("New item succesfully added!"),
                              ));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "There is an error, please try again."),
                              ));
                            }
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      )),
    );
  }
}
