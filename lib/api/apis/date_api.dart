import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ommandalinurli/api/models/datamodel_shiv.dart';

class DateApi {
  static Future<List<DataModelShiv>> fetchDates() async {
    final response = await http.get(Uri.parse(
        "https://api.ommandalimurli.in/api/v1/murli/shivbaba-murli/getallshiv"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      final dates =
          jsonData.map((json) => DataModelShiv.fromJson(json)).toList();
      return dates;
    } else {
      throw Exception(
          "Failes to fatch Dates, something went wrong${response.statusCode}");
    }
  }
}
