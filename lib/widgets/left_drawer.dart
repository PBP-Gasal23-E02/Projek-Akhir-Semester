// Importing necessary packages for Flutter and custom screens.
import 'package:flutter/material.dart';
import 'package:gourmet_labs/screens/list_item.dart';
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/apps/YourBook/screens/menu.dart';
import 'package:gourmet_labs/apps/wishlist/screens/menu_wishlist.dart';
import 'package:gourmet_labs/apps/Bookmark/screens/menu_bookmark.dart';
import 'package:gourmet_labs/apps/review/screens/menu_ReviewBuku.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              children: [
                Text(
                  'GourmetLabs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Simplified inventory management and time-saving efficiency!",
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

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Main Page'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Show Items'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.book_sharp),
            title: const Text('Publication'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.playlist_add_circle),
            title: const Text('Review'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyReviewPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Wishlist'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWishlistPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.book_online_rounded),
            title: const Text('Yourbook'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YourBookPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.bookmark_add),
            title: const Text('Bookmark'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookmarkPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}