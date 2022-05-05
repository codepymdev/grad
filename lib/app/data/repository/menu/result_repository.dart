import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ResultRepository {
  static var client = http.Client();

  static Future<List<dynamic>> classSubjects({
    required school,
    required classId,
  }) async {
    var url = Uri.parse("$GRAD" + "results/class-subjects/$school/$classId");
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
      throw Exception('Failed to load data');
    }
  }
}
