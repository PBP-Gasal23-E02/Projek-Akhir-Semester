import 'package:flutter/material.dart';
// import 'package:inventory_flutter/screens/itemlist_form.dart';
// import 'package:inventory_flutter/screens/list_item.dart';
// import 'package:inventory_flutter/screens/login.dart';
import 'package:gourmet_labs/apps/YourBook/screens/list_PinjamBuku.dart';
import 'package:gourmet_labs/apps/YourBook/screens/user_PinjamBuku.dart';
import 'package:gourmet_labs/apps/YourBook/screens/PinjamBukulist_form.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

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
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InventoryFormPage(),
                ));
          } else if (item.name == "Lihat Item berdasarkan user") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserPage(),
                ));
          } else if (item.name == "Lihat Item") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PinjamBukuListPage(),
                ));
          }
          // tambahkan else if baru seperti di bawah ini
          // else if (item.name == "Logout") {
          //         final response = await request.logout(
          //             "https://aaron-kwek-tugas.pbp.cs.ui.ac.id/auth/logout/");
          //         String message = response["message"];
          //         if (response['status']) {
          //           String uname = response["username"];
          //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //             content: Text("$message Sampai jumpa, $uname."),
          //           ));
          //           Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(builder: (context) => const LoginPage()),
          //           );
          //         } else {
          //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //             content: Text("$message"),
          //           ));
          //         }
          // }
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
