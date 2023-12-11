// To parse this JSON data, do
//
//     final buku = bukuFromJson(jsonString);

import 'dart:convert';

List<Buku> bukuFromJson(String str) =>
    List<Buku>.from(json.decode(str).map((x) => Buku.fromJson(x)));

String bukuToJson(List<Buku> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Buku {
  Model model;
  int pk;
  Fields fields;

  Buku({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String text;
  Type type;
  DateTime? issued;
  String title;
  Language language;
  String authors;
  String subjects;
  LoCc loCc;
  Bookshelves bookshelves;

  Fields({
    required this.text,
    required this.type,
    required this.issued,
    required this.title,
    required this.language,
    required this.authors,
    required this.subjects,
    required this.loCc,
    required this.bookshelves,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        text: json["Text"],
        type: typeValues.map[json["Type"]]!,
        issued: json["Issued"] == null ? null : DateTime.parse(json["Issued"]),
        title: json["Title"],
        language: languageValues.map[json["Language"]]!,
        authors: json["Authors"],
        subjects: json["Subjects"],
        loCc: loCcValues.map[json["LoCC"]]!,
        bookshelves: bookshelvesValues.map[json["Bookshelves"]]!,
      );

  Map<String, dynamic> toJson() => {
        "Text": text,
        "Type": typeValues.reverse[type],
        "Issued":
            "${issued!.year.toString().padLeft(4, '0')}-${issued!.month.toString().padLeft(2, '0')}-${issued!.day.toString().padLeft(2, '0')}",
        "Title": title,
        "Language": languageValues.reverse[language],
        "Authors": authors,
        "Subjects": subjects,
        "LoCC": loCcValues.reverse[loCc],
        "Bookshelves": bookshelvesValues.reverse[bookshelves],
      };
}

enum Bookshelves { COOKBOOKS_AND_COOKING }

final bookshelvesValues =
    EnumValues({"Cookbooks and Cooking": Bookshelves.COOKBOOKS_AND_COOKING});

enum Language { A, EN, EN_ENM, ES, NL }

final languageValues = EnumValues({
  "a": Language.A,
  "en": Language.EN,
  "en; enm": Language.EN_ENM,
  "es": Language.ES,
  "nl": Language.NL
});

enum LoCc { AC_TX, F106_TX, SF, TP, TS, TX }

final loCcValues = EnumValues({
  "AC; TX": LoCc.AC_TX,
  "F106; TX": LoCc.F106_TX,
  "SF": LoCc.SF,
  "TP": LoCc.TP,
  "TS": LoCc.TS,
  "TX": LoCc.TX
});

enum Type { TEXT }

final typeValues = EnumValues({"Text": Type.TEXT});

enum Model { MAIN_BUKU }

final modelValues = EnumValues({"main.buku": Model.MAIN_BUKU});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
