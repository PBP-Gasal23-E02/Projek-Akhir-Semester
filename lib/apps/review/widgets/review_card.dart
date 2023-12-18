// Importing necessary packages for Flutter and custom screens.
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/apps/review/screens/list_ReviewBuku.dart';
import 'package:gourmet_labs/apps/review/screens/review_form.dart';
import 'package:gourmet_labs/screens/menu.dart';

// Defining a class to represent items in the shop.
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  // Constructor for the ShopItem class.
  ShopItem(this.name, this.icon, this.color);
}

// Defining a class to represent individual items in the shop.
class Items {
  final String book;
  final String review_cust;

  // Constructor for the Items class.
  Items({required this.book, required this.review_cust});
}

// A stateless widget representing a card in the shop.
class ShopCard extends StatelessWidget {
  final ShopItem item;

  // Constructor for the ShopCard class.
  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () async {
          // Displaying a SnackBar when the card is tapped.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have pressed the ${item.name} button!")));

          // Navigating to the appropriate route based on the button pressed.
          if (item.name == "Add Review Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()),
            );
          } else if (item.name == "Read Review") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyReviewPage()));
          } else if (item.name == "Back to Home") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyHomePage()));
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