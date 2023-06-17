// To parse this JSON data, do
//
//     final dataModelShiv = dataModelShivFromJson(jsonString);

import 'dart:convert';

DataModelShiv dataModelShivFromJson(String str) =>
    DataModelShiv.fromJson(json.decode(str));

String dataModelShivToJson(DataModelShiv data) => json.encode(data.toJson());

class DataModelShiv {
  bool success;
  Data data;

  DataModelShiv({
    required this.success,
    required this.data,
  });

  factory DataModelShiv.fromJson(Map<String, dynamic> json) => DataModelShiv(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  DateTime date;
  String title;
  String month;
  String year;
  String lang;
  String murli;
  String pdfLink;
  int v;

  Data({
    required this.id,
    required this.date,
    required this.title,
    required this.month,
    required this.year,
    required this.lang,
    required this.murli,
    required this.pdfLink,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        month: json["month"],
        year: json["year"],
        lang: json["lang"],
        murli: json["murli"],
        pdfLink: json["pdfLink"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date.toIso8601String(),
        "title": title,
        "month": month,
        "year": year,
        "lang": lang,
        "murli": murli,
        "pdfLink": pdfLink,
        "__v": v,
      };
}
