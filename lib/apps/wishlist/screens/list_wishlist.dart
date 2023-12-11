// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gourmet_labs/apps/wishlist/models/model_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/screens/show_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/widgets/left_drawer.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // Function to fetch product data from the server
  Future<List<Wishlist>> fetchProduct() async {
    var url = Uri.parse('http://127.0.0.1:8000/wishlist/get-wishlist/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Wishlist> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Wishlist.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    // Building the scaffold for the product page
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: Colors.pink,
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
                    "No book data.",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              // Building a ListView to display the fetched product items
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Column(
                  children: [
                    // GestureDetector to navigate to the detail page on tap
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailWishlistPage(
                              wishlist: snapshot.data![index],
                            ),
                          ),
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
                              " - ${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Adding a Divider after each item except for the last one
                    if (index < snapshot.data!.length - 1) const Divider(),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
