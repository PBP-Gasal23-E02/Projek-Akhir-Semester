// Untuk melakukan parsing data JSON ini, gunakan
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

// Fungsi untuk mengonversi JSON menjadi daftar objek Wishlist
List<Wishlist> productFromJson(String str) =>
    List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

// Fungsi untuk mengonversi daftar objek Wishlist menjadi JSON
String productToJson(List<Wishlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Kelas model untuk merepresentasikan data Wishlist
class Wishlist {
  String model;
  int pk;
  Fields fields;

  Wishlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  // Fungsi untuk membuat objek Wishlist dari JSON
  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  // Fungsi untuk mengonversi objek Wishlist menjadi JSON
  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

// Kelas model untuk merepresentasikan data Fields dalam Wishlist
class Fields {
  int user;
  String title;
  DateTime dateAdded;
  String description;

  Fields({
    required this.user,
    required this.title,
    required this.dateAdded,
    required this.description,
  });

  // Fungsi untuk membuat objek Fields dari JSON
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        dateAdded: DateTime.parse(json["date_added"]),
        description: json["description"],
      );

  // Fungsi untuk mengonversi objek Fields menjadi JSON
  Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "description": description,
      };
}
