import 'package:flutter/material.dart';
// import 'package:inventory_flutter/screens/itemlist_form.dart';
// import 'package:inventory_flutter/screens/list_item.dart';
// import 'package:inventory_flutter/screens/login.dart';
// import 'package:gourmet_labs/apps/YourBook/screens/list_PinjamBuku.dart';
import 'package:gourmet_labs/apps/publication/screens/new_publication.dart';
import 'package:gourmet_labs/apps/publication/screens/your_publication.dart';
// import 'package:gourmet_labs/apps/YourBook/screens/PinjamBukulist_form.dart';

class PublicationItem {
  final String name;
  final IconData icon;
  final Color color;

  PublicationItem(this.name, this.icon, this.color);
}

class PublicationCard extends StatelessWidget {
  final PublicationItem item;

  const PublicationCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add New Publication") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PublicationFormPage(),
                ));
          } else if (item.name == "Your Publication") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const YourPublication(),
                ));
          } else if (item.name == "Back to Main Page") {
            Navigator.pop(context);
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
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
