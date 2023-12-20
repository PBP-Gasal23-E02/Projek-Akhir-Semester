
import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/publication/screens/new_publication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gourmet_labs/apps/YourBook/models/Buku.dart';
import 'package:gourmet_labs/widgets/left_drawer.dart';

class YourPublication extends StatefulWidget {
  const YourPublication({Key? key}) : super(key: key);

  @override
  _YourPublicationState createState() => _YourPublicationState();
}

class _YourPublicationState extends State<YourPublication> {
  // Function to fetch product data from the server
  Future<List<Buku>> fetchProduct() async {
    var url = Uri.parse('https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/get-buku-user/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Buku> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Buku.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    // Building the scaffold for the product page
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Publication'),
        backgroundColor: const Color.fromARGB(255, 34, 45, 130),
        foregroundColor: Colors.white,
      ),
      // Adding a left drawer to the scaffold
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        // Using FutureBuilder to handle asynchronous data fetching
        future: fetchProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            // Displaying a loading indicator while data is being fetched
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              // Displaying a message if no item data is available
              return const Column(
                children: [
                  Text(
                    "No item data.",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              // Building a ListView to display the fetched product items
              return ListView.builder(
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (_, index) {
                  if (index == snapshot.data!.length) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const PublicationFormPage()));
                      }, 
                      child: const Text("Add New Publication"),
                    );
                  }
                  else {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context, 
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("${snapshot.data![index].fields.title}"),
                                  content: Container(
                                    // decoration: const BoxDecoration(
                                    //   image: DecorationImage(
                                    //     image: NetworkImage(
                                    //       'https://i.ibb.co/nQYv36L/abstract-smooth-blur-background-backdrop-for-your-design-wallpaper-template-with-color-transition-gr.jpg'
                                    //     ),
                                    //     fit: BoxFit.cover,
                                    //   )
                                    // ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Author: ${snapshot.data![index].fields.authors}",
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "Issued: ${snapshot.data![index].fields.issued}",
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "Subjects: ${snapshot.data![index].fields.subjects}",
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "Language: ${snapshot.data![index].fields.language}",
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "Bookshelves: ${snapshot.data![index].fields.bookshelves}",
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "LoCc: ${snapshot.data![index].fields.loCc}",
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }, 
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.red[600]
                                      ),
                                      child: const Text(
                                        "Close",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    )
                                  ],
                                );
                              }
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Displaying the product name with specified style
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("by ${snapshot.data![index].fields.authors} -${snapshot.data![index].fields.language}")
                              ]
                            ),
                          ),
                        ),
                        if (index < snapshot.data!.length - 1) const Divider(),
                      ],
                    );
                  }
                }
              );
            }
          }
        },
      ),
    );
  }
}
