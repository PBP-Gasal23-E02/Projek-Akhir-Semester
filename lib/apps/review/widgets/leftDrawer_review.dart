// Importing necessary packages for Flutter and custom screens.
import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/review/screens/list_ReviewBuku.dart';
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/apps/review/screens/review_form.dart';
//import 'package:gourmet_labs/apps/review/screens/list_allwishlist.dart';

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
          // DrawerHeader with ScoobyMart branding and tagline.
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Review',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Unlock Worlds, One Page at a Time: Where Words Meet Wisdom in Every Review!",
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
            title: const Text('Home Page'),
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
            leading: const Icon(Icons.bookmark_add_rounded),
            title: const Text('Add a Review'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.stars),
            title: const Text('Show All Review'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyReviewPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
