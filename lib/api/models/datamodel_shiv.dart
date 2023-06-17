// To parse this JSON data, do
//
//     final dataModelShiv = dataModelShivFromJson(jsonString);

import 'dart:convert';

DataModelShiv dataModelShivFromJson(String str) =>
    DataModelShiv.fromJson(json.decode(str));

String dataModelShivToJson(DataModelShiv data) => json.encode(data.toJson());

class DataModelShiv {
  bool success;
  DateTime data;

  DataModelShiv({
    required this.success,
    required this.data,
  });

  factory DataModelShiv.fromJson(Map<String, dynamic> json) => DataModelShiv(
        success: json["success"],
        data: DateTime.parse(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toIso8601String(),
      };
}
