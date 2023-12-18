// Importing necessary packages for Flutter and custom screens.
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/apps/wishlist/screens/list_wishlist.dart';
import 'package:gourmet_labs/apps/wishlist/screens/wishlist_form.dart';

// Class untuk merepresentasikan item di layar utama.
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

// Class untuk merepresentasikan informasi item.
class Items {
  final String name;
  final String description;

  Items({required this.name, required this.description});
}

// Widget untuk menampilkan item dalam bentuk card.
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have pressed the ${item.name} button!")));

          // Navigasi berdasarkan nama item.
          if (item.name == "Add a Wishlist") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WishlistFormPage()),
            );
          } else if (item.name == "Show Your Wishlist") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WishlistPage()));
          } else if (item.name == "Show All Wishlist") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WishlistPage()));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
