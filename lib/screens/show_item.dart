import 'package:flutter/material.dart';
import 'package:gourmet_labs/models/item.dart';

class DetailProductPage extends StatelessWidget {
  // The product being displayed on this page
  final Product product;

  // Constructor to initialize the DetailProductPage with a product
  const DetailProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar to the product name
        title: Text(product.fields.name),
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
              product.fields.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Displaying the product price
            Text('Price: ${product.fields.price}'),
            const SizedBox(height: 20),
            // Displaying the product description
            Text('Description: ${product.fields.description}'),
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
