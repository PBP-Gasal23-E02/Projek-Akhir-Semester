import 'package:flutter/material.dart';
import 'package:gourmet_labs/apps/review/models/ReviewBuku.dart';

class DetailReviewPage extends StatelessWidget {
  final ReviewBuku review;

  const DetailReviewPage({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(review.fields.book),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              review.fields.book,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text('Book: ${review.fields.book}'),
            const SizedBox(height: 20),
            Text('Review: ${review.fields.reviewCust}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
