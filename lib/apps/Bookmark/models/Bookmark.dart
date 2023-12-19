// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Bookmark> productFromJson(String str) => List<Bookmark>.from(json.decode(str).map((x) => Bookmark.fromJson(x)));

String productToJson(List<Bookmark> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bookmark {
    String model;
    int pk;
    Fields fields;

    Bookmark({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
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
    dynamic title;
    String description;

    Fields({
        required this.user,
        required this.title,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "description": description,
    };
}
