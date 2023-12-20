// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<ReviewBuku> productFromJson(String str) =>
    List<ReviewBuku>.from(json.decode(str).map((x) => ReviewBuku.fromJson(x)));

String productToJson(List<ReviewBuku> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewBuku {
  String model;
  int pk;
  Fields fields;

  ReviewBuku({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory ReviewBuku.fromJson(Map<String, dynamic> json) => ReviewBuku(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String book;
  String reviewCust;

  Fields({
    required this.user,
    required this.book,
    required this.reviewCust,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        book: json["book"],
        reviewCust: json["review_cust"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "book": book,
        "review_cust": reviewCust,
      };
}
