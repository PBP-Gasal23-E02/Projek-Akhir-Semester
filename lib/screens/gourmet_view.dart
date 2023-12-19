import 'package:flutter/material.dart';
import 'package:gourmet_labs/screens/list_item.dart';
import 'package:gourmet_labs/screens/menu.dart';
import 'package:gourmet_labs/widgets/left_drawer.dart';
import 'package:gourmet_labs/apps/YourBook/screens/menu.dart';
import 'package:gourmet_labs/apps/wishlist/screens/menu_wishlist.dart';
import 'package:gourmet_labs/apps/review/screens/menu_ReviewBuku.dart';

class ClickableNavigator extends StatelessWidget {
  const ClickableNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GourmetLabs'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView(
        children: [
          _buildListItem(
            context,
            Icons.home_outlined,
            'Main Page',
            MyHomePage(),
          ),
          _buildListItem(
            context,
            Icons.shopping_basket,
            'Show Items',
            const ProductPage(),
          ),
          _buildListItem(
            context,
            Icons.book_sharp,
            'Publication',
            const ProductPage(),
          ),
          _buildListItem(
            context,
            Icons.playlist_add_circle,
            'Review',
            MyReviewPage(),
          ),
          _buildListItem(
            context,
            Icons.star,
            'Wishlist',
            MyWishlistPage(),
          ),
          _buildListItem(
            context,
            Icons.book_online_rounded,
            'Yourbook',
            YourBookPage(),
          ),
          _buildListItem(
            context,
            Icons.bookmark_add,
            'Bookmark',
            const ProductPage(),
          ),
        ],
      ),
    );
  }

  ListTile _buildListItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ClickableNavigator(),
  ));
}
