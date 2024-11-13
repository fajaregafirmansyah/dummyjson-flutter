import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? code;
  String? info;
  List<Datum>? data;

  UserModel({
    this.code,
    this.info,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    code: json["code"],
    info: json["info"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "info": info,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? nama;
  String? kasus;
  String? detail;
  String? jabatan;

  Datum({
    this.id,
    this.nama,
    this.kasus,
    this.detail,
    this.jabatan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    kasus: json["kasus"],
    detail: json["detail"],
    jabatan: json["jabatan"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "kasus": kasus,
    "detail": detail,
    "jabatan": jabatan,
  };
}
