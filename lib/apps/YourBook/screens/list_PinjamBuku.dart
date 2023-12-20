import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gourmet_labs/apps/YourBook/models/Buku.dart';

class BukuListPage extends StatefulWidget {
  const BukuListPage({Key? key}) : super(key: key);

  @override
  _BukuListPageState createState() => _BukuListPageState();
}

class _BukuListPageState extends State<BukuListPage> {
  Future<List<Buku>> fetchProduct2() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url =
        Uri.parse('https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/api/books/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // melakukan konversi data json menjadi object Product
    List<Buku> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Buku.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Koleksi Buku'),
        ),
        // drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct2(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data buku.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Judul : ${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Author : ${snapshot.data![index].fields.authors}"),
                                const SizedBox(height: 10),
                                Text(
                                    "bahasa : ${snapshot.data![index].fields.language}"),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
