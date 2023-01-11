import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class SchoolRepository {
  static var client = http.Client();

  static Future<List<dynamic>> getSchools() async {
    var url = Uri.parse("${apiendpoint}schools/active");

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> schools = data;
        return schools;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> getSchoolData({required school}) async {
    var url = Uri.parse("$apiendpoint$SCHOOLS/get/$school");

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return {};
      }
    } catch (_) {
      return {};
    }
  }
}
