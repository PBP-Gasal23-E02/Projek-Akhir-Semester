import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/wishlist/widgets/left_drawer.dart';
import 'package:gourmet_labs/apps/wishlist/widgets/menu_card.dart';

// Halaman utama untuk manajemen Wishlist
class MyWishlistPage extends StatelessWidget {
  MyWishlistPage({Key? key}) : super(key: key);

  // Daftar item menu untuk Wishlist
  final List<ShopItem> items = [
    ShopItem("Show Your Wishlist", Icons.star, Colors.pink),
    ShopItem("Add a Wishlist", Icons.bookmark_add_rounded, Colors.lightGreen),
    ShopItem("Show All Wishlist", Icons.stars, Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar untuk halaman Wishlist
      appBar: AppBar(
        title: const Text(
          'Wishlist',
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // Drawer untuk navigasi ke halaman lain
      drawer: const LeftDrawer(),
      // Body berisi konten utama halaman Wishlist
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              // Pesan selamat datang di halaman Wishlist
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to Wishlist!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Gridview untuk menampilkan item-menu Wishlist
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
