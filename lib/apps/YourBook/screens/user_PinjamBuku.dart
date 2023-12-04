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
Future<List<PinjamBuku>> fetchProduct(CookieRequest request) async {
  final response = await request.postJson(
                              "http://127.0.0.1:8000/YourBook/get-product-flutter/",
                              jsonEncode(<String, String>{
                                  'name':'dsa',
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

@override
Widget build(BuildContext context) {
  final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
        title: const Text('Buku'),
        ),
        // drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request),
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
                                    "durasi pinjam : ${snapshot.data![index].fields.durasiPinjam}"),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailsPage(
                                              item: snapshot.data![index],
                                            ),
                                          ));
                                    },
                                    child: Text("See Details"))
                              ],
                                ),
                            ));
                    }
                }
            }));
    }
}
