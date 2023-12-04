import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/YourBook/models/PinjamBuku.dart';

class DetailsPage extends StatelessWidget {
  final PinjamBuku item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details Page',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Judul : ${item.fields.judulBuku}",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Petugas : ${item.fields.petugas}"),
            const SizedBox(height: 10),
            Text("Durasi Pinjam : ${item.fields.durasiPinjam}"),
            const SizedBox(height: 10),
            Text("Catatan : ${item.fields.catatanPeminjaman}"),
            const SizedBox(height: 10),
            Text("User id : ${item.fields.user}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
