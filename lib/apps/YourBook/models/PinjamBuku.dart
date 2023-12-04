// To parse this JSON data, do
//
//     final pinjamBuku = pinjamBukuFromJson(jsonString);

import 'dart:convert';

List<PinjamBuku> pinjamBukuFromJson(String str) =>
    List<PinjamBuku>.from(json.decode(str).map((x) => PinjamBuku.fromJson(x)));

String pinjamBukuToJson(List<PinjamBuku> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PinjamBuku {
  String model;
  int pk;
  Fields fields;

  PinjamBuku({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory PinjamBuku.fromJson(Map<String, dynamic> json) => PinjamBuku(
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
  int buku;
  String petugas;
  String judulBuku;
  int durasiPinjam;
  String catatanPeminjaman;

  Fields({
    required this.user,
    required this.buku,
    required this.petugas,
    required this.judulBuku,
    required this.durasiPinjam,
    required this.catatanPeminjaman,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        buku: json["buku"],
        petugas: json["petugas"],
        judulBuku: json["judul_buku"],
        durasiPinjam: json["durasi_pinjam"],
        catatanPeminjaman: json["catatan_peminjaman"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "buku": buku,
        "petugas": petugas,
        "judul_buku": judulBuku,
        "durasi_pinjam": durasiPinjam,
        "catatan_peminjaman": catatanPeminjaman,
      };
}
