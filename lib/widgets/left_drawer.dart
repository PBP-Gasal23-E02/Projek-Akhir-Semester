// Importing necessary packages for Flutter and custom screens.
import 'package:flutter/material.dart';
import 'package:gourmet_labs/screens/list_item.dart';
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/screens/gourmet_form.dart';
import 'package:gourmet_labs/screens/gourmet_show.dart';
import 'package:gourmet_labs/apps/YourBook/screens/menu.dart';
import 'package:gourmet_labs/apps/wishlist/screens/menu_wishlist.dart';

// A stateless widget representing the left drawer of the application.
class LeftDrawer extends StatelessWidget {
  // Constructor for the LeftDrawer class.
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Creating a Drawer with a ListView to display the menu items.
    return Drawer(
      child: ListView(
        children: [
          // DrawerHeader with GourmetLabs branding and tagline.
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
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

          // ListTile for navigating to the main page.
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

          // ListTile for navigating to the 'Add an Item' screen.
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add an Item'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Show Items'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Publication'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Review'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Wishlist'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWishlistPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Yourbook'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YourBookPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Bookmark'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
