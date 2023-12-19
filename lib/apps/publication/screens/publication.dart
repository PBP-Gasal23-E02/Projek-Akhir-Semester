import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/publication/widgets/publication_card.dart';
import 'package:gourmet_labs/widgets/left_drawer.dart';

class YourBookPage extends StatelessWidget {
  YourBookPage({Key? key}) : super(key: key);

  final List<PublicationItem> items = [
    PublicationItem("Add New Publication", Icons.book_outlined, Colors.red),
    PublicationItem("Your Publication", Icons.my_library_add_rounded, Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YourBook',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Kategori Buku Masak', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((PublicationItem item) {
                  // Iterasi untuk setiap item
                  return PublicationCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
