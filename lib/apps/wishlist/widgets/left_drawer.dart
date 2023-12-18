import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/wishlist/screens/list_wishlist.dart';
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/apps/wishlist/screens/wishlist_form.dart';
import 'package:gourmet_labs/apps/wishlist/screens/list_allwishlist.dart';
import 'package:gourmet_labs/apps/wishlist/screens/menu_wishlist.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Drawer untuk aplikasi Wishlist
    return Drawer(
      child: ListView(
        children: [
          // Drawer header dengan branding GourmetLabs dan tagline.
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              children: [
                Text(
                  'Wishlist',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Unleash Your Inner Bookworm, Wishlist Wonders Await!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // ListTile untuk kembali ke halaman Beranda.
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Back to Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),

          // ListTile untuk kembali ke halaman Wishlist.
          ListTile(
            leading: const Icon(Icons.home_max_rounded),
            title: const Text('Back to Wishlist'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyWishlistPage(),
                  ));
            },
          ),

          // ListTile untuk menuju ke halaman 'Tambah Wishlist'.
          ListTile(
            leading: const Icon(Icons.bookmark_add_rounded),
            title: const Text('Add a Wishlist'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishlistFormPage(),
                  ));
            },
          ),

          // ListTile untuk menuju ke halaman 'Tampilkan Wishlist Anda'.
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Show Your Wishlist'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistPage()),
              );
            },
          ),

          // ListTile untuk menuju ke halaman 'Tampilkan Semua Wishlist'.
          ListTile(
            leading: const Icon(Icons.stars),
            title: const Text('Show All Wishlist'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllWishlistPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
