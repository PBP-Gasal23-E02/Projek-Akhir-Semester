import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/wishlist/models/model_wishlist.dart';

class DetailWishlistPage extends StatelessWidget {
  // The product being displayed on this page
  final Wishlist wishlist;

  // Constructor to initialize the DetailProductPage with a product
  const DetailWishlistPage({Key? key, required this.wishlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar to the product name
        title: Text(wishlist.fields.title),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Displaying the product name with specified style
            Text(
              wishlist.fields.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Displaying the product description
            Text('Description: ${wishlist.fields.description}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Navigating back when the FAB is pressed
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        // Adding an arrow back icon to the FAB
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
