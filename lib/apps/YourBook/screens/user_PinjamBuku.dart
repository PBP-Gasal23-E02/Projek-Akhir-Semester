import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:gourmet_labs/apps/YourBook/models/PinjamBuku.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/apps/YourBook/screens/one_PinjamBuku.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<List<PinjamBuku>> fetchProduct(
      CookieRequest request, String filter) async {
    final response = await request.postJson(
        "https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/YourBook/get-product-flutter/",
        jsonEncode(<String, String>{
          'name': 'dsa',
          'filter': filter,
        }));

    // melakukan konversi data json menjadi object Product
    List<PinjamBuku> list_product = [];
    for (var d in response) {
      if (d != null) {
        list_product.add(PinjamBuku.fromJson(d));
      }
    }
    return list_product;
  }

  String filter = "all";
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'all',
      '7',
      '14',
      '21',
    ];
    List<String> selectedCategories = [];
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buku'),
        ),
        // drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request, filter),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Daftar Buku",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Filter by durasi pinjam (paling lama):",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: categories
                                .map(
                                  (category) => FilterChip(
                                    label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          color: selectedCategories
                                                  .contains(category)
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    selected:
                                        selectedCategories.contains(category),
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          selectedCategories.add(category);
                                          filter = category;
                                        } else {
                                          selectedCategories.remove(category);
                                          filter = "";
                                        }
                                      });
                                    },
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                )
                                .toList(),
                          )),
                      // ListView.builder
                      Expanded(
                        child: ListView.builder(
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
                                  "Judul : ${snapshot.data![index].fields.judulBuku}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Petugas : ${snapshot.data![index].fields.petugas}"),
                                const SizedBox(height: 10),
                                Text(
                                    "Durasi Pinjam : ${snapshot.data![index].fields.durasiPinjam} hari"),
                                ElevatedButton(
                                  onPressed: () async {

                                    // Sending request to Django backend
                                    final response = await request.postJson(
                                    "https://gourmetlabs-e02-tk.pbp.cs.ui.ac.id/YourBook/delete-flutter/",
                                    jsonEncode(<String, String>{
                                      'name': "fsa",
                                      'id': snapshot.data![index].pk.toString(),
                                    }));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const UserPage()),
                                    );
                                  },
                                  child: Text("Kembalikan"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }
            }));
  }
}
