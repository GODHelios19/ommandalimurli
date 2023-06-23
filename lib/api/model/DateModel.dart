// To parse this JSON data, do
//
//     final dateModel = dateModelFromJson(jsonString);

import 'dart:convert';

DateModel dateModelFromJson(String str) => DateModel.fromJson(json.decode(str));

String dateModelToJson(DateModel data) => json.encode(data.toJson());

class DateModel {
  bool success;
  List<String> data;

  DateModel({
    required this.success,
    required this.data,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
    success: json["success"],
    data: List<String>.from(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data),
  };
}
