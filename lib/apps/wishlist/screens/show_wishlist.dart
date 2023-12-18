import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/wishlist/models/model_wishlist.dart';

// Halaman detail untuk menampilkan informasi lengkap Wishlist
class DetailWishlistPage extends StatelessWidget {
  final Wishlist wishlist;
  const DetailWishlistPage({Key? key, required this.wishlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul berdasarkan judul Wishlist
      appBar: AppBar(
        title: Text(wishlist.fields.title),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      // Body berisi informasi detail dari Wishlist
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Judul Wishlist
            Text(
              wishlist.fields.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Deskripsi Wishlist
            Text('Description: ${wishlist.fields.description}'),
            // Tanggal Wishlist ditambahkan
            Text('Date Added: ${wishlist.fields.dateAdded}'),
          ],
        ),
      ),
      // Floating action button untuk kembali ke halaman sebelumnya
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
