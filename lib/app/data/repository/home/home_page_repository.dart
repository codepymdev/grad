import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class HomePageRepository {
  static var client = http.Client();

  static Future<List<dynamic>> getPeople({
    required school,
    required campus,
    required r,
    required type,
    required per_page,
    required page,
  }) async {
    var url =
        Uri.parse("$GRAD$PEOPLE/get/$school/$campus/$r/$type/$per_page/$page");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      return [
        {"status": false, "message": "Oops, there was an error"}
      ];
    }
  }

  static Future<Map<String, dynamic>> getCounter({
    required school,
    required campus,
    required r,
  }) async {
    var url = Uri.parse("$GRAD$COUNTER/$school/$campus/$r");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }
}
