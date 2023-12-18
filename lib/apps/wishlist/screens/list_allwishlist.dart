// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gourmet_labs/apps/wishlist/models/model_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/screens/show_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/widgets/left_drawer.dart';

class AllWishlistPage extends StatefulWidget {
  const AllWishlistPage({Key? key}) : super(key: key);

  @override
  _AllWishlistPageState createState() => _AllWishlistPageState();
}

class _AllWishlistPageState extends State<AllWishlistPage> {
  // Fungsi asynchronous untuk mengambil data wishlist dari API
  Future<List<Wishlist>> fetchProduct() async {
    var url =
        Uri.parse('https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/wishlist/json/');
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Wishlist List'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        // Memanggil fungsi fetchProduct() secara asynchronous
        future: fetchProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            // Menampilkan indikator loading jika data masih diambil
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              // Menampilkan pesan jika tidak ada data wishlist
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
              // Menampilkan daftar wishlist dalam ListView.builder
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Column(
                  children: [
                    // Menambahkan GestureDetector untuk menavigasi ke halaman detail saat item di-tap
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
                            Text(
                              // Menampilkan judul wishlist dengan ikon bintang
                              " ★ ${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Menambahkan pemisah antar item wishlist
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
