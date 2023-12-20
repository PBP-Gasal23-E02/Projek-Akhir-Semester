
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
  final ScrollController _scrollController = ScrollController();
  // Function to fetch product data from the server
  Future<List<Buku>> fetchUserPublication() async {
    var url = Uri.parse('https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/publication/json/');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",     
      },
    );

    if (response.statusCode == 200) {
      // Decode the JSON response
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // Convert the JSON data to a list of Publication objects
      List<Buku> listItem = [];
      for (var item in data) {
        if (item != null) {
          listItem.add(Buku.fromJson(item));
        }
      }

      return listItem;

    } else {
      // If the request was not successful, throw an exception or handle the error accordingly
      throw Exception('Failed to load user publications');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the scaffold for the product page
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 235, 213),
      appBar: AppBar(
        title: const Text('Your Publication'),
        backgroundColor: const Color.fromARGB(255, 34, 45, 130),
        foregroundColor: Colors.white,
      ),
      // Adding a left drawer to the scaffold
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        // Using FutureBuilder to handle asynchronous data fetching
        future: fetchUserPublication(),
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
                controller: _scrollController,
                itemCount: snapshot.data!.length + 2,
                itemBuilder: (_, index) {
                  if (index == snapshot.data!.length + 1) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: const Text("Back to Menu"),
                      )
                    );
                  }
                  else if (index == snapshot.data!.length) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => const PublicationFormPage()));
                        }, 
                        child: const Text("Add New Publication"),
                      )
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
                                  backgroundColor: const Color.fromARGB(255, 88, 202, 255),
                                  title: Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Book's Detail:",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "- Author: ${snapshot.data![index].fields.authors}",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "- Issued: ${snapshot.data![index].fields.issued}",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "- Subjects: ${snapshot.data![index].fields.subjects}",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "- ${snapshot.data![index].fields.language}",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "- ${snapshot.data![index].fields.bookshelves}",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          "- ${snapshot.data![index].fields.loCc}",
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                      ],
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
                          child: Align(
                            alignment: Alignment.centerLeft,
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
                                    "• ${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text("by ${snapshot.data![index].fields.authors}"),
                                  const SizedBox(height: 10),
                                  Text("- ${snapshot.data![index].fields.language}")
                                ]
                              ),
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
