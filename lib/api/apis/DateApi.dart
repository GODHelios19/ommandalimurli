import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/DateModel.dart';
import '../model/SecondModel.dart';
import 'constant/Constant.dart';

class DateApi {
  static Future<DateModel> fetchDates() async {
    final response = await http.get(Uri.parse(
        "https://api.ommandalimurli.in/api/v1/murli/shivbaba-murli/getallshiv"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final users = DateModel.fromJson(jsonData);
      return users;
    } else {
      throw Exception(
          "Failed to fetch user, something went wrong${response.statusCode}");
    }
  }

  static Future<SecondModel> fetchApi2() async {
    final response = await http.get(Uri.parse(
        "https://api.ommandalimurli.in/api/v1/murli/shivbaba-murli/d/:$lastValue?lang=hi"));

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final users = SecondModel.fromJson(jsonData);
      return users;
    } else {
      throw Exception(
          "Failed to fetch user, something went wrong${response.statusCode}");
    }
  }
}
