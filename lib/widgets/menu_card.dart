// Importing necessary packages for Flutter and custom screens.
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_labs/screens/list_item.dart';
import 'package:gourmet_labs/screens/login.dart';
import 'package:gourmet_labs/screens/gourmet_form.dart';

// Defining a class to represent items in the shop.
class ShopItem {
  final String index;
  final String name;
  final IconData icon;
  final Color color;

  // Constructor for the ShopItem class.
  ShopItem(this.index, this.name, this.icon, this.color);
}

// Defining a class to represent individual items in the shop.
class Items {
  final String name;
  final int price;
  final String description;

  // Constructor for the Items class.
  Items({required this.name, required this.price, required this.description});
}

// A stateless widget representing a card in the shop.
class ShopCard extends StatelessWidget {
  final ShopItem item;

  // Constructor for the ShopCard class.
  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
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
          if (item.name == "Add an Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()),
            );
          } else if (item.name == "Show Items") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Goodbye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.index,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
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
