// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

// Function to convert a JSON string to a list of Wishlist objects
List<Wishlist> productFromJson(String str) =>
    List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

// Function to convert a list of Wishlist objects to a JSON string
String productToJson(List<Wishlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Wishlist class representing the main structure of the JSON data
class Wishlist {
  String model;
  int pk;
  Fields fields;

  // Constructor for the Wishlist class
  Wishlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  // Factory method to create a Wishlist object from a JSON map
  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  // Method to convert the Wishlist object to a JSON map
  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

// Fields class representing the 'fields' sub-object in the JSON data
class Fields {
  int user;
  String title;
  DateTime dateAdded;
  String description;

  // Constructor for the Fields class
  Fields({
    required this.user,
    required this.title,
    required this.dateAdded,
    required this.description,
  });

  // Factory method to create a Fields object from a JSON map
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        dateAdded: DateTime.parse(json["date_added"]),
        description: json["description"],
      );

  // Method to convert the Fields object to a JSON map
  Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "description": description,
      };
}
