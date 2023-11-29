// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

// Function to convert a JSON string to a list of Product objects
List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// Function to convert a list of Product objects to a JSON string
String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Product class representing the main structure of the JSON data
class Product {
  String model;
  int pk;
  Fields fields;

  // Constructor for the Product class
  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  // Factory method to create a Product object from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  // Method to convert the Product object to a JSON map
  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

// Fields class representing the 'fields' sub-object in the JSON data
class Fields {
  int user;
  String name;
  DateTime dateAdded;
  int price;
  String description;

  // Constructor for the Fields class
  Fields({
    required this.user,
    required this.name,
    required this.dateAdded,
    required this.price,
    required this.description,
  });

  // Factory method to create a Fields object from a JSON map
  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        price: json["price"],
        description: json["description"],
      );

  // Method to convert the Fields object to a JSON map
  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "price": price,
        "description": description,
      };
}
